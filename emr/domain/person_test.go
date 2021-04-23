package domain_test

import (
	"testing"
	"github.com/stretchr/testify"
)

func TestPerson_IsValid(t *testing.T) {
	person := domain.Person{}
	person.Name = "Renato"
	person.LastName = "Spakauskas"
	person.Email = ""
	person.DOB = time.Date()
}