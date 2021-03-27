//IDENTIFY THE SYMPTOM AND IT MUST BE ACTIVE
MATCH (mySymp:MySymptom)-[:SYMPTOM_OF]->(:Symptom),
(endDay:Day {uuid: '13/9/2004'})
WHERE mySymp.uuid = '5933a885-d90d-41e5-8dfb-622c4078ef5c'
  AND NOT EXISTS ((mySymp)-[:ENDED]-(:Day))
WITH mySymp, endDay
//CHANGE IT TO INACTIVE SETTING AN END DATE
MERGE (mySymp)-[:ENDED]->(endDay)
RETURN mySymp.uuid, mySymp.isAbout, endDay.uuid AS endedIn, true AS isFinished
//  EXISTS((mySymp)-[:ENDED]->(endDay)) AS isFinished
