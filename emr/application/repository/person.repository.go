package repository

import "github.com/heykidhealth/poc-emr/domain/entity"

const (
	MARITAL_STATUS_MARRIED   string = "Married"
	MARITAL_STATUS_WIDOWED   string = "Widowed"
	MARITAL_STATUS_SEPARATED string = "Separated"
	MARITAL_STATUS_DIVORCED  string = "Divorced"
	MARITAL_STATUS_SINGLE    string = "Single"
)

const (
	FAMILY_RELATION_FATHER   string = "Father"
	FAMILY_RELATION_MOTHER   string = "Mother"
	FAMILY_RELATION_BROTHER  string = "Brother"
	FAMILY_RELATION_SISTER   string = "Sister"
	FAMILY_RELATION_DAUGHTER string = "Daughter"
	FAMILY_RELATION_SON      string = "Son"
	FAMILY_RELATION_HUSBAND  string = "Husband"
	FAMILY_RELATION_WIFE     string = "Wife"
	FAMILY_RELATION_TBD      string = "To Be Defined"
)

const (
	ERROR_FAMILY_RELATIONSHIP_MISSING string = "family relationship is missing"
)

type PersonServiceInterface interface {
	AddFamilyMember(family *FamilyMember) (*entity.Person, error)
	UpdateFamilyMember(member *entity.Person) (*entity.Person, error)
	RemoveFamilyMember(member *entity.Person) (bool, error)
	GeMember(id string) (*entity.Person, error)
}

type FamilyMember struct {
	Responsible  *entity.Person
	Member       *entity.Person
	RelationType string
}

func NewFamilyMember() *FamilyMember {
	return &FamilyMember{
		Responsible:  entity.NewPerson(),
		Member:       entity.NewPerson(),
		RelationType: FAMILY_RELATION_TBD,
	}
}
