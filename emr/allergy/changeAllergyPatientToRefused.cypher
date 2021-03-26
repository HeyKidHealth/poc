//DELETE A GENERIC DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(allerg:Allergy:Diagnostic)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND allerg.name = 'Chocolate'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND allerg.name = 'Chocolate'
MERGE (emr)-[:REFUSED]->(allerg)
WITH allerg
SET allerg:Diagnostic;
