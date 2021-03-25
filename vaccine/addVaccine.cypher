//CREATE ALL VACCINES UNDER AGE OF 14 TO ALLOW PoC
CREATE
(:Vaccine {name: 'BCG ID', description: 'Tuberculose', dosage: 'Unique', classification: 'Mandatory'}),
(:Vaccine {name: 'Hepatite B', description: 'Hepatite B', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'DTPw', description: 'Tríplice bacteriana (difteria, tétano e coqueluche)', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'H Influenzae', description: 'Haemophilus influenzae, tipo B', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'Pólio VIP', description: 'Vacina Inativada Poliomielite', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'Pólio VOP', description: 'Vacina Oral Poliomielite', dosage: 'Booster', classification: 'Mandatory'}),
(:Vaccine {name: 'Rotavírus', description: 'Rotavírus', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'VPC10', description: 'Pneumocócicas conjugadas', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'ACWY/C', description: 'Meningocócicas conjugadas ACWY/C', dosage: 'Dose', classification: 'Optional'}),
(:Vaccine {name: 'Meningocócica B', description: 'Meningocócica B', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: '3V', description: 'Influenza, gripe', dosage: 'Annual', classification: 'Mandatory'}),
(:Vaccine {name: 'Febre amarela', description: 'Febre amarela (atenuada)', dosage: 'Unique', classification: 'Mandatory'}),
(:Vaccine {name: 'Hepatite A', description: 'Hepatite A', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'BCG', description: 'Tríplice viral (sarampo, caxumba e rubéola)', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'Varicela', description: 'Varicela (catapora)', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'HPV4', description: 'HPV', dosage: 'Dose', classification: 'Mandatory'}),
(:Vaccine {name: 'DTPa', description: 'Tríplice bacteriana (difteria, tétano e coqueluche)', dosage: 'Dose', classification: 'Mandatory'})
;

//DELETE ALL DOSES FOR ALL VACCINES
MATCH (v:Vaccine) DETACH DELETE v;
