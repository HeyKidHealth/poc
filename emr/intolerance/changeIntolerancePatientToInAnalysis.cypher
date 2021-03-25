//DELETE A GENERIC DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND intol.name = 'Shrimp'
MERGE (emr)-[:IN_ANALYSIS]->(intol)
WITH intol
SET intol:Diagnostic;
