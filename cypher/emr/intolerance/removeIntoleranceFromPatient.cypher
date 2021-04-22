//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR AND DELETE THE DIAGNOSTIC
MATCH (emr:EMR)-[relEMR]->(diag:Diagnostic)-[relIntol:DIAGNOSTIC_OF]->(intol:Intolerance),
(diag:Diagnostic)-[relDay:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = '518ae45b-e957-4256-9aa6-22ee55f1d9d6'
DELETE relEMR, relDay, relIntol, diag

//RETURN type(relEMR), type(relDay), type(relIntol)
