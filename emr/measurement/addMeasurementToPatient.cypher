//CREATE INDEX 
CREATE INDEX occurUuidIDX IF NOT EXISTS FOR (occur:Occurrence) ON (occur.uuid);

//ADD AN IN ANALYSIS OCCURRENCE NODE WITH THE NAME OF THE MEASUREMENT
MERGE (occur:Occurrence {measurementOf: 'Height'})
ON CREATE SET occur.uuid = apoc.create.uuid(),
  occur.isAbout = 'Measurement',
  occur.measurementValue = 171
ON MATCH SET occur.measurementValue = 171
WITH occur
MATCH (meas:Measurement), (emr:EMR), (day:Day)
WHERE day.uuid = '03/03/2020'
  AND meas.uuid = '76580128-ccb2-4b22-b4ec-e820b3ef1492'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC OCCURRENCE DATE
MERGE (occur)-[:MEASURED]->(day)
//LINK THE OCCURRENCE NODE TO THE EMR AND TO THE MEASUREMENT NODES
MERGE (emr)-[:HAS_OCCURRENCE]->(occur)-[:MEASUREMENT_OF]->(meas)
RETURN occur.uuid, occur.measurementOf, occur.measurementValue
