//ADD A CONFIRMED DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Cancer'
MERGE (emr)-[:CONFIRMED]->(disease)
WITH disease
SET disease:Diagnostic;

//ADD A CONFIRMED DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Hypertension'
MERGE (emr)-[:CONFIRMED]->(disease)
WITH disease
SET disease:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Obesity'
MERGE (emr)-[:IN_ANALYSIS]->(disease)
WITH disease
SET disease:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF A DISEASE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Diabetes'
MERGE (emr)-[:REFUSED]->(disease)
WITH disease
SET disease:Diagnostic;
