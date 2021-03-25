CREATE INDEX ON :Disease(name);

//CREATE FEW DISEASES TO ALLOW PoC
CREATE
(:Disease {name: 'Headache', inPortuguese: 'Cefaleia'}),
(:Disease {name: 'Migraine', inPortuguese: 'Enxaqueca'}),
(:Disease {name: 'Rhinitis', inPortuguese: 'Rinite'}),
(:Disease {name: 'Sinusitis', inPortuguese: 'Sinusite'}),
(:Disease {name: 'Asthma', inPortuguese: 'Asma'}),
(:Disease {name: 'Diabetes', inPortuguese: 'Diabetes'}),
(:Disease {name: 'Hepatitis', inPortuguese: 'Hepatite'}),
(:Disease {name: 'Depression', inPortuguese: 'Depressão'}),
(:Disease {name: 'Anemia', inPortuguese: 'Anemia'}),
(:Disease {name: 'Obesity', inPortuguese: 'Obesidade'}),
(:Disease {name: 'Hypertension', inPortuguese: 'Hipertensão Arterial'}),
(:Disease {name: 'Astigmatism', inPortuguese: 'Astigmatismo'}),
(:Disease {name: 'Myopia', inPortuguese: 'Miopia'}),
(:Disease {name: 'Hyperopia', inPortuguese: 'Hipermetropia'}),
(:Disease {name: 'Blindness', inPortuguese: 'Cegueira'}),
(:Disease {name: 'Presbyopia', inPortuguese: 'Presbiopia'}),
(:Disease {name: 'Cataract', inPortuguese: 'Catarata'}),
(:Disease {name: 'Glaucoma', inPortuguese: 'Glaucoma'}),
(:Disease {name: 'Conjunctivitis', inPortuguese: 'Conjuntivite'}),
(:Disease {name: 'Diabetic Retinopathy', inPortuguese: 'Retinopatia Diabética'}),
(:Disease {name: 'Deafness', inPortuguese: 'Surdez'}),
(:Disease {name: 'Otitis', inPortuguese: 'Otite'}),
(:Disease {name: 'Labyrinthitis', inPortuguese: 'Labirintite'}),
(:Disease {name: 'Tinnutus', inPortuguese: 'Tinnutus'}),
(:Disease {name: 'Otosclerosis', inPortuguese: 'Otosclerose'}),
(:Disease {name: 'Ototoxicity', inPortuguese: 'Ototoxicidade'}),
(:Disease {name: 'Usher Syndrome', inPortuguese: 'Síndrome de Usher'}),
(:Disease {name: 'Acoustic Neuroma', inPortuguese: 'Neuroma do Acústico'}),
(:Disease {name: 'Meniere Disease', inPortuguese: 'Doença de Ménière'}),
(:Disease {name: 'Stuttering', inPortuguese: 'Gagueira'}),
(:Disease {name: 'Mute', inPortuguese: 'Mudez'}),
(:Disease {name: 'Aphasia', inPortuguese: 'Afasia'}),
(:Disease {name: 'Dysarthria', inPortuguese: 'Disartria'}),
(:Disease {name: 'Dystonia', inPortuguese: 'Distonia'}),
(:Disease {name: 'Cancer', inPortuguese: 'Câncer'}),
(:Disease {name: 'Bipolarity', inPortuguese: 'Bipolaridade'}),
(:Disease {name: 'Schizophrenia', inPortuguese: 'Esquizifrenia'}),
(:Disease {name: 'Gastroesophageal Reflux', inPortuguese: 'Refluxo Gastroesofágico'}),
(:Disease {name: 'Gallstone', inPortuguese: 'Cálculo Biliar'}),
(:Disease {name: 'Pancreatitis', inPortuguese: 'Pancreatite'}),
(:Disease {name: 'Abdominal Hernia', inPortuguese: 'Hérnia Abdominal'}),
(:Disease {name: 'Hepatic Steatosis', inPortuguese: 'Esteatose Hepática'}),
(:Disease {name: 'Gastritis', inPortuguese: 'Gastrite'}),
(:Disease {name: 'Ulcer', inPortuguese: 'Úlcera'}),
(:Disease {name: 'Constipation', inPortuguese: 'Prisão de Ventre'}),
(:Disease {name: 'Appendicitis', inPortuguese: 'Apendicite'}),
(:Disease {name: 'Diverticulitis', inPortuguese: 'Diverticulite'}),
(:Disease {name: 'Heartburn', inPortuguese: 'Azia'}),
(:Disease {name: 'Dyspepsia', inPortuguese: 'Dispepsia'}),
(:Disease {name: 'Alzheimer', inPortuguese: 'Alzheimer'}),
(:Disease {name: 'Aids', inPortuguese: 'Aids'}),
(:Disease {name: 'Stroke', inPortuguese: 'Acidente Vascular Cerebral'}),
(:Disease {name: 'Parkinson', inPortuguese: 'Parkinson'}),
(:Disease {name: 'Polio', inPortuguese: 'Poliomielite'}),
(:Disease {name: 'Dyslipidemia', inPortuguese: 'Dislipidemia'}),
(:Disease {name: 'Ischemic Heart Disease', inPortuguese: 'Cardiopatia Isquêmica'}),
(:Disease {name: 'Cardiac Insufficiency', inPortuguese: 'Insuficiência Cardíaca'}),
(:Disease {name: 'Atrial Fibrillation', inPortuguese: 'Fibrilação Atrial'}),
(:Disease {name: 'Stomatitis', inPortuguese: 'Estomatite'}),
(:Disease {name: 'Crohn Disease', inPortuguese: 'Doença de Crohn'}),
(:Disease {name: 'Irritable Bowel Syndrome', inPortuguese: 'Síndrome do Intestino Irritável'}),
(:Disease {name: 'Ulcerative Colitis', inPortuguese: 'Retocolite Ulcerativa'}),
(:Disease {name: 'Constipation', inPortuguese: 'Obstipação'}),
(:Disease {name: 'Arthrosis', inPortuguese: 'Artrose'}),
(:Disease {name: 'Flat Feet', inPortuguese: 'Pé Chato'}),
(:Disease {name: 'Tendonitis', inPortuguese: 'Tendinite'}),
(:Disease {name: 'Bursitis', inPortuguese: 'Bursite'}),
(:Disease {name: 'Ligament Rupture', inPortuguese: 'Ruptura de Ligamento'}),
(:Disease {name: 'Backache', inPortuguese: 'Lombalgia'}),
(:Disease {name: 'Plantar Fasciitis', inPortuguese: 'Fascite Plantar'}),
(:Disease {name: 'Osteoporosis', inPortuguese: 'Osteoporose'}),
(:Disease {name: 'Pulmonary Emphysema', inPortuguese: 'Enfisema Pulmonar'}),
(:Disease {name: 'Bronchitis', inPortuguese: 'Bronquite'}),
(:Disease {name: 'Tuberculosis', inPortuguese: 'Tuberculose'}),
(:Disease {name: 'Pharyngitis', inPortuguese: 'Faringite'}),
(:Disease {name: 'Pneumonia', inPortuguese: 'Pneumonia'}),
(:Disease {name: 'Allergic Urticaria', inPortuguese: 'Urticária Alérgica'}),
(:Disease {name: 'Angioedema', inPortuguese: 'Angioedema'}),
(:Disease {name: 'Contact Dermatitis', inPortuguese: 'Dermatite de Contato'}),
(:Disease {name: 'Atopic Dermatitis', inPortuguese: 'Dermatite Atópica'})
