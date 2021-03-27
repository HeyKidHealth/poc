MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-->(mySymp:MySymptom)-[:STARTED]->(startDay:Day)
OPTIONAL MATCH (mySymp:MySymptom)-[:ENDED]->(endDay:Day)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
//  AND EXISTS((mySymp)-[:SYMPTOM_OF]->(:Symptom))  
RETURN one.uuid, one.name, mySymp.uuid, mySymp.symptomOf, startDay.uuid AS startedIn, endDay.uuid AS endedIn, 
  EXISTS((mySymp)-[:ENDED]->(endDay)) AS isFinished
ORDER BY startedIn DESC, mySymp.symptomOf
