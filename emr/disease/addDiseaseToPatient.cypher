//CREATE INDEX 
CREATE INDEX diagUuidIDX IF NOT EXISTS FOR (diag:Diagnostic) ON (diag.uuid);

//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE DISEASE
MERGE (diag:Diagnostic {diagnosticOf: 'Hypertension'})
ON CREATE SET diag.uuid = apoc.create.uuid(),
  diag.isAbout = 'Disease'
ON MATCH SET diag.isAbout = 'Disease'
WITH diag
MATCH (disease:Disease), (emr:EMR), (day:Day)
WHERE day.uuid = '24/3/2019'
  AND disease.uuid = '37e1735e-5dc5-4ffb-a48e-58eca0312d63'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE DISEASE NODES
MERGE (emr)-[:IN_ANALYSIS]->(diag)-[:DIAGNOSTIC_OF]->(disease)
RETURN diag.uuid, diag.diagnosticOf
