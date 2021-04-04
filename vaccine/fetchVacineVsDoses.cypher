//RETRIEVE ALL VACCINES SHOTS FROM A SPECIFIC CARD
MATCH (card:VaccineCard)-[relDose:HAS_DOSE]->(my:MyDose)-[relStatus]->(:VaccineDose)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
RETURN card.uuid, my.uuid AS doseUuid, my.vaccineName, my.vaccineDose, my.fromAgeInMonths, my.toAgeInMonths, type(relStatus) AS status
ORDER BY card.uuid, status, my.fromAgeInMonths, my.toAgeInMonths, my.vaccineName, my.vaccineDose
