//DELETE A GENERIC DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(intol:Intolerance:Diagnostic)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Shrimp'
MERGE (emr)-[:IN_ANALYSIS]->(intol)
WITH intol
SET intol:Diagnostic;
