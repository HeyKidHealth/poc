//DELETE MY SYMPTOM AND ITS RELATIONSHIPS
MATCH (emr:EMR)-[relEMR:HAS_SYMPTOM]->(mySymp:MySymptom)-[relSymptom:SYMPTOM_OF]->(symptom:Symptom),
(mySymp:MySymptom)-[relStartDay:STARTED]->(day:Day)
//MAYBE THE SYMPTOM IS NO LONGER ACTIVE, DELETE IT ANYWAY
OPTIONAL MATCH (mySymp:MySymptom)-[relEndDay:ENDED]-(endDay:Day)
WHERE mySymp.uuid = '5933a885-d90d-41e5-8dfb-622c4078ef5c'
DELETE relEMR, relSymptom, relStartDay, relEndDay, mySymp

//RETURN type(relEMR), type(relSymptom), type(relStartDay), type(relEndDay), mySymp
