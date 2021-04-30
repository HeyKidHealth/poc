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
	//person.DOB = time.Now().AddDate(-5, 3, -12)
	person.DOB = time.Date(1970, 11, 14, 0, 0, 0, 0, time.UTC)

	//all working
	err := person.IsValid()
	require.Nil(t, err)

	person.Name = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_NAME_MISSING)

	person.Name = "Re"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_NAME_TOO_SHORT)

	person.Name = "RenatoRenatoRenatoRenatoRenatoRenatoRenatoRenatoRenato"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_NAME_TOO_LONG)

	person.Name = "Renato"
	person.LastName = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_LAST_NAME_MISSING)

	person.LastName = "Sp"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_LAST_NAME_TOO_SHORT)

	person.LastName = "SpakauskasSpakauskasSpakauskasSpakauskasSpakauskasSpakauskas"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_LAST_NAME_TOO_LONG)

	person.LastName = "Spakauskas"
	person.Email = ""
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_MISSING)

	person.Email = "email"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	person.Email = "email@"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	person.Email = "em@a"
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_EMAIL_INVALID)

	person.Email = "renato@renato"
	person.DOB = time.Time{}
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_DOB_MISSING)

	person.DOB = time.Now()
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_DOB_INVALID)

	person.DOB = time.Now().AddDate(0, 0, 1)		//amanhã
	err = person.IsValid()
	require.EqualError(t, err, domain.ERROR_DOB_INVALID)

	person.DOB = time.Now().AddDate(-5, 3, -12)	//5 anos antes
	err = person.IsValid()
	require.Nil(t, err)
}
