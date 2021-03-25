//DELETE ALL COMPLICATIONS
MATCH (compl:Complication) DETACH DELETE compl;

//CREATE FEW COMPLICATIONS TO ALLOW PoC
CREATE
(:Complication {name: 'Cry', inPortuguese: 'Choro'}),
(:Complication {name: 'Fever', inPortuguese: 'Febre'}),
(:Complication {name: 'Vomiting', inPortuguese: 'Vômito'}),
(:Complication {name: 'Diarrhea', inPortuguese: 'Diarreia'}),
(:Complication {name: 'Coryza', inPortuguese: 'Coriza'}),
(:Complication {name: 'Stress', inPortuguese: 'Estresse'}),
(:Complication {name: 'Cough', inPortuguese: 'Tosse'}),
(:Complication {name: 'Sneeze', inPortuguese: 'Espirro'}),
(:Complication {name: 'Nausea', inPortuguese: 'Náusea'}),
(:Complication {name: 'Fall', inPortuguese: 'Queda'}),
(:Complication {name: 'Vertigo', inPortuguese: 'Vertigem'}),
(:Complication {name: 'Twist', inPortuguese: 'Torção'}),
(:Complication {name: 'Cut', inPortuguese: 'Corte'}),
(:Complication {name: 'Shock', inPortuguese: 'Choque'}),
(:Complication {name: 'Weakness', inPortuguese: 'Fraqueza'}),
(:Complication {name: 'Ingestion', inPortuguese: 'Ingestão'}),
(:Complication {name: 'Ache', inPortuguese: 'Dor'})
