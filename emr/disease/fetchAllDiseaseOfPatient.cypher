MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[relDiag]->(diag:Diagnostic)-[:DIAGNOSED_IN]-(day:Day)
WHERE one.name = 'Renato Spakauskas'
//AND type(rel) = 'CONFIRMED'
RETURN one.uuid, one.name, diag.uuid, diag.diagnosticOf, type(relDiag) AS relation, day.uuid AS diagnosedDate
ORDER BY relation, diag.diagnosticOf
