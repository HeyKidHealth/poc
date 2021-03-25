//ADD A REFUSED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Gluten'
MERGE (emr)-[:REFUSED]->(allerg)
WITH allerg
SET allerg:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Chocolate'
MERGE (emr)-[:IN_ANALYSIS]->(allerg)
WITH allerg
SET allerg:Diagnostic;

//ADD A CONFIRMED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'
AND allerg.name = 'Caviar'
MERGE (emr)-[:CONFIRMED]->(allerg)
WITH allerg
SET allerg:Diagnostic;
