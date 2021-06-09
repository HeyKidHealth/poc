package repository

import (
	"errors"
	"time"

	"github.com/heykidhealth/poc-emr/domain/entity"
	"github.com/heykidhealth/poc-emr/framework/db"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
)

type PersonRepositoryNeo4j struct {
	DB	db.Neo4jSession
}

func NewPersonRepositoryNeo4j() *PersonRepositoryNeo4j {
	sessionW := db.NewNeo4jSession(neo4j.AccessModeWrite)
	return &PersonRepositoryNeo4j{ Session: &sessionW }
}


func (d *PersonRepositoryNeo4j) isValidPerson(id string) (*entity.Person, error) {
	panic("isValidPereson not implemented yet")
}

func (d *PersonRepositoryNeo4j) addEMR(emr *entity.EMR, tx *neo4j.Transaction) (*entity.EMR, error) {
	cypher := "MERGE (:EMR {uuid: $uuid})"
	params := map[string]interface{}{"uuid": emr.ID)}
	result, err := tx.Run(cypher, params)
	if err != nil {
		err2 = tx.Rollback()
		if err2 != nil {
			return &entity.EMR{}, err2
		}
		return &entity.EMR{}, err
	}

	return emr, nil
}

func  (d *PersonRepositoryNeo4j) AddPerson(person *entity.Person) (*entity.Person, error) {
	err := person.IsValid()
	if err != nil {
		return &entity.Person{}, err
	}

	session := d.DB.Session
	defer session.Close()

	var trans neo4j.Transaction
	trans, err = &session.BeginTransaction(WithTxTimeout(1200 * time.Millisecond))
	if err != nil {
		return &entity.Person{}, err
	}
	defer trans.Close()

	emr, err := d.addEMR(&person.EMR, trans)
	if err != nil {
		return &entity.Person{}, err
	}

	err = trans.Commit()
	if err != nil {
		_ = trans.Rollback()
		return &entity.Person{}, err
	}
}

func (d *PersonRepositoryNeo4j) GetPerson(id string) (*entity.Person, error) {
	session, err := d.connectWritable()
	if err != nil {
		return &entity.Person{}, err
	}

	cypherQuery := `MATCH (p:Person) WHERE p.uuid = $id 
						RETURN p.uuid AS id, p.name AS name, p.lastName AS lastName, p.middleName AS middleName, p.dob AS dob`
	tx, err := 
}