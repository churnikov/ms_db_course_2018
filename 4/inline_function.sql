with function
calculator (m number, r number) return number
is begin
return m * r;
end calculator;
select calculator(3, 2) as calc from dual


WITH
FUNCTION CamCase(op VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  RETURN initcap(op);
END;
SELECT CamCase(SEX) FROM TITANIC

SELECT SEX FROM TITANIC;