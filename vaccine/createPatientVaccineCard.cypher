//RELATE PATIENT TO HIS/HER VACCINE CARD
MATCH (one:Person), (card:VaccineCard)
WHERE one.name = 'Renato Spakauskas'
AND card.id = 'XXXX12345'
MERGE (one)-[:OWNS_CARD]->(card)

//RELATE PATIENT TO HIS/HER VACCINE CARD
MATCH (one:Person), (card:VaccineCard)
WHERE one.name = 'Camila Pinho Spakauskas'
AND card.id = 'TTTT67890'
MERGE (one)-[:OWNS_CARD]->(card)

//CREATE INITAL PATIENT'S VACCINE CARD (ALL DOSES ARE OVERDUE)
MATCH (card:VaccineCard), (dose:VaccineDose)
WHERE card.id = 'XXXX12345'
MERGE (card)-[:IS_OVERDUE]->(dose)

//CREATE INITAL PATIENT'S VACCINE CARD (ALL DOSES ARE OVERDUE)
MATCH (card:VaccineCard), (dose:VaccineDose)
WHERE card.id = 'TTTT67890'
MERGE (card)-[:IS_OVERDUE]->(dose)