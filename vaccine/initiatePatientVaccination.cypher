//IDENTIFY PATIENT TO GET DOB
MATCH (emr:EMR)<-[:OWNS_EMR]-(one:Patient)-[:BIRTH]->(dob:Day), 
(one)-[:OWNS_CARD]->(card:VaccineCard),
(dose:VaccineDose)
WHERE emr.uuid = 'f2c98bcd-00a7-49fb-b7e9-844d9bb69267-EMR'
WITH dob, card, dose
//CREATE INITAL PATIENT'S VACCINE CARD (ALL DOSES ARE OVERDUE)
MERGE (my:MyDose {
      vaccineName: dose.vaccineName, 
      vaccineDose: dose.name, 
      fromAgeInMonths: dose.fromAgeInMonths, 
      toAgeInMonths: dose.toAgeInMonths
    })
ON CREATE SET my.uuid = apoc.create.uuid(),
  my.fromExpectedDate = apoc.date.convertFormat(toString(date({month: date(dob.date).month, year: date(dob.date).year, day: 1}) + duration({months: dose.fromAgeInMonths})), 'date', 'dd/MM/YYYY'),
  my.toExpectedDate = apoc.date.convertFormat(toString(date({month: date(dob.date).month, year: date(dob.date).year, day: 1}) + duration({months: dose.toAgeInMonths + 1}) - duration({days: 1})), 'date', 'dd/MM/YYYY')
//LINK MY DOSE TO VACCINE CARD
MERGE (card)-[:HAS_DOSE]->(my)
//LINK MY DOSE TO VACCINE DOSE
MERGE (my)-[:IS_OVERDUE]->(dose)
WITH my
//LINK MY DOSE TO overdue DATES
MATCH (overdueSinceDay:Day), (overdueUntilDay:Day)
WHERE overdueSinceDay.uuid = my.fromExpectedDate
  AND overdueUntilDay.uuid = my.toExpectedDate
MERGE (overdueSinceDay)<-[:OVERDUE_SINCE]-(my)-[:OVERDUE_UNTIL]-(overdueUntilDay)
RETURN my.uuid, my.vaccineName, my.vaccineDose, overdueUntilDay.uuid AS overdueUntil, overdueSinceDay.uuid AS overdueSince
