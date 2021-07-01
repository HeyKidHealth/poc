package entity

//#########################
//PERSON
//#########################
const (
	GenderMale   string = "Male"
	GenderFemale string = "Female"
	GenderOther  string = "Other"
)

const (
	Self    string = "Self"
	Someone string = "Someone"
)

const (
	ERROR_NAME_MISSING         string = "name is missing"
	ERROR_LAST_NAME_TOO_SHORT  string = "last name is too short"
	ERROR_LAST_NAME_TOO_LONG   string = "last name is too long"
	ERROR_LAST_NAME_MISSING    string = "last name is missing"
	ERROR_NAME_TOO_SHORT       string = "name is too short"
	ERROR_NAME_TOO_LONG        string = "name is too long"
	ERROR_MIDDLE_NAME_TOO_LONG string = "middle name is too long"
	ERROR_EMAIL_MISSING        string = "e-Mail is missing"
	ERROR_EMAIL_INVALID        string = "e-Mail has an invalid format"
	ERROR_DOB_MISSING          string = "day of birth is missing"
	ERROR_DOB_INVALID          string = "day of birth is invalid"
	ERROR_ID_PERSON_MISSING    string = "person id is missing"
	ERROR_ID_PERSON_EXISTS     string = "person id provided is taken"
)

const (
	ERROR_PERSON_INVALID_ID string = "this id does not represent a valid person"
	ERROR_PERSON_BASE_EMPTY string = "the base is empty"
)

//#########################
//FAMILY
//#########################
const (
	MaritalStatusMarried   string = "Married"
	MaritalStatusWidowed   string = "Widowed"
	MaritalStatusSeparated string = "Separated"
	MaritalStatusDivorced  string = "Divorced"
	MaritalStatusSingle    string = "Single"
)

const (
	FamilyRelationFather   string = "Father"
	FamilyRelationMother   string = "Mother"
	FamilyRelationBrother  string = "Brother"
	FamilyRelationSister   string = "Sister"
	FamilyRelationDaughter string = "Daughter"
	FamilyRelationSon      string = "Son"
	FamilyRelationHusband  string = "Husband"
	FamilyRelationWife     string = "Wife"
	FamilyRelationTBD      string = "To Be Defined"
)

const (
	ERROR_FAMILY_RELATIONSHIP_MISSING string = "family relationship is missing"
)
