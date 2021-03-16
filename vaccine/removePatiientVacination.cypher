//DELETE INITAL PATIENT'S VACCINE CARD
MATCH (card:VaccineCard)-[rel:IS_OVERDUE]->(dose:VaccineDose)
WHERE card.id = 'XXXX12345'
DELETE rel;
