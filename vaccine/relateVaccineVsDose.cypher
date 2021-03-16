//RELATE ALL VACINES WITH THEIR DOSES
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'BCG ID' AND d.vaccine = 'BCG ID' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Hepatite B' AND d.vaccine = 'Hepatite B' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'DTPw' AND d.vaccine = 'DTPw' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'H Influenzae' AND d.vaccine = 'H Influenzae' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Pólio VIP' AND d.vaccine = 'Pólio VIP' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Pólio VOP' AND d.vaccine = 'Pólio VOP' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Rotavírus' AND d.vaccine = 'Rotavírus' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'VPC10' AND d.vaccine = 'VPC10' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'ACWY/C' AND d.vaccine = 'ACWY/C' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Meningocócica B' AND d.vaccine = 'Meningocócica B' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = '3V' AND d.vaccine = '3V' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Febre amarela' AND d.vaccine = 'Febre amarela' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Hepatite A' AND d.vaccine = 'Hepatite A' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'BCG' AND d.vaccine = 'BCG' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'Varicela' AND d.vaccine = 'Varicela' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'HPV4' AND d.vaccine = 'HPV4' MERGE (d)-[:IS_DOSE_OF]->(v);
MATCH (v:Vaccine), (d:VaccineDose) WHERE v.name = 'DTPa' AND d.vaccine = 'DTPa' MERGE (d)-[:IS_DOSE_OF]->(v);
