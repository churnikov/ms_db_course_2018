-- 1
SELECT 1

-- 2
CREATE TABLE `titanic`
(
`PassengerId` UInt16,
`Survived` UInt8,
`Pclass` UInt8,
`Sex` String,
`Age` Float64,
`SibSp` UInt8,
`Parch` UInt8,
`Ticket` String,
`Fare` Float64,
`Cabin` String,
`Embarked` String
) ENGINE = Log;

DROP TABLE titanic

-- 3
SELECT * FROM titanic LIMIT 10

-- 4
SELECT Survived, count() FROM titanic GROUP BY Survived ORDER BY count();

-- 5
SELECT Age, count() FROM titanic GROUP BY Age ORDER BY count();