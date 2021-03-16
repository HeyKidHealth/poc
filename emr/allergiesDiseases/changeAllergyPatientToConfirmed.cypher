//DELETE A GENERIC DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel]->(allerg:Allergy:Diagnostic)
WHERE emr.id = '!12345FFF'
AND allerg.name = 'Chocolate'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;

//ADD A CONFIRMED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.id = '!12345FFF'
AND allerg.name = 'Chocolate'
MERGE (emr)-[:CONFIRMED]->(allerg)
WITH allerg
SET allerg:Diagnostic;
