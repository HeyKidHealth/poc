//CREATE INITAL PATIENT'S VACCINE CARD (ALL DOSES ARE OVERDUE)
MATCH (card:VaccineCard), (dose:VaccineDose)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
MERGE (card)-[:IS_OVERDUE]->(dose)
RETURN dose, card

