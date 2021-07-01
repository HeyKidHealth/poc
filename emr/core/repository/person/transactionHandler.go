package repository

import (
	"errors"
	"log"
	"time"

	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j/dbtype"
	
	entity "github.com/heykidhealth/emr/core/entity/person"
)


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
		log.Printf("person.%v.Commit.error: %v", action, err.Error())
		log.Printf("person.%v.Commit.error: entire transaction canceled", action)
		return err
	}

	err = tx.Close()
	if err != nil {
		log.Printf("person.%v.Close.error: %v", action, err.Error())
		return err
	}

	return nil
}


func readPersonResultset(action string, result neo4j.Result) (entity.Person, error) {
	var (
		dob2       dbtype.Date
		// createdAt2 dbtype.Date
		// updatedAt2 dbtype.Date
		found      bool
		thisGuy    entity.Person
	)
	found = false
	thisGuy = entity.Person{}

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
		// updatedAt, ok := record.Get("updatedAt") //here is a little tricky
		// if updatedAt != nil && ok {
		// 	updatedAt2 = updatedAt.(dbtype.Date)
		// }
		// if !ok || updatedAt == nil {
		// 	updatedAt2 = dbtype.Date{}
		// }
		// createdAt, ok := record.Get("createdAt") //here is a little tricky
		// if createdAt != nil && ok {
		// 	createdAt2 = createdAt.(dbtype.Date)
		// }
		// if !ok || createdAt == nil {
		// 	createdAt2 = dbtype.Date{}
		// }

		found = true
		thisGuy = entity.Person{
			ID:          uuid.(string),
			Name:        name.(string),
			MiddleName:  middleName.(string),
			LastName:    lastName.(string),
			Email:       email.(string),
			Gender:      gender.(string),
			DOB:         time.Time(dob2), // that gave me 2 entire days of a huge headache
			AgeInMonths: int(ageInMonths.(int64)),
			Age:         int(ageInYears.(int64)),
			//UpdatedAt:   time.Time(updatedAt2),
			//CreatedAt:   time.Time(createdAt2),
		}
	}

	if thisGuy.ID == "" || !found {
		err := errors.New(entity.ERROR_PERSON_INVALID_ID)
		log.Printf("person.%v.error: %v", action, err.Error())
		return entity.Person{}, err
	}

	return thisGuy, nil
}
