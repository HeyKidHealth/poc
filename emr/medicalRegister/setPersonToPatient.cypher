//CREATE INDEX & CONSTRAINT
CREATE INDEX patientUuidIDX IF NOT EXISTS FOR (one:Patient) ON (one.uuid);
CREATE CONSTRAINT patientName IF NOT EXISTS ON (one:Patient) ASSERT one.name IS UNIQUE;

//SET PERSON TO PATIENT
MATCH (one:Person)
WHERE one.uuid = '44b51152-2adf-48ef-9b93-89d19a979136-USER'
SET one:Patient
RETURN one.uuid, one.name, labels(one) as label 
