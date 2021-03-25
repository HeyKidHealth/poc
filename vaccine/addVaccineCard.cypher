//CREATE VACINE CARDS
CREATE
(:VaccineCard {{uuid: apoc.create.uuid() + '-VC'})
;

//DELETE ALL VACCINES CARDS
MATCH (vc:VaccineCard) DETACH DELETE vc;
