//CREATE INDEX 
CREATE INDEX mySympUuidIDX IF NOT EXISTS FOR (mySymp:MySymptom) ON (mySymp.uuid);

//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE SYMPTOM
MERGE (mySymp:MySymptom {symptomOf: 'Fever'})
ON CREATE SET mySymp.uuid = apoc.create.uuid(),
  mySymp.isAbout = 'Symptom'
ON MATCH SET mySymp.isAbout = 'Symptom'
WITH mySymp
MATCH (symptom:Symptom), (emr:EMR), (day:Day)
WHERE day.uuid = '8/9/2004'
  AND symptom.uuid = '61447138-05e7-413d-a422-3e4b7b99d886'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO WHEN IT HAS STARTED
MERGE (mySymp)-[:STARTED]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE SYMPTOMS NODES
MERGE (emr)-[:HAS_SYMPTOM]->(mySymp)-[:SYMPTOM_OF]->(symptom)
RETURN mySymp.uuid, mySymp.symptomOf
