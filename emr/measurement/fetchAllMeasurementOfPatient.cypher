MATCH (one:Patient)-[:OWNS_EMR]->(emr:EMR)-[relOccur]->(occur:Occurrence)-[:MEASURED]-(day:Day)
OPTIONAL MATCH (occur)-[:MEASUREMENT_OF]->(:Measurement)-[:IS_MEASURED_IN]->(unit:MeasurementUnit)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
  AND EXISTS((occur)-[:MEASUREMENT_OF]->(:Measurement)-[:IS_MEASURED_IN]->(:MeasurementUnit))  
RETURN one.uuid, one.name, occur.uuid, occur.measurementOf, day.uuid AS diagnosedDate, occur.measurementValue, unit.acronym
ORDER BY diagnosedDate DESC, occur.measurementOf
