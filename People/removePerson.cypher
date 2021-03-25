//DELETE THE PERSON AND RELATED EMR AND VACCINATION CARDS
MATCH (:Day)<-[relDate:CREATED_IN]-(one:Person)-[relEMR:OWNS_EMR]->(emr:EMR), 
(one:Person)-[relVaccine:OWNS_CARD]->(vaccine:VaccineCard)
WHERE one.uuid = '44b51152-2adf-48ef-9b93-89d19a979136-USER'
DELETE relDate, relEMR, relVaccine,  emr, vaccine, one
