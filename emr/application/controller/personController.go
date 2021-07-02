package controller

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/heykidhealth/emr/application/adapter/router"
	"github.com/heykidhealth/emr/application/service"
	entity "github.com/heykidhealth/emr/core/entity/person"
	"github.com/heykidhealth/emr/infrastructure/utils"
)

type PersonController interface {
	GetPerson(resp http.ResponseWriter, req *http.Request)
	AddPerson(resp http.ResponseWriter, req *http.Request)
	UpdatePerson(resp http.ResponseWriter, req *http.Request)
}

type controller struct{}

var (
	httpRouter    router.Router = router.NewMuxRouter()
	personService service.PersonService
)

func NewPersonController(service service.PersonService) PersonController {
	personService = service
	return &controller{}
}

//Get a person by ID. If ID is missing or not found, then an error is raised
func (*controller) GetPerson(resp http.ResponseWriter, req *http.Request) {
	resp.Header().Set("Content-Type", "application/json")

	id, err := httpRouter.GetParam(req, "id")
	if err != nil {
		log.Println("personController.GetPerson: the id is missing")
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: "the id is missing"})
		return
	}
	
	person, err := personService.GetPerson(id)
	if err != nil {
		log.Printf("personController.GetPerson: %v", err.Error())
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: err.Error()})
		return
	}
	
	resp.WriteHeader(http.StatusOK)
	json.NewEncoder(resp).Encode(person)
}

//Add a person. For now, just expecting JSON parse partial object based on struct Person
func (*controller) AddPerson(resp http.ResponseWriter, req *http.Request) {
	resp.Header().Set("Content-Type", "application/json")
	
	var thisGuy entity.Person
	err := json.NewDecoder(req.Body).Decode(&thisGuy)
	if err != nil {
		log.Printf("personController.AddPerson: %v", err.Error())
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: err.Error()})
		return
	}

	//effectively add the person
	newPerson, err := personService.AddPerson(&thisGuy)
	if err != nil {
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: err.Error()})
		return
	}

	resp.WriteHeader(http.StatusOK)
	json.NewEncoder(resp).Encode(newPerson)
}


//Update the person. 
func (*controller) UpdatePerson(resp http.ResponseWriter, req *http.Request) {
	resp.Header().Set("Content-Type", "application/json")
	
	id, err := httpRouter.GetParam(req, "id")
	if err != nil {
		log.Println("personController.UpdatePerson: the id is missing")
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: "the id is missing"})
		return
	}
	
	var thisGuy entity.Person
	err = json.NewDecoder(req.Body).Decode(&thisGuy)
	if err != nil {
		log.Printf("personController.UpdatePerson: %v", err.Error())
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: err.Error()})
		return
	}

	//effectively update the person
	newPerson, err := personService.UpdatePerson(id, &thisGuy)
	if err != nil {
		resp.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(resp).Encode(utils.ServiceError{Message: err.Error()})
		return
	}

	resp.WriteHeader(http.StatusOK)
	json.NewEncoder(resp).Encode(newPerson)
}

func finishCall(resp http.ResponseWriter, obj interface{}) {
	finish(resp, http.StatusOK, obj)
}

func finishCallError(resp http.ResponseWriter, err error) {
	finish(resp, http.StatusInternalServerError, utils.ServiceError{Message: err.Error()})
}

func finish(resp http.ResponseWriter, codeMessage int, obj interface{}) {
	resp.WriteHeader(codeMessage)
	json.NewEncoder(resp).Encode(obj)
	return
}
