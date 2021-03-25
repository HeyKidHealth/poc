//CREATE INDEX & CONSTRAINT
CREATE INDEX complicationInPortugueseIDX IF NOT EXISTS FOR (complication:Complication) ON (complication.inPortuguese);
CREATE CONSTRAINT complicationName IF NOT EXISTS ON (complication:Complication) ASSERT complication.name IS UNIQUE;

//CREATE FEW COMPLICATIONS TO ALLOW PoC
CREATE
(:Complication {uuid: apoc.create.uuid(), name: 'Cry', inPortuguese: 'Choro'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Fever', inPortuguese: 'Febre'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Vomiting', inPortuguese: 'Vômito'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Diarrhea', inPortuguese: 'Diarreia'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Coryza', inPortuguese: 'Coriza'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Stress', inPortuguese: 'Estresse'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Cough', inPortuguese: 'Tosse'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Sneeze', inPortuguese: 'Espirro'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Nausea', inPortuguese: 'Náusea'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Fall', inPortuguese: 'Queda'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Vertigo', inPortuguese: 'Vertigem'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Twist', inPortuguese: 'Torção'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Cut', inPortuguese: 'Corte'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Shock', inPortuguese: 'Choque'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Weakness', inPortuguese: 'Fraqueza'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Ingestion', inPortuguese: 'Ingestão'}),
(:Complication {uuid: apoc.create.uuid(), name: 'Ache', inPortuguese: 'Dor'})
;

//DELETE ALL COMPLICATIONS
MATCH (compl:Complication) DETACH DELETE compl;
