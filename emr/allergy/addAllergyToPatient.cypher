//CREATE INDEX 
CREATE INDEX diagUuidIDX IF NOT EXISTS FOR (diag:Diagnostic) ON (diag.uuid);

//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE ALLERGY
MERGE (diag:Diagnostic {diagnosticOf: 'Chocolate'})
ON CREATE SET diag.uuid = apoc.create.uuid(),
  diag.isAbout = 'Allergy'
ON MATCH SET diag.isAbout = 'Allergy' 
WITH diag
MATCH (allerg:Allergy), (emr:EMR), (day:Day)
WHERE day.uuid = '24/4/2000'
  AND allerg.uuid = '6dadf2f3-4940-4698-9747-4fd589bf1a70'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE ALLERGY NODES
MERGE (emr)-[:IN_ANALYSIS]->(diag)-[:DIAGNOSTIC_OF]->(allerg)
RETURN diag.uuid, diag.diagnosticOf
