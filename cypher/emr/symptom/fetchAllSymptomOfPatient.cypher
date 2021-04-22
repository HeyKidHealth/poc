MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[relOccur]->(occur:Occurrence)-[:STARTED]-(startDay:Day)
OPTIONAL MATCH (occur:Occurrence)-[:ENDED]->(endDay:Day)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
RETURN one.uuid, one.name, occur.uuid, occur.symptomOf, startDay.uuid AS startedIn, endDay.uuid AS endedIn, 
  EXISTS((occur)-[:ENDED]->(endDay)) AS isFinished, occur.durationInDays
ORDER BY startedIn DESC, occur.symptomOf
