//DELETE RELATIONSHIP BETWEEN PATIENT VS VACCINE CARD
MATCH (pat:Patient)-[rel:OWNS_CARD]->(card:VaccineCard)
WHERE pat.name = 'Renato Spakauskas'
AND card.id = 'XXXX12345'
DELETE rel

//RELATE PATIENT VS VACCINE CARD
MATCH (pat:Patient), (card:VaccineCard)
WHERE pat.name = 'Renato Spakauskas'
AND card.id = 'XXXX12345'
MERGE (pat)-[:OWNS_CARD]->(card)
