//CREATE INDEX & CONSTRAINT
CREATE INDEX measurementInPortugueseIDX IF NOT EXISTS FOR (meas:Measurement) ON (meas.inPortuguese);
CREATE CONSTRAINT measurementName IF NOT EXISTS ON (meas:Measurement) ASSERT meas.name IS UNIQUE;

//CREATE FEW MEASUREMENT TO ALLOW PoC
CREATE
(:Measurement {uuid: apoc.create.uuid(), name: 'Height', inPortuguese: 'Altura', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Weight', inPortuguese: 'Peso', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Systolic Blood Pressure', inPortuguese: 'Pressão Arterial Sistólica', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Diastolic Blood Pressure', inPortuguese: 'Pressão Sanguínea Diastólica', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Temperature', inPortuguese: 'Temperatura', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Sleep', inPortuguese: 'Sono', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Stress', inPortuguese: 'Estresse', type: 'Auto'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Glucose', inPortuguese: 'Glicose', type: 'Clinical'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Apgar Score', inPortuguese: 'Número de Apgar', type: 'Medic'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Thoracic Circumference', inPortuguese: 'Circunferência Torácica', type: 'Medic'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Head Circumference', inPortuguese: 'Circunferência Craniana', type: 'Medic'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Abdominal Circumference', inPortuguese: 'Circunferência Abdominal', type: 'Medic'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Birth Weight', inPortuguese: 'Peso ao Nascer', type: 'Medic'}),
(:Measurement {uuid: apoc.create.uuid(), name: 'Birth Height', inPortuguese: 'Comprimento ao Nascer', type: 'Medic'})
;
