create database Employee112;

use Employee112;
create table dept(no varchar(20) primary key,
 dname varchar(20),
 dloc varchar(20));

create table employee(empno int,
ename varchar(20),
mgr_no int,
hiredate varchar(20),
 sal float,
no varchar(20),
primary key(empno,no), 
foreign key(no) references dept(no));
create table incentives(empno int,
 date VARCHAR(20)
 , amt float
 ,primary key(empno,date),
 foreign key(empno) references employee(empno));
create table project(pno int primary key, 
ploc VARCHAR(20),
pname varchar(20));
create table Assingnedto(empno int,
 pno int,
 job_role text, 
 primary key(empno,pno),
 foreign key(empno) references employee(empno),
 foreign key(pno) references project(pno));

insert into dept values(1,"cse","pj");
insert into dept values(2,"ise","pj");
insert into dept values(3,"csds","pg");
insert into dept values(4,"ece","pg");
insert into dept values(5,"aiml","pj");
insert into employee values(101,"mdr",100,"12/01/1999",100000,1);
insert into employee values(201,"sak",200,"17/01/2020",50000,2);
insert into employee values(301,"grp",100,"01/09/2004",30000,3);
insert into employee values(401,"sws",101,"03/08/2000",10000,4);
insert into employee values(501,"sks",101,"29/2/2008",90000,5);
insert into incentives values(101,"12/03/2004",50000);
insert into incentives values(201,"17/03/2024",25000);
insert into incentives values(301,"01/12/2019",15000);
insert into incentives values(401,"03/11/2019",5000);
insert into incentives values(501,"29/4/2019",45000);


insert into project values(10,"bng","chatbot");
insert into project values(40,"delhi","ml model");
insert into project values(50,"bombay","blockchain");
insert into project values(30,"chennai","stocks");
insert into project values(80,"mysore","android app");
insert into Assingnedto values(101,10,"devops");
insert into Assingnedto values(201,40,"sde");
insert into Assingnedto values(301,50,"manager");
insert into Assingnedto values(401,30,"jpa");
insert into Assingnedto values(501,80,"pa");
insert into project values(90, 'hyderabad', 'web app');
delete from incentives where empno = 401;
update dept set dloc = 'bng' where no = 1;
select * from dept;
select * from EMPLOYEE;
select * from INCENTIVES;
select * from PROJECT;
select * from Assingnedto;

SELECT EMPNO
FROM ASSINGNEDTO AT,PROJECT P
WHERE AT.PNO=P.PNO AND PLOC IN('BNG','HYDERABAD','MYSORE');
select e.empno
from employee e
where e.empno != all(select i.empno from incentives i);

SELECT ENAME,E.EMPNO,DNAME,JOB_ROLE,DLOC,PLOC
FROM DEPT D,EMPLOYEE E,PROJECT P,ASSINGNEDTO AT
WHERE D.NO=E.NO AND E.EMPNO=AT.EMPNO AND P.PNO=AT.PNO AND D.DLOC=P.PLOC;

SELECT e.empno, e.ename, a.job_role, p.pname, p.ploc
FROM employee e
LEFT JOIN Assingnedto a ON e.empno = a.empno
LEFT JOIN project p ON a.pno = p.pno;

SELECT e.empno, e.ename, SUM(i.amt) AS total_incentive
FROM employee e
JOIN incentives i ON e.empno = i.empno
GROUP BY e.empno;

SELECT p.pname, p.ploc
FROM Assingnedto a
JOIN employee e ON a.empno = e.empno
JOIN project p ON a.pno = p.pno
WHERE a.job_role = 'manager';

SELECT d.dname, COUNT(e.empno) AS num_employees
FROM dept d
LEFT JOIN employee e ON d.no = e.no
GROUP BY d.dname;

SELECT e.empno, e.ename
FROM employee e
LEFT JOIN Assingnedto a ON e.empno = a.empno
WHERE a.empno IS NULL;

SELECT e.empno, e.ename, d.dname, d.dloc
FROM employee e
JOIN dept d ON e.no = d.no;

SELECT e.empno, e.ename, e.mgr_no
FROM employee e
WHERE e.mgr_no = 101;

SELECT p.pname, p.ploc, COUNT(a.empno) AS num_employees
FROM project p
JOIN Assingnedto a ON p.pno = a.pno
GROUP BY p.pno;

SELECT e1.empno, e1.ename, e1.mgr_no, d.dname, d.dloc
FROM employee e1
JOIN employee e2 ON e1.mgr_no = e2.empno
JOIN dept d ON e1.no = d.no
WHERE e1.mgr_no = e2.empno;

SELECT e.empno, e.ename, SUM(i.amt) AS total_incentive
FROM employee e
JOIN incentives i ON e.empno = i.empno
GROUP BY e.empno;

SELECT e.empno, e.ename
FROM employee e
JOIN Assingnedto a ON e.empno = a.empno
WHERE a.job_role = 'devops' OR a.job_role = 'developer';

SELECT d.dname, AVG(e.sal) AS avg_salary
FROM dept d
JOIN employee e ON d.no = e.no
GROUP BY d.dname;
