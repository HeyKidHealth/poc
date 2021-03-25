//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE DISEASE
MERGE (diag:Diagnostic {diagnosticOf: 'Hypertension'})  //, id: apoc.create.uuid()})
WITH diag
MATCH  (disease:Disease), (emr:EMR), (day:Day)
WHERE day.uuid = '24/3/2019'
  AND disease.name = 'Hypertension'
  AND emr.id = '!12345FFF'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE DISEASE NODES
MERGE (emr)-[:IN_ANALYSIS]->(diag)-[:DIAGNOSTIC_OF]->(disease)
RETURN diag

//ADD AN REFUSED DIAGNOSTIC NODE WITH THE NAME OF THE DISEASE
MERGE (diag:Diagnostic {diagnosticOf: 'Otitis'})  //, id: apoc.create.uuid()})
WITH diag
MATCH  (disease:Disease), (emr:EMR), (day:Day)
WHERE day.uuid = '12/7/2020'
  AND disease.name = 'Otitis'
  AND emr.id = '!12345FFF'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE DISEASE NODES
MERGE (emr)-[:REFUSED]->(diag)-[:DIAGNOSTIC_OF]->(disease)
RETURN diag
