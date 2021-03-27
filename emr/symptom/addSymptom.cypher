//CREATE INDEX & CONSTRAINT
CREATE INDEX symptomInPortugueseIDX IF NOT EXISTS FOR (symptom:Symptom) ON (symptom.inPortuguese);
CREATE CONSTRAINT symptomName IF NOT EXISTS ON (symptom:Symptom) ASSERT symptom.name IS UNIQUE;

//CREATE FEW SYMPTOMS TO ALLOW PoC
CREATE
(:Symptom {uuid: apoc.create.uuid(), name: 'Cry', inPortuguese: 'Choro'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Fever', inPortuguese: 'Febre'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Vomit', inPortuguese: 'Vômito'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Diarrhea', inPortuguese: 'Diarréia'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Coryza', inPortuguese: 'Coriza'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Stress', inPortuguese: 'Estresse'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Cough', inPortuguese: 'Tosse'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Sneeze', inPortuguese: 'Espirro'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Nausea', inPortuguese: 'Náusea'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Vertigo', inPortuguese: 'Vertigem'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Choke', inPortuguese: 'Engasgo'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Weakness', inPortuguese: 'Fraqueza'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Pain', inPortuguese: 'Dor '}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Short of Breath', inPortuguese: 'Falta de Ar'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Sweating', inPortuguese: 'Sudorese'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Insomnia ', inPortuguese: 'Insônia'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Dry Mouth', inPortuguese: 'Boca Seca'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Hoarseness', inPortuguese: 'Rouquidão '}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Sense of Taste', inPortuguese: 'Perda do Paladar'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Bad Breath', inPortuguese: 'Mau Hálito'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Sense of Smell', inPortuguese: 'Perda do Olfato'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Apenea', inPortuguese: 'Apenéia'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Tremor', inPortuguese: 'Tremor'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Dizziness', inPortuguese: 'Tontura'}),
(:Symptom {uuid: apoc.create.uuid(), name: 'Lack of Appetite', inPortuguese: 'Falta de Apetite'})
;
