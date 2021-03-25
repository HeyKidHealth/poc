//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE DISEASE
MERGE (diag:Diagnostic {uuid: apoc.create.uuid()})
SET diag.diagnosticOf = 'Hypertension' 
WITH diag
MATCH  (disease:Disease), (emr:EMR), (day:Day)
WHERE day.uuid = '24/3/2019'
  AND disease.name = 'Hypertension'
  AND emr.uuid = 'b22c2c15-c5a2-4903-be5f-5da022ac03f0-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE DISEASE NODES
MERGE (emr)-[:IN_ANALYSIS]->(diag)-[:DIAGNOSTIC_OF]->(disease)
RETURN diag
