package domain

import (
	"errors"
	"time"
)

type Person struct {
	ID          string    `json:"person_id"`
	OrigenID    string    `json:"origen_person_id"`
	Name        string    `json:"name"`
	MiddleName  string    `json:"middle_name"`
	LastName    string    `json:"last_name"`
	Email       string    `json:"email"`
	Gender      string    `json:"gender"`
	DOB         time.Time `json:"day_of_birth"`
	AgeInMonths int16     `json:"age_in_months"`
	Age         int16     `json:"age"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type PersonInterface interface {
	GetPerson(id string) (*Person, error)
	IsValid() error
	AddFamilyMember(member *Person) (*Person, error)
	UpdateFamilyMember(member *Person) (*Person, error)
	RemoveFamilyMember(member *Person) (bool, error)
	IsResponsableFor(person *Person) (bool, error)
	IsMarriedTo(person *Person) (bool, error)
	IsDivorcedFrom(person *Person) (bool, error)
}

const (
	MALE   = "male"
	FEMALE = "female"
	OTHER  = "other"
)

func NewPerson() *Person {
	return &Person{}
}

func (p *Person) IsValid() error {
	if p.Name == "" {
		return errors.New("Name is empty.")
	}

	if p.LastName == "" {
		return errors.New("Last name is empty.")
	}

	if p.Email == "" {
		return errors.New("e-Mail is empty.")
	}

	if !p.DOB.IsZero() {
		return errors.New("Day of birth is empty.")
	}

	//no errors found
	return nil
}
