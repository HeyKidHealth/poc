MATCH (p:Patient)-[rel]->(di:Diagnostic)
WHERE p.name = 'Renato Spakauskas'
and type(rel) = 'CONFIRMED'
RETURN p.name, di.name, type(rel) AS relation, labels(di)
