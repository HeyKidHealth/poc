package repository

import (
	"errors"
	"log"
	"time"

	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j/dbtype"
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
	//personNeo4jDb = db.NewNeo4jSession()
	if err := personNeo4jDb.Connect(db.AccessRead); err != nil {
		log.Printf("person.FindById.Connect.error: %v", err)
		return &entity.Person{}, err
	}

	if err := personNeo4jDb.IsValid(); err != nil {
		log.Printf("person.FindById.IsValid.error: %v", err)
		return &entity.Person{}, err
	}
	defer personNeo4jDb.Session.Close()

	tx, err := personNeo4jDb.Session.BeginTransaction()
	if err != nil {
		log.Printf("person.FindById.BeginTransaction.error: %v", err)
		return &entity.Person{}, err
	}
	defer tx.Rollback()

	cypher := "MATCH (one:Person {uuid: $uuid}) " +
		"WITH one " +
		"MATCH (one)-[:BIRTH]->(dob:Day) " +
		"RETURN one.uuid As uuid, one.name AS name, one.middleName AS middleName, one.lastName AS lastName, one.gender AS gender, one.email AS email, dob.date AS dob "
	params := map[string]interface{}{
		"uuid": id,
	}
	result, err := tx.Run(cypher, params)
	if err != nil {
		log.Printf("person.FindById.Run.error: %v", err)
		return &entity.Person{}, err
	}

	found := false
	thisGuy, err := readResultset(result)

	err = tx.Commit()
	if err != nil {
		log.Printf("person.FindById.Commit.error: %v", err)
		return &entity.Person{}, err
	}

	err = tx.Close()
	if err != nil {
		log.Printf("person.FindById.Close.error: %v", err)
		return &entity.Person{}, err
	}

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
		log.Printf("person.Add.error: %v", err)
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
	thisGuy, err := persistPerson(person, tx)
	if err != nil {
		log.Printf("person.Add.error: %v", err)
		log.Println("person.Add.error: entire transaction canceled")
		return &entity.Person{}, err
	}

	//if everything is OK, then commit at once
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
	if person.ID != "" {
		log.Printf("person.Update.error: <%v> %v", person.ID, entity.ERROR_ID_PERSON_MISSING)
		return &entity.Person{}, errors.New(entity.ERROR_ID_PERSON_MISSING)
	}

	err := person.IsValid()
	if err != nil {
		log.Printf("person.Update.error: %v", err)
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
	err = resolveBirthDay(person.ID, tx)
	if err != nil {
		log.Printf("person.Update.resolveBirthDay.error: %v", err)
		log.Println("person.Update.resolveBirthDay.error: entire transaction canceled")
		return &entity.Person{}, err
	}
	personNeo4jDb.Session.Close()

	return person, nil
}

//############
//local methods
//		||
//		\/

func startTransaction(action string, accessMode int) (neo4j.Transaction, error) {
	//personNeo4jDb = db.NewNeo4jSession()
	if err := personNeo4jDb.Connect(accessMode); err != nil {
		log.Printf("person.%v.Connect.error: %v", action, err.Error())
		return nil, err
	}

	if err := personNeo4jDb.IsValid(); err != nil {
		log.Printf("person.%v.IsValid.error: %v", action, err.Error())
		return nil, err
	}

	var tx neo4j.Transaction
	tx, err := personNeo4jDb.Session.BeginTransaction()
	if err != nil {
		log.Printf("person.%v.BeginTransaction.error: %v", action, err.Error())
		return nil, err
	}

	return tx, nil
}

func finishTransaction(action string, tx neo4j.Transaction) error {
	err := tx.Commit()
	if err != nil {
		log.Printf("person.%v.Commit.error: %v", action, err)
		log.Printf("person.%v.Commit.error: entire transaction canceled", action)
		return err
	}

	err = tx.Close()
	if err != nil {
		log.Printf("person.%v.Close.error: %v", action, err)
		return err
	}

	return nil
}

func persistPerson(person *entity.Person, tx neo4j.Transaction) (entity.Person, error) {
	thisGuy := entity.Person{}
	person.Responsible = entity.Someone
	person.CreatedAt = time.Now()
	person.UpdatedAt = time.Now()

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
				one.ageInYears AS ageInYears 
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
		thisGuy, err = readResultset("Add", result)
		if err != nil {
			return entity.Person{}, err
		}
	}

	return thisGuy, err
}

func readResultset(action string, result neo4j.Result) (entity.Person, error) {
	var (
		dob2       dbtype.Date
		createdAt2 dbtype.Date
		updatedAt2 dbtype.Date
		found      bool
		thisGuy    entity.Person
	)
	found =false
	thisGuy =entity.Person{}

	for result.Next() {
		record := result.Record()
		uuid, ok := record.Get("uuid")
		name, ok := record.Get("name")
		middleName, ok := record.Get("middleName")
		lastName, ok := record.Get("lastName")
		email, ok := record.Get("email")
		if !ok || email == nil {
			email = ""
		}
		gender, ok := record.Get("gender")
		if !ok || gender == nil {
			gender = ""
		}
		ageInYears, ok := record.Get("ageInYears")
		if !ok || ageInYears == nil {
			ageInYears = "0"
		}
		ageInMonths, ok := record.Get("ageInMonths")
		if !ok || ageInMonths == nil {
			ageInMonths = "0"
		}
		updatedAt, ok := record.Get("updatedAt") //here is a little tricky
		if updatedAt != nil && ok {
			updatedAt2 = updatedAt.(dbtype.Date)
		}
		if !ok || updatedAt == nil {
			updatedAt2 = dbtype.Date{}
		}
		createdAt, ok := record.Get("createdAt") //here is a little tricky
		if createdAt != nil && ok {
			createdAt2 = createdAt.(dbtype.Date)
		}
		if !ok || createdAt == nil {
			createdAt2 = dbtype.Date{}
		}

		found = true
		thisGuy = entity.Person{
			ID:          uuid.(string),
			Name:        name.(string),
			MiddleName:  middleName.(string),
			LastName:    lastName.(string),
			Email:       email.(string),
			Gender:      gender.(string),
			DOB:         time.Time(dob2), // that gave me 2 entire days of a huge headache
			AgeInMonths: ageInMonths.(int),
			Age:         ageInYears.(int),
			UpdatedAt:   time.Time(updatedAt2),
			CreatedAt:   time.Time(createdAt2),
		}
	}

	if thisGuy.ID == "" || !found {
		err := errors.New(entity.ERROR_PERSON_INVALID_ID)
		log.Printf("person.%v.error: %v", action, err.Error())
		return entity.Person{}, err
	}

	return thisGuy, nil
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
