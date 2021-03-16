//DELETE ALL VACCINES CARDS
MATCH (vc:VaccineCard) DETACH DELETE vc;

//CREATE VACINE CARDS
CREATE
(:VaccineCard {id: 'XXXX12345'}),
(:VaccineCard {id: 'AAAA54321'}),
(:VaccineCard {id: 'TTTT67890'}),
(:VaccineCard {id: 'UUUU09876'});
