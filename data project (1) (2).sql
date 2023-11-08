create table Hospital_Rooms
(
Rooms_ID char(8) not null,
Residency_duration varchar(11),
primary key (Rooms_ID)
);

insert into Hospital_Rooms (Rooms_ID,Residency_duration) values ('120','24');
insert into Hospital_Rooms (Rooms_ID,Residency_duration) values ('121','12');

create table Hospital_Patient 
( 
Patient_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Patient_DOB date,
Rooms_ID char(8),
primary key (Patient_ID),
foreign key (Rooms_ID) references Hospital_Rooms (Rooms_ID)
);

insert into Hospital_Patient (Patient_ID,First_Name,Last_Name,Patient_DOB,Rooms_ID) values ('100123','sara','khaled','2000-12-1','120');
insert into Hospital_Patient (Patient_ID,First_Name,Last_Name,Patient_DOB,Rooms_ID) values ('100124','tia','zaid','2018-7-9','121');

select count (Patient_ID) 
from Hospital_Patient;  


create table Hospital_Rooms_Type 
(
Rooms_ID char(8) not null,
Rooms_Type varchar(20) not null,
primary key (Rooms_ID,Rooms_Type),
foreign key (Rooms_ID) references Hospital_Rooms (Rooms_ID)
);

insert into Hospital_Rooms_Type (Rooms_ID ,Rooms_Type) values ('120','Suite'); 
insert into Hospital_Rooms_Type (Rooms_ID ,Rooms_Type) values ('121','Deluxe '); 

create table Treatment_Type
(
Price numeric(8,2) not null,
Surgery varchar(15),
Medicine varchar(25),
Physical_therapy varchar(18),
primary key (Price)
);

insert into Treatment_Type (Price,Surgery,Medicine,Physical_therapy) values (1000.0,'pelvic fracture','LIRICA','YES');
insert into Treatment_Type (Price,Surgery,Medicine,Physical_therapy) values (50.5,'NO','VITAMIN C','NO');

create table Taking_Care 
(
Patient_ID char(7) not null,
Price numeric(8,2) not null,
primary key (Patient_ID, Price),
foreign key (Patient_ID) references Hospital_Patient (Patient_ID),
foreign key (Price) references Treatment_Type (Price)
);

insert into Taking_Care  ( Patient_ID,Price) values ('100123',1000.0);
insert into Taking_Care  ( Patient_ID,Price) values ('100124',50.5);

create table Visitors
(
Patient_ID char(7) not null,
Visitor_Name varchar(24) not null,
Visitors_contact_number char(11),
Visitors_Relation varchar(12),
Visiting_Time datetime,
primary key (Patient_ID,Visitor_Name),
foreign key (Patient_ID) references Hospital_Patient (Patient_ID)
);

insert into Visitors (Patient_ID,Visitor_Name,Visitors_contact_number,Visitors_Relation,Visiting_Time) values ('100123','Ali','0779362975','Brother','2020-12-12 1:36:14');
insert into Visitors (Patient_ID,Visitor_Name,Visitors_contact_number,Visitors_Relation,Visiting_Time) values ('100124','Omar','0799332575','Brother','2020-12-12 1:40:58');

create table Hospital_Employee
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
primary key (Emp_ID)
);

insert into Hospital_Employee(Emp_ID,First_Name,Last_Name,Salary,Emp_sex) values ('200145','Sia','Ahmad',1000.0,'Female');
insert into Hospital_Employee(Emp_ID,First_Name,Last_Name,Salary,Emp_sex) values ('200146','Saleh','Ahmad',250,'Male');

create table Hospital_Employee_Emp_contact_num
(
Emp_ID char(7) not null,
Emp_contact_num char(11) not null,
primary key (Emp_ID, Emp_contact_num),
foreign key (Emp_ID) references Hospital_Employee (Emp_ID)
);

insert into Hospital_Employee_Emp_contact_num(Emp_ID,Emp_contact_num) values ('200145','0779542876');
insert into Hospital_Employee_Emp_contact_num(Emp_ID,Emp_contact_num) values ('200146','0795026765');

create table Hospital_Management
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Emp_Rank varchar(30),
primary key (Emp_ID)
);

insert into Hospital_Management (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('219076','Raed','khattab',1000,'Male','Hospital Administrator');
insert into Hospital_Management (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('219077','Rawan','Ahmad',2000.5,'Female','Dean Of the Hospital');

create table Financial_affair
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Emp_Rank varchar(30),
primary key (Emp_ID)
);

insert into Financial_affair (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('56758','Alia','Rakan',450.6,'Female','Tax Specialist');
insert into Financial_affair (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('56759','Samer','suaad',500.0,'Male','Budget Manager');

create table Reception
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Emp_Rank varchar(30),
primary key (Emp_ID)
);

insert into Reception (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('6743','Sera','Ash',300.0,'Female','Reception trainer');
insert into Reception (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Emp_Rank) values ('6744','Naya','Yanal',300.0,'Female','Regular Receptionist');

create table Nurse
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Age char(3),
primary key (Emp_ID)
);

insert into Nurse (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('9876','Tara','Murad',500.0,'Female','26');
insert into Nurse (Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('9875','Bayan','Murad',500.0,'Female','31');

create table Doctor 
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Age char(3),
primary key (Emp_ID)
);

insert into Doctor(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3892','Natalie','Khaled',2000.0,'Female','34');
insert into Doctor(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3872','Afnan','Ali',2000.4,'Female','36');

create table Trainer
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Age char(3),
primary key (Emp_ID)
);

insert into Trainer(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3872','Tamara','samer',800,'Female','25');
insert into Trainer(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3862','Dana','ghazal',800,'Female','25');

create table Permanent
(
Emp_ID char(7) not null,
First_Name varchar(10),
Last_Name varchar(10),
Salary numeric(8,2),
Emp_sex varchar(7),
Age char(3),
primary key (Emp_ID)
);

insert into Permanent(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3862','Rawan','ahamd',600,'Female','27');
insert into Permanent(Emp_ID,First_Name,Last_Name,Salary,Emp_sex,Age) values ('3882','Zaid','khaled',600,'Male','27');

create table Caring_For 
(
Patient_ID char(7) not null,
Emp_ID char(7) not null,
primary key (Patient_ID, Emp_ID),
foreign key (Patient_ID) references Hospital_Patient (Patient_ID),
foreign key (Emp_ID) references Hospital_Employee (Emp_ID)
);

insert into Caring_For(Patient_ID,Emp_ID) values ('100123','200145');
insert into Caring_For(Patient_ID,Emp_ID) values ('100124','200146');

create table Treating 
(
Patient_ID char(7) not null,
Emp_ID char(7) not null,
primary key (Patient_ID, Emp_ID),
foreign key (Patient_ID) references Hospital_Patient (Patient_ID),
foreign key (Emp_ID) references Hospital_Employee (Emp_ID)
);

insert into Treating(Patient_ID,Emp_ID) values('100123','200145');
insert into Treating(Patient_ID,Emp_ID) values ('100124','200146');

select Visitors.Visitor_Name , Hospital_Patient.First_Name
from Visitors Inner Join Hospital_Patient
on Visitors.Patient_ID = Hospital_Patient.Patient_ID


