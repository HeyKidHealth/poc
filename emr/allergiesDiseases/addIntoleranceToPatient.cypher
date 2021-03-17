//ADD A CONFIRMED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Pufferfish'
MERGE (emr)-[:CONFIRMED]->(intol)
WITH intol
SET intol:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Shrimp'
MERGE (emr)-[:REFUSED]->(intol)
WITH intol
SET intol:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.id = '!12345FFF'
AND intol.name = 'Dipyrone'
MERGE (emr)-[:IN_ANALYSIS]->(intol)
WITH intol
SET intol:Diagnostic;
