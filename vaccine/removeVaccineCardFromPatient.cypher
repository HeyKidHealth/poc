//UNRELATE PATIENT TO HIS/HER VACCINE CARD
MATCH (one:Person)-[rel:OWNS_CARD]->(card:VaccineCard)
WHERE one.name = 'Renato Spakauskas'
AND card.id = 'XXXX12345'
DELETE rel;
