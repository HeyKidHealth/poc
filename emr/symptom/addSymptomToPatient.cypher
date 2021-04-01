//CREATE INDEX 
CREATE INDEX occurUuidIDX IF NOT EXISTS FOR (occur:Occurrence) ON (occur.uuid);

//ADD AN OCCURRENCE NODE WITH THE NAME OF THE SYMPTOM
MERGE (occur:Occurrence {symptomOf: 'Stress'})
ON CREATE SET occur.uuid = apoc.create.uuid(),
  occur.isAbout = 'Symptom',
  occur.symptomValue = 'Moderate'
ON MATCH SET occur.symptomValue = 'Moderate'
WITH occur
MATCH (symptom:Symptom), (emr:EMR), (day:Day)
WHERE day.uuid = '13/02/2021'
  AND symptom.uuid = '5011a716-2cb8-4f2b-81af-8d11042912bc'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC OCCURRENCE DATE
MERGE (occur)-[:STARTED]->(day)
//LINK THE OCCURRENCE NODE TO THE EMR AND TO THE SYMPTOM NODES
MERGE (emr)-[:HAS_OCCURRENCE]->(occur)-[:SYMPTOM_OF]->(symptom)
RETURN occur.uuid, occur.symptomOf, occur.symptomValue
