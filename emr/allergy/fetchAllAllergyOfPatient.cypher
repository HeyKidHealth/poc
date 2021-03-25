MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[rel]->(diag:Diagnostic:Allergy)
WHERE one.name = 'Renato Spakauskas'
//AND type(rel) = 'CONFIRMED'
RETURN one.name, diag.name, type(rel) AS relation, labels(diag)
ORDER BY relation, diag.name
