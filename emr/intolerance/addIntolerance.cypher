//CREATE INDEX & CONSTRAINT
CREATE INDEX intoleranceInPortugueseIDX IF NOT EXISTS FOR (intolerance:Intolerance) ON (intolerance.inPortuguese);
CREATE CONSTRAINT intoleranceName IF NOT EXISTS ON (intolerance:Intolerance) ASSERT intolerance.name IS UNIQUE;

//CREATE FEW INTOLERANCES  TO ALLOW PoC
CREATE
(:Intolerance {uuid: apoc.create.uuid(), name: 'Cream', inPortuguese: 'Creme', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Soap', inPortuguese: 'Sabonete', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Make up', inPortuguese: 'Maquiagem', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'perfume', inPortuguese: 'Perfume', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Latex Product', inPortuguese: 'Produto de Látex', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Bijou', inPortuguese: 'Bijuteria', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Ink', inPortuguese: 'Tinta', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Mosquito', inPortuguese: 'Mosquito', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Bee', inPortuguese: 'Abelha', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Flea', inPortuguese: 'Pulga', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Cat', inPortuguese: 'Gato', type: 'Animal'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Puppy', inPortuguese: 'Cachorro', type: 'Animal'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Ant', inPortuguese: 'Formiga', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Wasp', inPortuguese: 'Vespa', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Tick', inPortuguese: 'Carrapato', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Leggy', inPortuguese: 'Pernilongo', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Rubber', inPortuguese: 'Borrachudo', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Aspirin', inPortuguese: 'Aspirina', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Dipyrone', inPortuguese: 'Dipirona', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Paracetamol', inPortuguese: 'Paracetamol', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Diclofenac', inPortuguese: 'Diclofenaco', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Penicillin', inPortuguese: 'Penicilina', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Sulfa', inPortuguese: 'Sulfa', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Quinolone', inPortuguese: 'Quinolona', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Erythromycin', inPortuguese: 'Eritromicina', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Azithromycin', inPortuguese: 'Azitromicina', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Iodinated Contrast', inPortuguese: 'Contraste Iodado', type: 'Drug'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Mite', inPortuguese: 'Ácaro', type: 'Insect'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Dust', inPortuguese: 'Poeira', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Mold', inPortuguese: 'Mofo', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Pollen', inPortuguese: 'Pólen', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Smoke', inPortuguese: 'Fumaça', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Pollution', inPortuguese: 'Poluição', type: 'Other'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Lactose', inPortuguese: 'Lactose', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Egg', inPortuguese: 'Ovo', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Wheat', inPortuguese: 'Trigo', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Peanut', inPortuguese: 'Amendoim', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Seafood', inPortuguese: 'Frutos do Mar', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Dry Fruits', inPortuguese: 'Frutas Secas', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Soy', inPortuguese: 'Soja', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Fish', inPortuguese: 'Peixe', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Crustacean', inPortuguese: 'Crustáceo', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Mollusk', inPortuguese: 'Molusco', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Gluten', inPortuguese: 'Glúten', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Shrimp', inPortuguese: 'Camarão', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Squid', inPortuguese: 'Lula', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Pufferfish', inPortuguese: 'Baiacu', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Chocolate', inPortuguese: 'Chocolate', type: 'Food'}),
(:Intolerance {uuid: apoc.create.uuid(), name: 'Caviar', inPortuguese: 'Caviar', type: 'Food'})
;
