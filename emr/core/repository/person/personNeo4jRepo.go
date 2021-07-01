package repository

import (
	"errors"
	"log"
	"time"

	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	uuid "github.com/satori/go.uuid"

	entity "github.com/heykidhealth/emr/core/entity/person"
	"github.com/heykidhealth/emr/infrastructure/db"
	"github.com/heykidhealth/emr/infrastructure/utils"
)

const (
	create string = "create"
	update string = "update"
)

type personNeo4j struct{}

var (
	personNeo4jDb db.Neo4jSession = db.NewNeo4jSession()
)

func NewPersonNeo4jRepository() PersonRepository {
	return &personNeo4j{}
}

//Look for a person by the id and returns basic information
//abou her/him
func (*personNeo4j) FindById(id string) (*entity.Person, error) {
	if id == "" {
		log.Printf("person.FindById.error: <%v> %v", id, entity.ERROR_ID_PERSON_MISSING)
		return &entity.Person{}, errors.New(entity.ERROR_ID_PERSON_MISSING)
	}

	var tx neo4j.Transaction
	tx, err := startTransaction("FindById", db.AccessRead)
	if err != nil {
		return &entity.Person{}, err
	}
	defer personNeo4jDb.Session.Close()
	defer tx.Rollback()

	thisGuy := entity.Person{}
	cypher := `
				MATCH (one:Person {uuid: $uuid}) 		
				WITH one 	
				MATCH (one)-[:BIRTH]->(dob:Day) 
				RETURN 
					one.uuid As uuid,  
					one.name AS name, 
					one.middleName AS middleName, 
					one.lastName AS lastName, 
					one.gender AS gender, 
					one.email AS email, 
					dob.date AS dob, 
					duration.between(date(dob.date), date()).months AS ageInMonths, 
					duration.between(date(dob.date), date()).years AS ageInYears,
					one.updatedAt AS updatedAt,
					one.createdAt AS createdAt
		`
	params := map[string]interface{}{
		"uuid": id,
	}
	result, err := tx.Run(cypher, params)
	if err == nil {
		thisGuy, err = readPersonResultset("FindById", result)
		if err != nil {
			return &entity.Person{}, err
		}
	}

	//if the transaction ran smoothly, the commit it
	err = finishTransaction("FindById", tx)
	if err != nil {
		return &entity.Person{}, err
	}

	log.Printf("person.FindById: id <%v> returned", thisGuy.ID)
	personNeo4jDb.Session.Close()

	return &thisGuy, nil
}

//Add a new person and link him/her to the proper family. It is important
//to notice that a person should not be added in duplicity.
//In this sense, an error should be raised and the proper method should be called
func (*personNeo4j) Add(person *entity.Person) (*entity.Person, error) {
	if person.ID != "" {
		log.Printf("person.Add.error: <%v> %v", person.ID, entity.ERROR_ID_PERSON_EXISTS)
		return &entity.Person{}, errors.New(entity.ERROR_ID_PERSON_EXISTS)
	}

	err := person.IsValid()
	if err != nil {
		log.Printf("person.Add.error: %v", err.Error())
		return &entity.Person{}, err
	}

	var tx neo4j.Transaction
	tx, err = startTransaction("Add", db.AccessWrite)
	if err != nil {
		return &entity.Person{}, err
	}
	defer personNeo4jDb.Session.Close()
	defer tx.Rollback()

	//persist the person in the database
	person.ID = uuid.NewV4().String()
	person.Responsible = entity.Someone
	person.CreatedAt = time.Now()
	person.UpdatedAt = time.Now()
	thisGuy, err := persistPerson("Add", person, tx)
	if err != nil {
		log.Printf("person.Add.error: %v", err.Error())
		log.Println("person.Add.error: entire transaction canceled")
		return &entity.Person{}, err
	}

	//if the transaction ran smoothly, then commit it
	err = finishTransaction("Add", tx)
	if err != nil {
		return &entity.Person{}, err
	}

	log.Printf("person.Add: id <%v> created for person %v %v", person.ID, person.Name, person.LastName)
	personNeo4jDb.Session.Close()

	return &thisGuy, nil
}

//Update an existing person.
//In this sense, an error should be raised and the proper method should be called
func (*personNeo4j) Update(id string, person *entity.Person) (*entity.Person, error) {
	if id == "" {
		log.Printf("person.Update.error: <%v> %v", id, entity.ERROR_ID_PERSON_MISSING)
		return &entity.Person{}, errors.New(entity.ERROR_ID_PERSON_MISSING)
	}

	err := person.IsValid()
	if err != nil {
		log.Printf("person.Update.error: %v", err.Error())
		return &entity.Person{}, err
	}
	
	var tx neo4j.Transaction
	tx, err = startTransaction("Update", db.AccessWrite)
	if err != nil {
		return &entity.Person{}, err
	}
	defer personNeo4jDb.Session.Close()
	defer tx.Rollback()
	
	//remove previous day of birth from this user
	//until I figure out a better way to do this
	err = resolveBirthDay(id, tx)
	if err != nil {
		log.Printf("person.Update.resolveBirthDay.error: %v", err.Error())
		log.Println("person.Update.resolveBirthDay.error: entire transaction canceled")
		return &entity.Person{}, err
	}
	
	person.ID = id
	person.UpdatedAt = time.Now()
	thisGuy, err := persistPerson("Update", person, tx)
	if err != nil {
		log.Printf("person.Update.error: %v", err.Error())
		log.Println("person.Update.error: entire transaction canceled")
		return &entity.Person{}, err
	}

	//if the transaction ran smoothly, then commit it
	err = finishTransaction("Update", tx)
	if err != nil {
		return &entity.Person{}, err
	}

	log.Printf("person.Update: id <%v> created for person %v %v", person.ID, person.Name, person.LastName)
	personNeo4jDb.Session.Close()

	return &thisGuy, nil
}

//############
//local methods
//		||
//		\/

func persistPerson(action string, person *entity.Person, tx neo4j.Transaction) (entity.Person, error) {
	thisGuy := entity.Person{}
	cypher := `
			MERGE (one:Person {uuid: $uuid}) 
			ON CREATE SET 
				one.name = $name, 
				one.fullName = TOLOWER(REPLACE($name, ' ', '') + REPLACE($middleName, ' ', '') + REPLACE($lastName, ' ', '')), 
				one.gender = $gender, 
				one.email = $email, 
				one.middleName = $middleName, 
				one.lastName = $lastName, 
				one.createdAt = $created, 
				one.updatedAt = $updated 
			ON MATCH SET 
				one.gender = $gender, 
				one.name = $name, 
				one.email = $email, 
				one.middleName = $middleName, 
				one.lastName = $lastName, 
				one.updatedAt = $updated 
			WITH one 
			MATCH (dob:Day {uuid: $dob}) 
			MERGE (one)-[:BIRTH]->(dob) 
			SET 
				one.ageInMonths = duration.between(date(dob.date), date()).months, 
				one.ageInYears = duration.between(date(dob.date), date()).years 
			RETURN 
				one.uuid As uuid,  
				one.name AS name, 
				one.middleName AS middleName, 
				one.lastName AS lastName, 
				one.gender AS gender, 
				one.email AS email, 
				dob.date AS dob, 
				one.ageInMonths AS ageInMonths, 
				one.ageInYears AS ageInYears,
				one.updatedAt AS updatedAt,
				one.createdAt AS createdAt 
	`
	params := map[string]interface{}{
		"uuid":       person.ID,
		"name":       person.Name,
		"middleName": person.MiddleName,
		"lastName":   person.LastName,
		"gender":     person.Gender,
		"email":      person.Email,
		"dob":        person.DOB.Format(utils.LayoutBRShort),
		"created":    person.CreatedAt.Format(utils.LayoutBRShort),
		"updated":    person.UpdatedAt.Format(utils.LayoutBRShort),
	}
	result, err := tx.Run(cypher, params)
	if err == nil {
		thisGuy, err = readPersonResultset(action, result)
		if err != nil {
			return entity.Person{}, err
		}
	}

	return thisGuy, err
}

func resolveBirthDay(id string, tx neo4j.Transaction) error {
	cypher := "MATCH (one:Person {uuid: $uuid}) " +
		"MATCH (one)-[bday:BIRTH]->(:Day) " +
		"DELETE bday"
	params := map[string]interface{}{
		"uuid": id,
	}
	_, err := tx.Run(cypher, params)
	return err
}
