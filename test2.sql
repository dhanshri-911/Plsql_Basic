


--procedure
create table student(id number(10)primary key,name varchar2(100));

--procedure for inserting record

create or replace procedure "INSERTUSER"
(id IN number,
name IN VARCHAR2)
is 
begin
insert into student values (id,name);
end;
/


begin 
insertuser(1,'Dhanshri');
dbms_output.put_line('Record Insert Successfully');
end;

select * from student;

begin
insertuser(2,'Rajshri');
end;

--proc


-- drop procedure

drop procedure insertuser;


--procedure

create  or replace procedure "insertuser"
(id IN number,name IN varchar2 )
is
begin 
insert into student values(id,name);
end;
/

begin 
insertuser(1,'harsh');
end;

select * from student;


drop procedure insertuser;



--function

create function adder(n1 in number, n2 in number)
return number
is
n3 number(8);
begin 
n3 := n1 + n2;
return n3;
end;
/
set SERVEROUTPUT on;
declare
n3 number(3);
begin
n3 := adder(11,22);
dbms_output.put_line('adder ' ||n3);
end;



--
create or replace function multy(n1 in number, n2 in number)
return number
is
n3 number(3);
begin 
n3:= n1* n2;
return n3;
end;
/

--multy
declare
n3 number(3);
begin 
n3 := multy(11,22);
dbms_output.put_line('multiplication' || n3);
end;
/


--Function example


declare
n1 number;
n2 number;
n3 number;
function findMax(x in number, y in number)
return number
is
z number;
begin
if x>y then 
z:=x;
else
z:=y;
end if;
 return z;
 end;
 begin
 n1 := 10;
 n2 := 20;
 n3 := findMax(n1,n2);
 dbms_output.put_line('max number' || n3);
 end;
 
/



-- create table

create table custmer(id number(4) primary key,name varchar2(20), department varchar(5),salary number);

insert into custmer(id,name,department,salary) values(1,'Harsh','web ',1000);
insert into custmer(id,name,department,salary) values(2,'Dhanshri','web ',2000);
insert into custmer(id,name,department,salary) values(3,'Rajshri','web ',3000);
insert into custmer(id,name,department,salary) values(4,'Vaibhav','andr ',4000);

select * from custmer;

select count(*) from custmer;



-- function
create function total_custmer
return number
is
total number(5) := 0;
begin
select count(*) into total
from custmer;
return total;
end;

declare
num number;
begin
num := total_custmer();
dbms_output.put_line('Total custmer' || num);
end;
/

declare
total_rows number(2);
begin
update custmer 
set salary = salary +5000;
if sql%notfound then
dbms_output.put_line('No table is affectede');
elsif sql%found then
dbms_output.put_line(total_rows ||'affectede');
end if;
end;

select * from custmer;



declare 
c_id custmer.id%type;
c_name custmer.name%type;

cursor c_custmer is select id,name from custmer;
begin 
open c_custmer ;
loop 
fetch c_custmer into c_id,c_name;
exit when  c_custmer%notfound;
dbms_output.put_line(c_id || c_name);
end loop;
close c_custmer;

end;
/
 -- exception
  declare
  c_id custmer.id%type :=4;
  c_name custmer.name%type;
  begin 
  select name into c_name from custmer
  where id=c_id;
  dbms_output.put_line('anme '|| c_name);
  exception
  when no_data_found then
dbms_output.put_line('no scutmer found at this id');
when others then 
dbms_output.put_line('no scutmer');
  end;