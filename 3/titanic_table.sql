CREATE TABLE titanic
(
passengerid NUMBER PRIMARY KEY,
survived    NUMBER,
pclass      NUMBER,
name        VARCHAR(100),
sex         VARCHAR(7),
age         NUMBER,
sibsp       NUMBER,
parch       NUMBER,
ticket      VARCHAR(100),
fare        NUMBER,
cabin       VARCHAR(20),
embarked    VARCHAR(1)
);