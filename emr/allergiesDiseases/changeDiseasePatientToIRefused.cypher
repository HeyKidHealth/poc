//DELETE A GENERIC DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(disease:Disease:Diagnostic)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Obesity'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Obesity'
MERGE (emr)-[:REFUSED]->(disease)
WITH disease
SET disease:Diagnostic;
