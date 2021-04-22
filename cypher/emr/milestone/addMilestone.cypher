//CREATE INDEX & CONSTRAINT
CREATE INDEX milestoneInPortugueseIDX IF NOT EXISTS FOR (milestone:Milestone) ON (milestone.inPortuguese);
CREATE CONSTRAINT milestoneName IF NOT EXISTS ON (milestone:Milestone) ASSERT milestone.name IS UNIQUE;

//CREATE FEW MILESTONES TO ALLOW PoC
CREATE
(:Milestone {uuid: apoc.create.uuid(), name: 'First Tooth', inPortuguese: 'Primeiro Dente', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Babble', inPortuguese: 'Balbuciar', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Call the Parents', inPortuguese: 'Chamar os Pais', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Crawl', inPortuguese: 'Engatinhar', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Holding Things', inPortuguese: 'Segurar coisas', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Head Control', inPortuguese: 'Controle da Cabeça', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Turn', inPortuguese: 'Virar', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Sit', inPortuguese: 'Sentar', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Weaning', inPortuguese: 'Desmame', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Walk', inPortuguese: 'Andar', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Speak', inPortuguese: 'Falar', stage: 'Preschool'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'First Smile', inPortuguese: 'Primeiro Sorriso', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Recognizes Father and Mother', inPortuguese: 'Reconhece Pai e Mãe', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Recognize Himself', inPortuguese: 'Reconhece a Si Próprio', stage: 'Infant'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Stand Up', inPortuguese: 'Ficar em Pé', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Use Toilet', inPortuguese: 'Desfralde', stage: 'Toddler'}),
(:Milestone {uuid: apoc.create.uuid(), name: 'Solid Food', inPortuguese: 'Alimentos Sólidos', stage: 'Toddler'})
;
