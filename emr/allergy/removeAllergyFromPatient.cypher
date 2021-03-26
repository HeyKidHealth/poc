//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR AND DELETE THE DIAGNOSTIC
MATCH (emr:EMR)-[relEMR]->(diag:Diagnostic)-[relAllergy:DIAGNOSTIC_OF]->(allerg:Allergy),
(diag:Diagnostic)-[relDay:DIAGNOSED_IN]->(day:Day)
WHERE diag.uuid = 'd4ab5903-6f1f-4d7b-94b5-29368c0e3118'
DELETE relEMR, relDay, relAllergy, diag

//RETURN type(relEMR), type(relDay), type(relAllergy)
