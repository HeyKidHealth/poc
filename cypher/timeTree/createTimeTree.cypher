//CREATE INDEX & CONSTRAINT
CREATE INDEX dayUuidIDX IF NOT EXISTS FOR (day:Day) ON (day.uuid);
CREATE INDEX monthUuidIDX IF NOT EXISTS FOR (month:Month) ON (month.uuid);

MERGE (r:TimeTreeRoot)
WITH r, range(1970, 2030) AS years, range(1,12) as months
FOREACH(year IN years |
  MERGE (y:Year {value: year})
  MERGE (r)-[:CHILD]->(y)
  FOREACH(month IN months |
    CREATE (m:Month {value: month})
    MERGE (y)-[:CHILD]->(m)
    FOREACH(day IN (CASE
          WHEN month IN [1,3,5,7,8,10,12] THEN range(1,31)
          WHEN month = 2 THEN
            CASE
              WHEN year % 4 <> 0 THEN range(1,28)
              WHEN year % 100 <> 0 THEN range(1,29)
              WHEN year % 400 <> 0 THEN range(1,29)
              ELSE range(1,28)
            END
          ELSE range(1,30)
        END) |
      CREATE (d:Day {value: day})
      MERGE (m)-[:CHILD]->(d))))

WITH *

//Create years linked list
MATCH (root:TimeTreeRoot)-->(year:Year)
WITH root, year ORDER BY year.value
WITH root, collect(year) as years
WITH root, years, years[0] AS first, years[size(years)-1] AS last
MERGE (root)-[:FIRST]->(first)
MERGE (root)-[:LAST]->(last)
FOREACH(i in RANGE(0, size(years)-2) |
  FOREACH(year1 in [years[i]] |
    FOREACH(year2 in [years[i+1]] |
      MERGE (year1)-[:NEXT]->(year2))))

WITH *

//Create months linked list
MATCH (year:Year)
WITH collect(year) as years
UNWIND years AS year
	MATCH (year)--(first:Month {value: 1}), (year)--(last:Month {value: 12})
	MERGE (year)-[:FIRST]->(first)
	MERGE (year)-[:LAST]->(last)

WITH *

MATCH (year:Year)-[:CHILD]->(month:Month)
WITH year, month
ORDER BY year.value, month.value
WITH collect(month) as months
FOREACH(i in RANGE(0, size(months)-2) |
  FOREACH(month1 in [months[i]] |
    FOREACH(month2 in [months[i+1]] |
      MERGE (month1)-[:NEXT]->(month2))))

WITH *

//Create days linked list
MATCH (month:Month)
WITH collect(month) as months
UNWIND months AS month
	MATCH (month)-[:CHILD]->(day:Day)
	WITH month, collect(day) AS days
	WITH month, days[0] AS first, days[size(days)-1] AS last
	MERGE (month)-[:FIRST]->(first)
	MERGE (month)-[:LAST]->(last)

WITH *

MATCH (year:Year)-[:CHILD]->(month:Month)-[:CHILD]->(day:Day)
WITH year,month,day
ORDER BY year.value, month.value, day.value
WITH collect(day) as days
FOREACH(i in RANGE(0, size(days)-2) |
  FOREACH(day1 in [days[i]] |
    FOREACH(day2 in [days[i+1]] |
      MERGE (day1)-[:NEXT]->(day2))))
;

//CREATE FORMATED DATE AS M/YYY AND D/M/YYYY
MATCH (root:TimeTreeRoot)-[:CHILD]->(year:Year)
WITH collect(year) AS years UNWIND years AS y
	SET y.uuid = toString(y.value)
	WITH y
	MATCH (y)-[:CHILD]->(month:Month)
	WITH y, collect(month) AS months UNWIND months AS m
		SET m.uuid = right('00' + toString(m.value), 2) + '/' + y.value
		WITH y, m
		MATCH (m)-[:CHILD]->(day:Day)
		WITH y, m, collect(day) AS days UNWIND days AS d
			SET d.uuid = right('00' + toString(d.value), 2) + '/' + right('00' + toString(m.value), 2) + '/' + y.value,
        d.date = date(apoc.date.convertFormat(d.uuid, 'dd/MM/YYYY', 'YYYY-MM-dd'))
;
