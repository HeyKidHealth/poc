//DELETE INITAL PATIENT'S VACCINE CARD AND ALL SHOTS
MATCH (:VaccineDose)-[relStaus]-(my:MyDose)-[relDose:HAS_DOSE]-(card:VaccineCard)
OPTIONAL MATCH (:Day)<-[relOverFrom:OVERDUED_FROM]-(my)-[relOverTo:OVERDUED_TO]-(:Day)
OPTIONAL MATCH (:Day)<-[relForeFrom:FORESEEN_FROM]-(my)-[relForeTo:FORESEEN_TO]-(:Day)
OPTIONAL MATCH (my)-[relImmu:IMMUNIZED]-(:Day)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
DELETE relOverFrom, relOverTo, relForeFrom, relForeTo, relImmu, relStaus, relDose, my

//RETURN my, card, dose, fromOverdued, toOverdued