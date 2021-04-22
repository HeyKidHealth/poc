//RETRIEVE ALL VACCINES SHOTS FROM A SPECIFIC CARD
MATCH (card:VaccineCard)-[:HAS_DOSE]->(my:MyDose)-[relStatus]->(dose:VaccineDose),
(:Day)<-[relFrom]-(my)-[relTo]->(:Day)
//OPTIONAL MATCH (:Day)<-[relOverSince:OVERDUE_SINCE]-(my)-[relOverUntil:OVERDUE_UNTIL]->(:Day)
//OPTIONAL MATCH (:Day)<-[relForeFrom:FORESEEN_FROM]-(my)-[relForeTo:FORESEEN_TO]->(:Day)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
  AND my.uuid = 'ed4d33f2-0636-4ac2-943a-e47e7498080e'
  AND NOT EXISTS((:VaccineDose)<-[:IS_UPTODATE]-(my))
//DELETE THE PREVIOUS STATUS ()
DELETE relFrom, relTo, relStatus
WITH dose, my, card
//IDENTIFY THE IMMUNIZATION DAY AND LINK TO IT
MATCH (immunization:Day)
WHERE immunization.uuid = '06/01/1971'
MERGE (dose)<-[relStatus:IS_UPTODATE]-(my)-[:UPTODATE]->(immunization)
SET my.daysOverdue = duration.inDays(date(apoc.date.convertFormat(my.toExpectedDate, "dd/MM/YYYY", "YYYY-MM-dd")), date(immunization.date)).days
RETURN DISTINCT card.uuid, my.uuid, my.vaccineName, my.vaccineDose, my.daysOverdue, immunization.date //, type(relStatus) AS status, 
