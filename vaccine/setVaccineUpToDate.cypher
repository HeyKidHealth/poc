//RETRIEVE ALL VACCINES SHOTS FROM A SPECIFIC CARD
MATCH (card:VaccineCard)-[:HAS_DOSE]->(my:MyDose)-[relStatus]->(dose:VaccineDose),
(:Day)<-[relFrom]-(my)-[relTo]->(:Day)
//OPTIONAL MATCH (:Day)<-[relOverSince:OVERDUE_SINCE]-(my)-[relOverUntil:OVERDUE_UNTIL]->(:Day)
//OPTIONAL MATCH (:Day)<-[relForeFrom:FORESEEN_FROM]-(my)-[relForeTo:FORESEEN_TO]->(:Day)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
  AND my.uuid = 'ad96664c-9f9f-428f-9a80-8aa11cc27756'
  AND NOT EXISTS((:VaccineDose)<-[:IS_UPTODATE]-(my))
//DELETE THE PREVIOUS STATUS ()
DELETE relFrom, relTo, relStatus
WITH dose, my, card
//IDENTIFY THE IMMUNIZATION DAY AND LINK TO IT
MATCH (immunization:Day)
WHERE immunization.uuid = '06/01/1971'
MERGE (dose)<-[relStatus:IS_UPTODATE]-(my)-[:IMMUNIZED]->(immunization)
SET my.daysOverdue = duration.inDays(date(my.toExpectedDate), date(immunization.date)).days
RETURN card.uuid, my.uuid, my.vaccineName, my.vaccineDose, type(relStatus) AS status, my.daysOverdue, immunization.date
