MATCH (disease:Disease), (day:Day)
WHERE disease.name = 'Hyperopia'
  AND day.uuid = '20/2/2019'
MERGE (disease)<-[:DIAGNOSTIC_OF]-(diag:Diagnostic)-[:CREATED_AT]->(day)
SET diag.name = 'Hyperopia',
  diag:Disease
RETURN diag

MERGE (diag:Diagnostic {name: 'Hypertension'})
ON CREATE SET diag:Disease
ON MATCH SET diag:Disease;

//WITH diag
MATCH (disease:Disease), (day:Day), (diag:Diagnostic)
WHERE disease.name = 'Hyperopia'
  AND day.uuid = '21/3/2019'
  AND diag.name = 'Hyperopia'
MERGE (disease)<-[:DIAGNOSTIC_OF]-(diag)-[:CREATED_AT]->(day)
RETURN diag.name, disease.name, day.uuid;




MATCH (d:Disease)<-[rel:DIAGNOSTIC_OF]-(:Diagnostic)
WHERE d.name = 'Hyperopia'
DELETE rel;

MATCH (d:Diagnostic)-[rel:CREATED_AT]->(:Day)
WHERE d.name = 'Hyperopia'
DELETE rel;

MATCH (d:Diagnostic)
WHERE d.name = 'Hyperopia'
DELETE d;
