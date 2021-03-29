//CREATE INDEX & CONSTRAINT
CREATE INDEX diseaseInPortugueseIDX IF NOT EXISTS FOR (disease:Disease) ON (disease.inPortuguese);
CREATE CONSTRAINT diseaseName IF NOT EXISTS ON (disease:Disease) ASSERT disease.name IS UNIQUE;

//CREATE FEW DISEASES TO ALLOW PoC
CREATE
(:Disease {uuid: apoc.create.uuid(), name: 'Headache', inPortuguese: 'Cefaleia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Migraine', inPortuguese: 'Enxaqueca'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Rhinitis', inPortuguese: 'Rinite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Sinusitis', inPortuguese: 'Sinusite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Asthma', inPortuguese: 'Asma'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Diabetes', inPortuguese: 'Diabetes'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Hepatitis', inPortuguese: 'Hepatite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Depression', inPortuguese: 'Depressão'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Anemia', inPortuguese: 'Anemia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Obesity', inPortuguese: 'Obesidade'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Hypertension', inPortuguese: 'Hipertensão Arterial'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Astigmatism', inPortuguese: 'Astigmatismo'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Myopia', inPortuguese: 'Miopia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Hyperopia', inPortuguese: 'Hipermetropia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Blindness', inPortuguese: 'Cegueira'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Presbyopia', inPortuguese: 'Presbiopia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Cataract', inPortuguese: 'Catarata'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Glaucoma', inPortuguese: 'Glaucoma'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Conjunctivitis', inPortuguese: 'Conjuntivite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Diabetic Retinopathy', inPortuguese: 'Retinopatia Diabética'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Deafness', inPortuguese: 'Surdez'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Otitis', inPortuguese: 'Otite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Labyrinthitis', inPortuguese: 'Labirintite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Tinnutus', inPortuguese: 'Tinnutus'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Otosclerosis', inPortuguese: 'Otosclerose'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Ototoxicity', inPortuguese: 'Ototoxicidade'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Usher Syndrome', inPortuguese: 'Síndrome de Usher'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Acoustic Neuroma', inPortuguese: 'Neuroma do Acústico'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Meniere Disease', inPortuguese: 'Doença de Ménière'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Stuttering', inPortuguese: 'Gagueira'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Mute', inPortuguese: 'Mudez'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Aphasia', inPortuguese: 'Afasia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Dysarthria', inPortuguese: 'Disartria'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Dystonia', inPortuguese: 'Distonia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Cancer', inPortuguese: 'Câncer'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Bipolarity', inPortuguese: 'Bipolaridade'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Schizophrenia', inPortuguese: 'Esquizifrenia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Gastroesophageal Reflux', inPortuguese: 'Refluxo Gastroesofágico'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Gallstone', inPortuguese: 'Cálculo Biliar'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Pancreatitis', inPortuguese: 'Pancreatite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Abdominal Hernia', inPortuguese: 'Hérnia Abdominal'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Hepatic Steatosis', inPortuguese: 'Esteatose Hepática'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Gastritis', inPortuguese: 'Gastrite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Ulcer', inPortuguese: 'Úlcera'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Constipation', inPortuguese: 'Prisão de Ventre'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Appendicitis', inPortuguese: 'Apendicite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Diverticulitis', inPortuguese: 'Diverticulite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Heartburn', inPortuguese: 'Azia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Dyspepsia', inPortuguese: 'Dispepsia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Alzheimer', inPortuguese: 'Alzheimer'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Aids', inPortuguese: 'Aids'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Stroke', inPortuguese: 'Acidente Vascular Cerebral'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Parkinson', inPortuguese: 'Parkinson'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Polio', inPortuguese: 'Poliomielite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Dyslipidemia', inPortuguese: 'Dislipidemia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Ischemic Heart Disease', inPortuguese: 'Cardiopatia Isquêmica'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Cardiac Insufficiency', inPortuguese: 'Insuficiência Cardíaca'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Atrial Fibrillation', inPortuguese: 'Fibrilação Atrial'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Stomatitis', inPortuguese: 'Estomatite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Crohn Disease', inPortuguese: 'Doença de Crohn'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Irritable Bowel Syndrome', inPortuguese: 'Síndrome do Intestino Irritável'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Ulcerative Colitis', inPortuguese: 'Retocolite Ulcerativa'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Arthrosis', inPortuguese: 'Artrose'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Flat Feet', inPortuguese: 'Pé Chato'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Tendonitis', inPortuguese: 'Tendinite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Bursitis', inPortuguese: 'Bursite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Ligament Rupture', inPortuguese: 'Ruptura de Ligamento'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Backache', inPortuguese: 'Lombalgia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Plantar Fasciitis', inPortuguese: 'Fascite Plantar'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Osteoporosis', inPortuguese: 'Osteoporose'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Pulmonary Emphysema', inPortuguese: 'Enfisema Pulmonar'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Bronchitis', inPortuguese: 'Bronquite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Tuberculosis', inPortuguese: 'Tuberculose'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Pharyngitis', inPortuguese: 'Faringite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Pneumonia', inPortuguese: 'Pneumonia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Allergic Urticaria', inPortuguese: 'Urticária Alérgica'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Angioedema', inPortuguese: 'Angioedema'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Contact Dermatitis', inPortuguese: 'Dermatite de Contato'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Atopic Dermatitis', inPortuguese: 'Dermatite Atópica'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Cold', inPortuguese: 'Resfriado'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Influenza', inPortuguese: 'Gripe'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Mumps', inPortuguese: 'Caxumba'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Measles', inPortuguese: 'Sarampo'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Rubella', inPortuguese: 'Rubéola'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Meningitis', inPortuguese: 'Meningite'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Chickenpox', inPortuguese: 'Catapora'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Strep Throat', inPortuguese: 'Inflamação Garganta'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Stomach Flu', inPortuguese: 'Febre Estomacal'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Sore Throat', inPortuguese: 'Dor de Garganta'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Chagas Disease', inPortuguese: 'Doença de Chagas'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Dengue Fever', inPortuguese: 'Dengue'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Zika Fever', inPortuguese: 'Zika'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Leptospirosis', inPortuguese: 'Leptospirose'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Yellow Fever', inPortuguese: 'Febre Amarela'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Chikungunya ', inPortuguese: 'Chikungunya '}),
(:Disease {uuid: apoc.create.uuid(), name: 'Fibromyalgia', inPortuguese: 'Fibromialgia'}),
(:Disease {uuid: apoc.create.uuid(), name: 'Inguinal Hernia', inPortuguese: 'Hérnia Inguinal'}),
;

