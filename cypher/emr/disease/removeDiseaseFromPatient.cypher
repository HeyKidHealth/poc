//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR AND DELETE THE DIAGNOSTIC
MATCH (emr:EMR)-[relEMR]->(diag:Diagnostic)-[relDisease:DIAGNOSTIC_OF]->(disease:Disease),
(diag:Diagnostic)-[relDay:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = '36943e83-1ce5-435b-a19a-0414b913042b'
DELETE relEMR, relDay, relDisease, diag

//RETURN type(relEMR), type(relDay), type(relDisease)
