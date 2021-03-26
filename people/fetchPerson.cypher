//FETCH PERSON AND RELATED EMR AND VACCINATION CARDS
MATCH (:Day)<-[relDate:CREATED_IN]-(one:Person)-[relEMR:OWNS_EMR]->(emr:EMR), 
(one:Person)-[relVaccine:OWNS_CARD]->(vaccine:VaccineCard)
WHERE one.uuid = '8c443244-aebb-421e-b273-172f66936c96-USER'
RETURN one.name, one.uuid, emr.uuid, vaccine.uuid
