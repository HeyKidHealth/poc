//ADD A CONFIRMED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Pufferfish'
MERGE (emr)-[:CONFIRMED]->(intol)
WITH intol
SET intol:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Shrimp'
MERGE (emr)-[:REFUSED]->(intol)
WITH intol
SET intol:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Dipyrone'
MERGE (emr)-[:IN_ANALYSIS]->(intol)
WITH intol
SET intol:Diagnostic;
