//IDENTIFY THE SYMPTOM AND IT MUST BE ACTIVE
MATCH (startDay:Day)<-[:STARTED]-(occur:Occurrence)-[:SYMPTOM_OF]->(:Symptom),
(endDay:Day {uuid: '19/02/2021'})
WHERE occur.uuid = '98d03dcc-c932-465b-9e92-96ad5d5ce816'
  AND NOT EXISTS ((occur)-[:ENDED]->(:Day))
WITH occur, endDay, startDay
//CHANGE IT TO INACTIVE SETTING AN END DATE
MERGE (occur)-[:ENDED]->(endDay)
WITH occur, endDay, startDay
SET occur.durationInDays = duration.inDays(date(startDay.date), date(endDay.date)).days
RETURN occur.uuid, occur.isAbout, endDay.uuid AS endedIn, true AS isFinished, occur.durationInDays
//  EXISTS((occur)-[:ENDED]->(endDay)) AS isFinished
