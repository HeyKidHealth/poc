MATCH (p:Patient), (i:Intolerance)
WHERE p.name = 'Renato Spakauskas'
AND i.name = 'Pufferfish'
MERGE (p)-[:CONFIRMED]->(i)
WITH i
SET i:Diagnostic

MATCH (p:Patient), (i:Intolerance)
WHERE p.name = 'Renato Spakauskas'
AND i.name = 'Shrimp'
MERGE (p)-[:REFUSED]->(i)
WITH i
SET i:Diagnostic

MATCH (p:Patient), (i:Intolerance)
WHERE p.name = 'Renato Spakauskas'
AND i.name = 'Dipyrone'
MERGE (p)-[:IN_ANALYSIS]->(i)
WITH i
SET i:Diagnostic
