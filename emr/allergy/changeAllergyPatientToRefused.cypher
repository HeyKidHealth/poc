//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR
MATCH (emr:EMR)-[relDiag]->(diag:Diagnostic)-[:DIAGNOSTIC_OF]->(allerg:Allergy),
(diag:Diagnostic)-[:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = 'd4ab5903-6f1f-4d7b-94b5-29368c0e3118'
DELETE relDiag
//LINK THE NEW CONFIRMED RELATIONSHIP TO THE EMR 
WITH *
MERGE (emr)-[:REFUSED]->(diag)
//RETURN diag, emr, day, allerg
RETURN diag.uuid, diag.diagnosticOf
