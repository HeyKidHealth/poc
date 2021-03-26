//REMOVE A CONFIRMED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Pufferfish'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE A REFUSED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:REFUSED]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//REMOVE AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:IN_ANALYSIS]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Dipyrone'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;
