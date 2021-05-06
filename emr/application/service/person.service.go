package service

import (
	"errors"
	"time"

	"github.com/heykidhealth/poc-emr/application/repository"
	"github.com/heykidhealth/poc-emr/domain/entity"
	_ "github.com/stretchr/testify/require"
)

type PersonService struct {
	Person repository.PersonServiceInterface
}

func NewPersonService() PersonService {
	return PersonService{}
}

func (p *PersonService) AddFamilyMember(family *repository.FamilyMember) (*entity.Person, error) {
	err := family.Member.IsValid()
	if err != nil {
		return &entity.Person{}, err
	}

	err = family.Responsible.IsValid()
	if err != nil {
		return &entity.Person{}, err
	}

	err = p.isValidRelation(family.RelationType)
	if err != nil {
		return &entity.Person{}, err
	}

	//relationship always responsible => new member
	Member := family.Member
	Member.CreatedAt = time.Now()
	Member.UpdatedAt = time.Now()
	Member.Responsible = family.Responsible.ID

	return Member, nil
}

func (p *PersonService) GetMember(id string) (*entity.Person, error) {
	return entity.NewPerson(), nil
}

func (p *PersonService) isValidRelation(relation string) error {
	if relation != repository.FAMILY_RELATION_FATHER &&
		relation != repository.FAMILY_RELATION_MOTHER &&
		relation != repository.FAMILY_RELATION_BROTHER &&
		relation != repository.FAMILY_RELATION_SISTER &&
		relation != repository.FAMILY_RELATION_DAUGHTER &&
		relation != repository.FAMILY_RELATION_SON &&
		relation != repository.FAMILY_RELATION_HUSBAND &&
		relation != repository.FAMILY_RELATION_WIFE {
		return errors.New(repository.ERROR_FAMILY_RELATIONSHIP_MISSING)
	}
	return nil
}
