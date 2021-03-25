//REMOVE A REFUSED DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:REFUSED]->(allerg:Allergy:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Gluten'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;

//REMOVE AN IN ANALYSIS DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:IN_ANALYSIS]->(allerg:Allergy:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Chocolate'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;

//REMOVE A CONFIRMED DIAGNOSTIC OF AN ALLERGY FROM THE EMR OF THE PATIENT
MATCH (emr:EMR)-[rel:CONFIRMED]->(allerg:Allergy:Diagnostic)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Caviar'
DELETE rel
WITH allerg
REMOVE allerg:Diagnostic;
