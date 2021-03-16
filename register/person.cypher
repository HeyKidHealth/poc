//CREATE 3 NEW PEOPLE AND ASSUMES S/HE IS A PATIENT
MERGE (one:Person {name: 'Renato Spakauskas'})
ON CREATE SET one:Patient
RETURN one 

MERGE (one:Person {name: 'Camila Pinho Spakauskas'})
ON CREATE SET one:Patient

MERGE (one:Person {name: 'Marilia Pinho Spakauskas'})
ON CREATE SET one:Patient

MERGE (one:Person {name: 'Antônio Miguel Spakauskas Gamarano'})
ON CREATE SET one:Patient
