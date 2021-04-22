//CREATE INDEX 
CREATE INDEX diagUuidIDX IF NOT EXISTS FOR (diag:Diagnostic) ON (diag.uuid);

//ADD AN IN ANALYSIS DIAGNOSTIC NODE WITH THE NAME OF THE INTOLERANCE
MERGE (diag:Diagnostic {diagnosticOf: 'Seafood'})
ON CREATE SET diag.uuid = apoc.create.uuid(),
  diag.isAbout = 'Intolerance'
ON MATCH SET diag.isAbout = 'Intolerance' 
WITH diag
MATCH (intol:Intolerance), (emr:EMR), (day:Day)
WHERE day.uuid = '5/9/1998'
  AND intol.uuid = '0b523ff2-f6be-4306-a297-392a56063906'
  AND emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'  
//LINK THE CREATED NODE TO A SPECIFIC DIAGNOSED DATE
MERGE (diag)-[:DIAGNOSED_IN]->(day)
//LINK THE DIAGNOSTIC NODE TO THE EMR AND TO THE INTOLERANCE NODES
MERGE (emr)-[:IN_ANALYSIS]->(diag)-[:DIAGNOSTIC_OF]->(intol)
RETURN diag.uuid, diag.diagnosticOf
