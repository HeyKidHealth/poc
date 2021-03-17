MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[rel]->(intol:Diagnostic:Intolerance)
WHERE one.name = 'Renato Spakauskas'
//AND type(rel) = 'CONFIRMED'
RETURN one.name, intol.name, type(rel) AS relation, labels(intol)
ORDER BY relation, intol.name
