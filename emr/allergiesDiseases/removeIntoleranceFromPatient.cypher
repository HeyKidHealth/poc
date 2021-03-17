//REMOVE A CONFIRMED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(intol:Intolerance:Diagnostic)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Pufferfish'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE A REFUSED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:REFUSED]->(intol:Intolerance:Diagnostic)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:IN_ANALYSIS]->(intol:Intolerance:Diagnostic)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Dipyrone'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;
