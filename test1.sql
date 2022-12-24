create table person(
person_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
first_name varchar2(50) NOT NULL,
last_name varchar2(50) NOT NULL,
PRIMARY KEY(person_id)
);
SELECT * FROM person;

ALTER TABLE person 
ADD age NUMBER  NOT NULL;

DESCRIBE person;

ALTER TABLE person MODIFY age NUMBER NOT NULL;

ALTER TABLE person DROP COLUMN  age;

ALTER TABLE person RENAME COLUMN ageNew to age;

INSERT into person(first_name,last_name,age) values('Harsh','Patange',6);
INSERT into person(first_name,last_name,age) values('Vaiabhav','Patange',6);
INSERT into person(first_name,last_name,age) values('Dhanshri','Patange',6);
select * from person;

SET SERVEROUTPUT ON;
DECLARE
fname person.first_name%Type;
lname person.last_name%Type;
BEGIN
select
first_name,last_name
into
fname,lname
from 
person
where 
person_id =2;
DBMS_OUTPUt.PUT_LINE(fname || ':' ||lname);
END;

SET SERVEROUTPUT ON;
DECLARE
mage person.age%TYPE;
fmin mage%TYPE;
fmax mage%TYPE;
favg magae%TYPE;

BEGIN
select
MIN(mage),
MAX(mage),
AVG(mage)

INTO
fmin,
fmax,
favg
FROM 
person;

SELECT
age 
INTO
mage 
from person
where
person_id=2;
DBMS_OUTPUT.PUT_LINE('Min value '|| fmin );
DBMS_OUTPUT.PUT_LINE('Max value '|| fmax );
DBMS_OUTPUT.PUT_LINE('Avg value '|| favg );
END;

SET SERVEROUTPUT ON;
DECLARE
myAge person.age%TYPE;
BEGIN
 select age into myAge from person where person_id = 2;
 DBMS_OUTPUT.put_line(MYAge);
 END;
 
 
 SET SERVEROUTPUT ON;
 DECLARE 
 v_pi CONSTANT NUMBER(7,6) := 3.14;
 BEGIN
 DBMS_OUTPUT.PUT_LINE(v_pi);
 END;
 
 
 --default keyword
 SET SERVEROUTPUT ON;
 DECLARE 
 v_pi CONSTANT NUMBER(7,6)NOT NULL DEFAULT 3.14;
 BEGIN
 DBMS_OUTPUT.PUT_LINE(v_pi);
 END;
 /
 -- IF then 
 
 SET SERVEROUTPUT ON;
 DECLARE
 v_sal NUMBER := 300000;
 BEGIN
 IF v_sal > 1000 THEN
 DBMS_OUTPUT.PUT_LINE('Salary is greater than 10000');
 END IF;
 END;
 /
 
 
 
 
 
 
 