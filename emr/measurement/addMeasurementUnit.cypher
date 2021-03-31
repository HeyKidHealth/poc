//CREATE INDEX & CONSTRAINT
CREATE INDEX measUnitInPortugueseIDX IF NOT EXISTS FOR (measUnit:MeasurementUnit) ON (measUnit.inPortuguese);
CREATE CONSTRAINT measUnitName IF NOT EXISTS ON (measUnit:MeasurementUnit) ASSERT measUnit.name IS UNIQUE;

//CREATE FEW MEASUREMENT UNITS TO ALLOW PoC
CREATE
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Celsius', inPortuguese: 'Celsius', acronym : 'C'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Meter', inPortuguese: 'Metro', acronym : 'm'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Kilogram ', inPortuguese: 'Quilograma', acronym : 'kg'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Centimeter', inPortuguese: 'Centímetro', acronym : 'cm'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Liter', inPortuguese: 'Litro', acronym : 'l'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Milliliter', inPortuguese: 'Mililitro', acronym : 'ml'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Degree', inPortuguese: 'Grau', acronym : ''}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Millimeters of Mercury', inPortuguese: 'Milímetros de Mercúrio ', acronym : 'mmHg'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Millimoles per Litre', inPortuguese: 'Milimoles por Litro', acronym : 'mmol/L'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Milligrams per 100 Millilitres', inPortuguese: 'Miligramas por 100 Mililitros ', acronym : 'mg/dL'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'Gram', inPortuguese: 'Grama', acronym : 'g'}),
(:MeasurementUnit {uuid: apoc.create.uuid(), name: 'None', inPortuguese: 'Nenhuma', acronym : ''})
;
