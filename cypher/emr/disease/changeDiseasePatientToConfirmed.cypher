//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR
MATCH (emr:EMR)-[relDiag]->(diag:Diagnostic)-[:DIAGNOSTIC_OF]->(disease:Disease),
(diag:Diagnostic)-[:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = '36943e83-1ce5-435b-a19a-0414b913042b'
DELETE relDiag
//LINK THE NEW CONFIRMED RELATIONSHIP TO THE EMR 
WITH *
MERGE (emr)-[:CONFIRMED]->(diag)
//RETURN diag, emr, day, disease
RETURN diag.uuid, diag.diagnosticOf
