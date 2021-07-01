package entity

import "time"

//import "github.com/heykidhealth/emr/domain/entity"

type FamilyMember struct {
	Responsible  *Person   `json:"responsible_id"`
	Member       *Person   `json:"member_id"`
	RelationType string    `json:"relation_type"`
	CreatedAt    time.Time `json:"created_at"`
	UpdatedAt    time.Time `json:"updated_at"`
}

type FamilyStructure struct {
	Members []FamilyMember
}

type FamilyServiceInterface interface {
	GetFamily(id string) (*[]FamilyStructure, error)
	AddFamilyMember(family *FamilyMember) (*[]FamilyStructure, error)
	UpdateFamilyMember(member *FamilyMember) (*[]FamilyStructure, error)
	RemoveFamilyMember(id string) (bool, error)
}

func NewFamily(responsible *Person) *FamilyStructure {
	return &FamilyStructure{
		Members: []FamilyMember{},
	}
}

func NewFamilyMember() *FamilyMember {
	return &FamilyMember{
		Responsible:  &Person{},
		Member:       &Person{},
		RelationType: FamilyRelationTBD,
	}
}
