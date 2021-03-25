MATCH (vac:Vaccine)<--(dose:VaccineDose)
//WHERE vac.name = dose.vaccine
RETURN vac.name, dose.vaccine, dose.fromAgeInMonths, dose.toAgeInMonths //, type(rel) AS relation

//RETRIEVE VACCINES FROM A SPECIFIC CARD
MATCH (vac:Vaccine)<-[:IS_DOSE_OF]-(dose:VaccineDose)-[rel]-(card:VaccineCard)<-[:OWNS_CARD]-(one:Patient)
WHERE one.name = 'Renato Spakauskas'
RETURN one.name, card.uuid, vac.name, dose.name, dose.fromAgeInMonths, dose.toAgeInMonths, type(rel) AS relation
ORDER BY card.uuid, dose.fromAgeInMonths, dose.toAgeInMonths, dose.vaccine
