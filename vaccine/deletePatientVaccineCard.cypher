//UNRELATE PATIENT TO HIS/HER VACCINE CARD
MATCH (one:Person)-[rel:OWNS_CARD]->(card:VaccineCard)
WHERE one.name = 'Renato Spakauskas'
AND card.id = 'XXXX12345'
DELETE rel;

//DELETE INITAL PATIENT'S VACCINE CARD
MATCH (card:VaccineCard)-[rel:IS_OVERDUE]->(dose:VaccineDose)
WHERE card.id = 'XXXX12345'
DELETE rel;
