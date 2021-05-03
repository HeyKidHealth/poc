package db

import (
	"errors"
	"fmt"
	"os"

	"github.com/joho/godotenv"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
)

const (
	DB_ERROR_MISSING_URI         string = "cannot reach database's URI"
	DB_ERROR_CREDENTIALS         string = "user or password incorrect"
	DB_ERROR_CONNECTION          string = "unable to connect to database server"
	DB_ERROR_MISSING_CONFIG_FILE string = "unable to locate .env file"
)

type DbNeo4j struct {
	DB neo4j.Driver
}

func NewDbNeo4j() DbNeo4j {
	return DbNeo4j{}
}

func (d *DbNeo4j) Connect() error {
	err := godotenv.Load()
	if err != nil {
		return errors.New(DB_ERROR_MISSING_CONFIG_FILE)
	}

	uri, found := os.LookupEnv("NEO4J_URI")
	if !found {
		return errors.New(DB_ERROR_MISSING_URI)
	}

	username, found := os.LookupEnv("NEO4J_USERNAME")
	if !found {
		return errors.New(DB_ERROR_CREDENTIALS)
	}

	password, found := os.LookupEnv("NEO4J_PASSWORD")
	if !found {
		return errors.New(DB_ERROR_CREDENTIALS)
	}

	d.DB, err = neo4j.NewDriver(uri, neo4j.BasicAuth(username, password, ""))
	if err != nil {
		fmt.Println(err.Error())
		return errors.New(DB_ERROR_CONNECTION)
	}

	return nil
}
