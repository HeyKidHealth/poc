package domain_test

import (
	"testing"
	"time"

	"github.com/heykidhealth/poc-emr/domain"
	"github.com/stretchr/testify/require"
)

func TestPerson_IsValid(t *testing.T) {
	person := domain.Person{}
	person.Name = "Renato"
	person.LastName = "Spakauskas"
	person.Email = "re@renato"
	person.DOB = time.Now()

	//all working
	err := person.IsValid()
	require.Nil(t, err)

	//missing name
	person.Name = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_NAME_EMPTY)
	
	//missing lastname
	person.Name = "Renato"
	person.LastName = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_LAST_NAME_EMPTY)

	//missing email
	person.LastName = "Spakauskas"
	person.Email = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_EMPTY)

	//invalid email
	person.Email = "email"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	//invalid email
	person.Email = "email@"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	//invalid email
	person.Email = "em@a"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	//valid email
	person.Email = "renato@renato"
	err = person.IsValid()
	require.Nil(t, err)
}
