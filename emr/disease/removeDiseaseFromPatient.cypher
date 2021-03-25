//FETCH THE DIAGNOSTIC AND RELATIONSHIPS
MATCH (diag:Diagnostic)-[relDay:DIAGNOSED_IN]->(day:Day)
MATCH (emr:EMR)-[relEMR]->(diag)-[relDisease:DIAGNOSTIC_OF]->(disease:Disease)
WHERE diag.uuid = '7f6b1f6f-d1f4-463e-8964-b0e88cdc85d1'
//REMOVE ALL RELATIONSHIPS AND THE DIAGNOSTIC NODE
DELETE relDay, relDisease, relEMR, diag
//RETURN relDay, relDisease, relEMR, diag
;
