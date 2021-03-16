MATCH (p:Patient), (a:Allergy)
WHERE p.name = 'Renato Spakauskas'
AND a.name = 'Gluten'
MERGE (p)-[:REFUSED]->(a)
WITH a
SET a:Diagnostic

MATCH (p:Patient), (a:Allergy)
WHERE p.name = 'Renato Spakauskas'
AND a.name = 'Chocolate'
MERGE (p)-[:IN_ANALYSIS]->(a)
WITH a
SET a:Diagnostic

MATCH (p:Patient), (a:Allergy)
WHERE p.name = 'Renato Spakauskas'
AND a.name = 'Caviar'
MERGE (p)-[:CONFIRMED]->(a)
WITH a
SET a:Diagnostic
