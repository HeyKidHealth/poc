package service

import (
	"log"

	entity "github.com/heykidhealth/emr/core/entity/person"
	repository "github.com/heykidhealth/emr/core/repository/person"
)

type PersonService interface {
	GetPerson(id string) (*entity.Person, error)
	AddPerson(person *entity.Person) (*entity.Person, error)
	UpdatePerson(id string, person *entity.Person) (*entity.Person, error)
}

type person struct{}

var (
	personRepo repository.PersonRepository
)

func NewPersonService(repository repository.PersonRepository) PersonService {
	personRepo = repository
	return &person{}
}

//Get one person identified by his/her ID
func (*person) GetPerson(id string) (*entity.Person, error) {
	thisGuy, err := personRepo.FindById(id)
	if err != nil {
		log.Printf("personService.FindById: %v", err.Error())
		return &entity.Person{}, err
	}

	return thisGuy, nil
}

//add a new person who later can be a patient, a responsible for someone, a medic
func (*person) AddPerson(person *entity.Person) (*entity.Person, error) {
	thisGuy, err := personRepo.Add(person)
	if err != nil {
		log.Printf("personService.Add: %v", err.Error())
		return &entity.Person{}, err
	}
	return thisGuy, nil
}

//add a new person who later can be a patient, a responsible for someone, a medic
func (*person) UpdatePerson(id string, person *entity.Person) (*entity.Person, error) {
	thisGuy, err := personRepo.Update(id, person)
	if err != nil {
		log.Printf("personService.Update: %v", err.Error())
		return &entity.Person{}, err
	}
	return thisGuy, nil
}

