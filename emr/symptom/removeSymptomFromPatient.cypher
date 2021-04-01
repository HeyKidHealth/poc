//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR AND DELETE THE OCCURRENCE
MATCH (emr:EMR)-[relEMR]->(occur:Occurrence)-[relSymptom:SYMPTOM_OF]->(symptom:Symptom),
(occur)-[relStartDay:STARTED]->(:Day)
//MAYBE THE SYMPTOM IS NO LONGER ACTIVE, DELETE IT ANYWAY
OPTIONAL MATCH (occur)-[relEndDay:ENDED]-(:Day)
WHERE occur.uuid = '98d03dcc-c932-465b-9e92-96ad5d5ce816'
DELETE relEMR, relSymptom, relStartDay, relEndDay, occur

//RETURN type(relEMR), type(relStartDay), type(relEndDay), type(relSymptom)
