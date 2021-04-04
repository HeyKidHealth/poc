//DELETE INITAL PATIENT'S VACCINE CARD AND ALL SHOTS
MATCH (:VaccineDose)-[relStaus]-(my:MyDose)-[relDose:HAS_DOSE]-(card:VaccineCard)
OPTIONAL MATCH (:Day)<-[relOverSince:OVERDUE_SINCE]-(my)-[relOverUntil:OVERDUE_UNTIL]-(:Day)
OPTIONAL MATCH (:Day)<-[relForeFrom:FORESEEN_FROM]-(my)-[relForeTo:FORESEEN_TO]-(:Day)
OPTIONAL MATCH (my)-[relImmu:IMMUNIZED]-(:Day)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
DELETE relOverSince, relOverUntil, relForeFrom, relForeTo, relImmu, relStaus, relDose, my

//RETURN my, card, dose, overdueSinceDay, overdueUntilDay