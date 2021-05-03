package main

import (
	"fmt"

	"github.com/heykidhealth/poc-emr/framework/db"
	"github.com/neo4j/neo4j-go-driver/v4/neo4j"
	log "github.com/sirupsen/logrus"
)

func main() {
	log.Info("Iniciou")
	
	//hi, err := helloWorld("bolt://localhost:7687", "neo4j", "minhasenha")
	hi, err := helloWorld("bolt://3.231.155.62:7687", "neo4j", "quantity-schools-consoles")
	if err != nil {
		log.Info(err)
		panic("Doesn't work")
	}
	log.Info(hi)
}

func helloWorld(uri string, username string, password string) (string, error) {
	var err error
	var dbServerDriver neo4j.Driver
	works := false
	dbServer := db.NewDbNeo4j()

	if works {
		dbServerDriver, err = neo4j.NewDriver(uri, neo4j.BasicAuth(username, password, ""))
		if err != nil {
			fmt.Println(err.Error())
			return "", err
		}
		fmt.Println("Abriu conexão Neo4J via 'works'")

	} else {
		err = dbServer.Connect()
		if err != nil {
			fmt.Println(err.Error())
			return "", err
		}
		dbServerDriver = dbServer.DB
		
		fmt.Println("Abriu conexão Neo4J via 'doesn't work'")
	}
	defer dbServerDriver.Close()

	session := dbServerDriver.NewSession(neo4j.SessionConfig{AccessMode: neo4j.AccessModeWrite})
	defer session.Close()
	fmt.Println("Abriu session")

	greeting, err := session.WriteTransaction(
		func(transaction neo4j.Transaction) (interface{}, error) {
			fmt.Println("Abriu transaction")
			result, err := transaction.Run(
				"CREATE (a:Greeting) SET a.message = $message RETURN a.message + ', from node ' + id(a)",
				map[string]interface{}{"message": "hello, world"})
			if err != nil {
				fmt.Println("Erro no session")
				return nil, err
			}

			fmt.Println("Executou run")
			if result.Next() {
				return result.Record().Values[0], nil
			}

			return nil, result.Err()
	})
	if err != nil {
		fmt.Println("Erro no transaction")
		return "", err
	}

	fmt.Println("Executou greeting")
	return greeting.(string), nil
}
