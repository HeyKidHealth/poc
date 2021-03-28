//IDENTIFY THE SYMPTOM AND IT MUST BE ACTIVE
MATCH (startDay:Day)<-[:STARTED]-(mySymp:MySymptom)-[:SYMPTOM_OF]->(:Symptom),
(endDay:Day {uuid: '15/09/2004'})
WHERE mySymp.uuid = '5933a885-d90d-41e5-8dfb-622c4078ef5c'
  AND NOT EXISTS ((mySymp)-[:STARTED]->(startDay:Day))
WITH mySymp, endDay, startDay
//CHANGE IT TO INACTIVE SETTING AN END DATE
MERGE (mySymp)-[:ENDED]->(endDay)
WITH mySymp, endDay, startDay
SET mySymp.durationInDays = duration.inDays(date(startDay.date), date(endDay.date)).days
RETURN mySymp.uuid, mySymp.isAbout, endDay.uuid AS endedIn, true AS isFinished, mySymp.durationInDays
//  EXISTS((mySymp)-[:ENDED]->(endDay)) AS isFinished
