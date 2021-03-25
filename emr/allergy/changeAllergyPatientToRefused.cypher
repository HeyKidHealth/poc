//DELETE A GENERIC DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(allerg:Allergy:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Chocolate'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;

//ADD A REFUSED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Chocolate'
MERGE (emr)-[:REFUSED]->(allerg)
WITH allerg
SET allerg:Diagnostic;
