//DELETE A GENERIC DIAGNOSTIC OF AN INTOLERANCE FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(intol:Intolerance:Diagnostic)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Shrimp'
DELETE rel
WITH intol
REMOVE intol:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF AN INTOLERANCE TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (intol:Intolerance)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND intol.name = 'Shrimp'
MERGE (emr)-[:REFUSED]->(intol)
WITH intol
SET intol:Diagnostic;
