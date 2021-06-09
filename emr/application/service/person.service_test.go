package service_test

import (
	"testing"
	"time"

	"github.com/heykidhealth/poc-emr/application/repository"
	"github.com/heykidhealth/poc-emr/application/service"
	"github.com/heykidhealth/poc-emr/domain/entity"
	"github.com/stretchr/testify/require"
)

func Test_PersonRepositoryGetMember(t *testing.T) {
	family := repository.NewFamilyMember()
	personService := service.NewPersonService()

	responsible := family.Responsible
	responsible.ID = "ID0000234"
	responsible.Name = "Renato"
	responsible.MiddleName = "Costa"
	responsible.LastName = "Spakauskas"
	responsible.Email = "renatospaka@email.com"
	responsible.Gender = entity.GenderMale
	responsible.DOB = time.Date(1970, 11, 14, 0, 0, 0, 0, time.UTC)
	responsible.Responsible = entity.Self

	member := family.Member
	member.ID = "ID0000234"
	member.Name = "Marilia"
	member.MiddleName = "Pinho"
	member.LastName = "Spakauskas"
	member.Email = "marispaka@email.com"
	member.Gender = entity.GenderFemale
	member.DOB = time.Date(1992, 4, 22, 0, 0, 0, 0, time.UTC)
	member.Responsible = responsible.ID

	family.Member = member
	family.Responsible = responsible
	family.RelationType = repository.FamilyRelationFamilyRelationFather
	m, err := personService.AddFamilyMember(family)
	require.Nil(t, err)
	require.Equal(t, m.Responsible, member.Responsible)

	family.RelationType = repository.FamilyRelationTBD
	m, err = personService.AddFamilyMember(family)
	require.EqualError(t, err, repository.ERROR_FAMILY_RELATIONSHIP_MISSING)
}
