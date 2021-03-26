//ADD A REFUSED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND allerg.name = 'Gluten'
MERGE (emr)-[:REFUSED]->(allerg)
WITH allerg
SET allerg:Diagnostic;

//ADD AN IN ANALYSIS DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND allerg.name = 'Chocolate'
MERGE (emr)-[:IN_ANALYSIS]->(allerg)
WITH allerg
SET allerg:Diagnostic;

//ADD A CONFIRMED DIAGNOSTIC OF AN ALLERGY TO THE EMR OF THE PATIENT
MATCH (emr:EMR), (allerg:Allergy)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
AND allerg.name = 'Caviar'
MERGE (emr)-[:CONFIRMED]->(allerg)
WITH allerg
SET allerg:Diagnostic;
