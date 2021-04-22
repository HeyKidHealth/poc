//UNLINK PREVIOUS RELATIONSHIP FROM THE EMR AND DELETE THE OCCURRENCE
MATCH (emr:EMR)-[relEMR]->(occur:Occurrence)-[relMeas:MEASUREMENT_OF]->(:Measurement),
(occur)-[relDay:MEASURED]->(:Day)
WHERE occur.uuid = 'fb3e67f9-6c6e-411e-808b-c5d14e3d2ea5'
DELETE relEMR, relDay, relMeas, occur

//RETURN type(relEMR), type(relDay), type(relMeas)
