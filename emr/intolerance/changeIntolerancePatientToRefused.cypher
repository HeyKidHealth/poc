//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR
MATCH (emr:EMR)-[relDiag]->(diag:Diagnostic)-[:DIAGNOSTIC_OF]->(intol:Intolerance),
(diag:Diagnostic)-[:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = '518ae45b-e957-4256-9aa6-22ee55f1d9d6'
DELETE relDiag
//LINK THE NEW REFUSED RELATIONSHIP TO THE EMR 
WITH *
MERGE (emr)-[:REFUSED]->(diag)
//RETURN diag, emr, day, intol
RETURN diag.uuid, diag.diagnosticOf
