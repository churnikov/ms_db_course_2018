// q1

MATCH (d:Degree)-[:TYPE]->(b) WHERE exists(d.bilingual) RETURN d.name AS Name, d.bilingual AS Bilingual, b.name AS Branch;

// q2

MATCH (d:Degree)<-[:TEACHES]-(s)-[:LOCATED_IN]->(c:Campus)
WHERE exists(d.double_Degree) RETURN d.name AS name, s.name AS School, c.name AS Campus;

// q3

MATCH (d:Degree)<-[:TEACHES]-(s)-[:LOCATED_IN]->(c:Campus)
RETURN
avg((d.applications)-(d.students_first_year_2013)) AS Rejected,
c.name AS Campus
ORDER BY c.name;

// q4

MATCH (d:Degree)
WITH d, avg(d.credits) AS average MATCH (a:Degree)
WHERE a.credits > average
RETURN DISTINCT
a.name AS Name,
a.credits AS Credits;

// q5

MATCH (b)-[:TYPE]-(d:Degree)<-[:TEACHES]-(f)-[:LOCATED_IN]-(c:Campus)
WHERE b.name='Sciences'
RETURN
d.name AS Name,
d.mark_cut_off AS Mark_cut_off
ORDER BY d.mark_cut_off;