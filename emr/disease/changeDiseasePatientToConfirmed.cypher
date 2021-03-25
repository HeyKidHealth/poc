//DELETE A GENERIC DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(disease:Disease:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND disease.name = 'Obesity'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;

//ADD A CONFIRMED DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND disease.name = 'Obesity'
MERGE (emr)-[:CONFIRMED]->(disease)
WITH disease
SET disease:Diagnostic;
