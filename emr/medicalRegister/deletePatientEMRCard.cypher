//UNRELATE PATIENT TO HIS/HER EMR CARD
MATCH (one:Person)-[rel:OWNS_EMR]->(emr:EMR)
WHERE one.name = 'Renato Spakauskas'
AND emr.id = '!12345FFF'
DELETE rel

//UNRELATE PATIENT TO HIS/HER EMR CARD
MATCH (one:Person)-[rel:OWNS_EMR]->(emr:EMR)
WHERE one.name = 'Camila Pinho Spakauskas'
AND emr.id = '@23456AAA'
DELETE rel
