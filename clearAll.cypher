//CLEAR ALL INDEXES
DROP INDEX allergyInPortugueseIDX IF EXISTS;

DROP INDEX dayUuidIDX IF EXISTS;
DROP INDEX diagUuidIDX IF EXISTS;
DROP INDEX diseaseInPortugueseIDX IF EXISTS;
DROP INDEX emrUuidIDX IF EXISTS;
DROP INDEX intoleranceInPortugueseIDX IF EXISTS;
DROP INDEX monthUuidIDX IF EXISTS;
DROP INDEX personUuidIDX IF EXISTS;
DROP INDEX specialtyInPortugueseIDX IF EXISTS;
DROP INDEX symptomInPortugueseIDX IF EXISTS;
DROP INDEX vaccineCardUuidIDX IF EXISTS;
DROP INDEX patientUuidIDX IF EXISTS;
DROP INDEX measurementInPortugueseIDX IF EXISTS;
DROP INDEX measUnitInPortugueseIDX IF EXISTS;
diagUuidIDX
occurUuidIDX

//CLEAR ALL CONSTRAINTS
DROP CONSTRAINT allergyName IF EXISTS;
DROP CONSTRAINT diseaseName IF EXISTS;
DROP CONSTRAINT intoleranceName IF EXISTS;
DROP CONSTRAINT patientName IF EXISTS;
DROP CONSTRAINT personName IF EXISTS;
DROP CONSTRAINT specialtyName IF EXISTS;
DROP CONSTRAINT symptomName IF EXISTS;
DROP CONSTRAINT measurementName IF EXISTS;
DROP CONSTRAINT measUnitName IF EXISTS;

//CLEAR ALL DATA
MATCH(all) DETACH DELETE all ;
