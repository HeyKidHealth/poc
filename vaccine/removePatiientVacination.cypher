//DELETE INITAL PATIENT'S VACCINE CARD
MATCH (card:VaccineCard)-[rel:IS_OVERDUE]->(dose:VaccineDose)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
DELETE rel;
