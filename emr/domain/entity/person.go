package entity

import (
	"errors"
	"strings"
	"time"

	"github.com/heykidhealth/poc-emr/framework/utils"
)

type Person struct {
	ID          string    `json:"person_id"`
	Name        string    `json:"name"`
	MiddleName  string    `json:"middle_name"`
	LastName    string    `json:"last_name"`
	Email       string    `json:"email"`
	Gender      string    `json:"gender"`
	DOB         time.Time `json:"day_of_birth"`
	AgeInMonths int16     `json:"age_in_months"`
	Age         int16     `json:"age"`
	Responsible string    `json:"responsible_id"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

const (
	GENDER_MALE   string = "Male"
	GENDER_FEMALE string = "Female"
	GENDER_OTHER  string = "Other"
)

const (
	SELF    string = "self"
	SOMEONE string = "someone"
)

const (
	ERROR_NAME_MISSING        string = "name is empty"
	ERROR_LAST_NAME_TOO_SHORT string = "last name is too short"
	ERROR_LAST_NAME_TOO_LONG  string = "last name is too long"
	ERROR_LAST_NAME_MISSING   string = "last name is empty"
	ERROR_NAME_TOO_SHORT      string = "name is too short"
	ERROR_NAME_TOO_LONG       string = "name is too long"
	ERROR_EMAIL_MISSING       string = "e-Mail is empty"
	ERROR_EMAIL_INVALID       string = "e-Mail has an invalid format"
	ERROR_DOB_MISSING         string = "day of birth is empty"
	ERROR_DOB_INVALID         string = "day of birth is invalid"
)

func NewPerson() *Person {
	return &Person{
		ID:          "",
		Responsible: SOMEONE,
		CreatedAt:   time.Now(),
		UpdatedAt:   time.Now(),
	}
}

//check wheather person is filled with required information - name, lastname, email and day of birth
func (p *Person) IsValid() error {
	if strings.TrimSpace(p.Name) == "" {
		return errors.New(ERROR_NAME_MISSING)
	}

	if len(strings.TrimSpace(p.Name)) < 3 {
		return errors.New(ERROR_NAME_TOO_SHORT)
	}

	if len(strings.TrimSpace(p.Name)) > 20 {
		return errors.New(ERROR_NAME_TOO_LONG)
	}

	if strings.TrimSpace(p.LastName) == "" {
		return errors.New(ERROR_LAST_NAME_MISSING)
	}

	if len(strings.TrimSpace(p.LastName)) < 3 {
		return errors.New(ERROR_LAST_NAME_TOO_SHORT)
	}

	if len(strings.TrimSpace(p.LastName)) > 20 {
		return errors.New(ERROR_LAST_NAME_TOO_LONG)
	}

	if p.Responsible == SELF {
		if strings.TrimSpace(p.Email) == "" {
			return errors.New(ERROR_EMAIL_MISSING)
		}

		if !utils.IsEmailValid(p.Email) {
			return errors.New(ERROR_EMAIL_INVALID)
		}
	}

	if p.DOB.IsZero() {
		return errors.New(ERROR_DOB_MISSING)
	}

	if utils.IsDateEqualToday(p.DOB) {
		return errors.New(ERROR_DOB_INVALID)
	}

	if utils.IsDateGreaterToday(p.DOB) {
		return errors.New(ERROR_DOB_INVALID)
	}

	return nil
}
