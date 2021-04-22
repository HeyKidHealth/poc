//CREATE INDEX & CONSTRAINT
CREATE INDEX patientUuidIDX IF NOT EXISTS FOR (one:Patient) ON (one.uuid);
CREATE CONSTRAINT patientName IF NOT EXISTS ON (one:Patient) ASSERT one.name IS UNIQUE;

//SET PERSON TO PATIENT
MATCH (one:Person)
WHERE one.uuid = '8c443244-aebb-421e-b273-172f66936c96-USER'
SET one:Patient
RETURN one.uuid, one.name, labels(one) as label 
