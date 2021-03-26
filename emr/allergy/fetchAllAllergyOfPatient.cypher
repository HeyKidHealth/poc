MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[relDiag]->(diag:Diagnostic)-[:DIAGNOSED_IN]-(day:Day)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
  AND EXISTS((diag)-[:DIAGNOSTIC_OF]->(:Allergy))  
//AND type(rel) = 'CONFIRMED'
RETURN one.uuid, one.name, diag.uuid, diag.diagnosticOf, type(relDiag) AS status, day.uuid AS diagnosedDate
ORDER BY status, diag.diagnosticOf
