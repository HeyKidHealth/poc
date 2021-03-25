MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[rel]->(diag:Diagnostic)-[DIAGNOSED_IN]-(day:Day)
WHERE one.name = 'Renato Spakauskas'
//AND type(rel) = 'CONFIRMED'
RETURN one.name, diag.diagnosticOf, type(rel) AS relation, day.uuid AS diagnosedDate
ORDER BY relation, diag.diagnosticOf