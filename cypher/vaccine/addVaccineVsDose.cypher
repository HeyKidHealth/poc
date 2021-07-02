//RELATE ALL VACINES WITH THEIR DOSES
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'BCG ID' AND dose.vaccineName = 'BCG ID' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Hepatite B' AND dose.vaccineName = 'Hepatite B' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'DTPw' AND dose.vaccineName = 'DTPw' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'H Influenzae' AND dose.vaccineName = 'H Influenzae' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Pólio VIP' AND dose.vaccineName = 'Pólio VIP' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Pólio VOP' AND dose.vaccineName = 'Pólio VOP' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Rotavírus' AND dose.vaccineName = 'Rotavírus' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'VPC10' AND dose.vaccineName = 'VPC10' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'ACWY/C' AND dose.vaccineName = 'ACWY/C' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Meningocócica B' AND dose.vaccineName = 'Meningocócica B' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = '3V' AND dose.vaccineName = '3V' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Febre amarela' AND dose.vaccineName = 'Febre amarela' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Hepatite A' AND dose.vaccineName = 'Hepatite A' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'BCG' AND dose.vaccineName = 'BCG' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'Varicela' AND dose.vaccineName = 'Varicela' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'HPV4' AND dose.vaccineName = 'HPV4' MERGE (dose)-[:IS_DOSE_OF]->(vac);
MATCH (vac:Vaccine), (dose:VaccineDose) WHERE vac.name = 'DTPa' AND dose.vaccineName = 'DTPa' MERGE (dose)-[:IS_DOSE_OF]->(vac);
