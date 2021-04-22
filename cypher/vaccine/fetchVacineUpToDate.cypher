//RETRIEVE ALL VACCINES SHOTS FROM A SPECIFIC CARD
MATCH (card:VaccineCard)-[:HAS_DOSE]->(my:MyDose)-[:IS_UPTODATE]->(:VaccineDose)
//, (my)-[:UPTODATE]->(:Day)
WHERE card.uuid = '40c564e5-9999-4c25-bfd1-89c54091e873-VC'
RETURN card.uuid, my.uuid AS doseUuid, my.vaccineName, my.vaccineDose, my.fromAgeInMonths, my.toAgeInMonths
ORDER BY card.uuid, my.fromAgeInMonths, my.toAgeInMonths, my.vaccineName, my.vaccineDose
