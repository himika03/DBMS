create database Insuarance;
use insuarance;
create table Person(
driver_id varchar(10),
name varchar(10),
address varchar(40),
primary key(driver_id)
);

create table car(
reg_num varchar(20),
model varchar(10),
year int,
primary key(reg_num)
);

create table accident(
report_num int,
accident_date date,
location varchar(20),
primary key(report_num)
);

create table OWNN(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

create table participates(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);

insert into person values('A01','Richard','Srinivas nagar');
insert into person values('A02','Pradeep','Rajaji nagar');
insert into person values('A03','Smith','Ashok nagar');
insert into person values('A04','Venu','N R Colony');
insert into person values('A05','John','Hanumanth nagar');

insert into car values('KA052250','Indica',1990);
insert into car values('KA031181','Lancer',1957);
insert into car values('KA095477','Toyota',1998);
insert into car values('KA0523408','Honda',2008);
insert into car values('KA041702','Audi',2005);      

insert into accident values(11, '2003-01-01', 'Mysore Road');
insert into accident values (12,'2004-02-02','South end Circle');
insert into accident values (13,'2003-01-21','Bull temple Road');
insert into accident values (14,'2008-02-17','Mysore Road');
insert into accident values (15,'2004-03-05','Kanakpura Road');

insert into OWNs values('A01','KA052250');
insert into OWNs values('A02','KA031181');
insert into OWNs values('A03','KA095477');
insert into OWNs values('A04','KA0523408');
insert into OWNs values('A05','KA041702');

insert into participates values('A01','KA052250',11,10000);
insert into participates values('A02','KA031181',11,10000);
insert into participates values('A03','KA095477',11,10000);
insert into participates values('A04','KA0523408',11,10000);
insert into participates values('A05','KA041702',11,10000);

select accident_date,location
from accident;

update participates
set damage_amount=25000
where reg_num= 'KA0523408'
and report_num=12;

commit;

select* from participated;
insert into accident values(16,'15-03-08','Domlur');

select* from accident;
select driver_id
from PARTICIPATED
where damage_amount=25000;









