//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MATCH (diag:Diagnostic)-[relDay:DIAGNOSED_IN]->(day:Day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE DISEASE NODES
MATCH (emr:EMR)-[relEMR:IN_ANALYSIS]->(diag)-[relDisease:DIAGNOSTIC_OF]->(disease:Disease)
WHERE day.uuid = '24/3/2019'
  AND disease.name = 'Hypertension'
  AND emr.id = '!12345FFF'  
  AND diag.diagnosticOf = 'Hypertension'
RETURN relDay, relDisease, relEMR, diag
//RETURN day, disease, emr, diag
