//REMOVE A CONFIRMED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND intol.name = 'Pufferfish'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE A REFUSED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:REFUSED]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:IN_ANALYSIS]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND intol.name = 'Dipyrone'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;
