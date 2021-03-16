//RELATE PATIENT TO HIS/HER EMR CARD
MATCH (one:Person), (emr:EMR)
WHERE one.name = 'Renato Spakauskas'
AND emr.id = '!12345FFF'
MERGE (one)-[:OWNS_EMR]->(emr);

//RELATE PATIENT TO HIS/HER EMR CARD
MATCH (one:Person), (emr:EMR)
WHERE one.name = 'Camila Pinho Spakauskas'
AND emr.id = '@23456AAA'
MERGE (one)-[:OWNS_EMR]->(emr);
