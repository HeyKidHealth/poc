//CREATE INDEX & CONSTRAINT
CREATE INDEX personUuidIDX IF NOT EXISTS FOR (one:Person) ON (one.uuid);
CREATE INDEX emrUuidIDX IF NOT EXISTS FOR (emr:EMR) ON (emr.uuid);
CREATE INDEX vaccineCardUuidIDX IF NOT EXISTS FOR (vaccineCar:VaccineCard) ON (vaccineCar.uuid);
CREATE CONSTRAINT personName IF NOT EXISTS ON (one:Person) ASSERT one.name IS UNIQUE;

//CREATE A NEW PERSON
MERGE (one:Person {name: 'Renato Spakauskas'})
ON CREATE SET one.uuid = apoc.create.uuid() + '-USER'
WITH one
//CREATE EMR CARD FOR THIS PERSON AND RELATE IT TO THE PERSON UUID
MERGE (emr:EMR {personUuid: one.uuid})
ON CREATE SET emr.uuid = apoc.create.uuid() + '-EMR'
WITH one, emr
//CREATE VACCINATION CARD FOR THIS PERSON AND RELATE IT TO THE PERSON UUID
MERGE (vaccine:VaccineCard {personUuid: one.uuid})
ON CREATE SET vaccine.uuid = apoc.create.uuid() + '-VC'
WITH *
//IDENTIFY THE CREATION DATE
MATCH (day:Day {uuid: apoc.temporal.format( date(), 'd/M/YYYY')})
MERGE (one)-[:CREATED_IN]->(day)
WITH *
//LINK THE NEW PERSON TO THE EMR CARD
MERGE (one)-[:OWNS_EMR]->(emr)
//LINK THE NEW PERSON TO THE VACCINATION CARD
MERGE (one)-[:OWNS_CARD]->(vaccine)
RETURN one.uuid, one.name, emr.uuid, vaccine.uuid
