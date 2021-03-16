MATCH (p:Patient)-[rel]->(d:Disease)
WHERE p.name = 'Renato Spakauskas'
and type(rel) = 'CONFIRMED'
RETURN p.name, d.name, type(rel) AS relation
