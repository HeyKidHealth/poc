//DELETE A CONFIRMED DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Cancer'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;

//REMOVE A CONFIRMED DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Hypertension'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;

//REMOVE AN IN ANALYSIS DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:IN_ANALYSIS]->(disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Obesity'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;

//REMOVE A REFUSED DIAGNOSTIC OF A DISEASE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:REFUSED]->(disease:Disease)
WHERE emr.id = '!12345FFF'
AND disease.name = 'Diabetes'
DELETE rel
WITH disease
REMOVE disease:Diagnostic;
