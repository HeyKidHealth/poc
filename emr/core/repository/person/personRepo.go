package repository

import entity "github.com/heykidhealth/emr/core/entity/person"

type PersonRepository interface {
	FindById(id string) (*entity.Person, error)
	Add(person *entity.Person) (*entity.Person, error)
	Update(id string, person *entity.Person) (*entity.Person, error)
	//Remove(id string) (*entity.Person, error)
}
