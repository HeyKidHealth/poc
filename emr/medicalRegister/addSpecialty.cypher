//CREATE INDEX & CONSTRAINT
CREATE INDEX specialtyInPortugueseIDX IF NOT EXISTS FOR (specialty:Specialty) ON (specialty.inPortuguese);
CREATE CONSTRAINT specialtyName IF NOT EXISTS ON (specialty:Specialty) ASSERT specialty.name IS UNIQUE;

//CREATE FEW SPELCIALTIES TO ALLOW PoC
CREATE
(:Specialty {uuid: apoc.create.uuid(), name: 'Pediatrician', inPortuguese: 'Pediatra'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Otolaryngologist', inPortuguese: 'Otorrinolaringologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Ophthalmologist', inPortuguese: 'Oftalmologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Allergist', inPortuguese: 'Alergologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Dentist', inPortuguese: 'Dentista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Endocrinologist', inPortuguese: 'Endocrinologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Orthopedist', inPortuguese: 'Ortopedista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Pulmonologist', inPortuguese: 'Pneumologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Cardiologist', inPortuguese: 'Cardiologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Nutritionist', inPortuguese: 'Nutrólogo'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Physiotherapist', inPortuguese: 'Fisioterapeuta'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Speech Therapist', inPortuguese: 'Fonoaudiólogo'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Psychologist', inPortuguese: 'Psicólogo'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Neurologist', inPortuguese: 'Neurologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Oncologist', inPortuguese: 'Oncologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Psychiatrist', inPortuguese: 'Psiquiatra'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Hebrew', inPortuguese: 'Hebiatra'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Nephrologist', inPortuguese: 'Nefrologista'}),
(:Specialty {uuid: apoc.create.uuid(), name: 'Urologist ', inPortuguese: 'Urologista'})
;
