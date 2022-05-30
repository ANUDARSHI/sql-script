REM   Script: Assignment3 Completed
REM   Done

create table student ( 
studentid char(5) primary key, 
last varchar(15) not null, 
first varchar(15) not null, 
street varchar(25), 
city varchar(15), 
state varchar(2) default 'nj', 
zip varchar(5), 
startterm char(4), 
birthday date, 
facultyid number(3), 
majorid number(3), 
phone char(10) 
);

create table faculty ( 
facultyid number(3) primary key, 
name varchar(15) not null, 
roomid number(2), 
phone char(3) unique, 
deptid number(1) 
);

create table crssection (  
csid number(4) primary key,  
courseid varchar(6) not null,  
section char(2) not null,  
termid char(4) not null,  
facultyid number(3),  
day varchar(2),  
starttime varchar(5),  
endtime varchar(5),  
roomid number(2),  
maxcount number(2) check (maxcount>0)  
);

create table course ( 
courseid varchar(6) primary key, 
title varchar(20) unique, 
credits number(1) check ((credits >= 0) and (credits <= 4)), 
prereq varchar(6) 
);

create table room ( 
roomtype char primary key, 
roomdesc varchar(9) 
);

create table location ( 
roomid number(2) primary key, 
building varchar(7) not null, 
roomno char(3) not null unique, 
capacity number(2) check (capacity > 0), 
roomtype char 
);

create table term ( 
termid char(4) primary key, 
termdesc varchar(11), 
startdate date, 
enddate date 
);

create table department ( 
deptid number(1) primary key, 
deptname varchar(20), 
facultyid number(3) 
);

create table major ( 
majorid number(3) primary key, 
majordesc varchar(25) 
);

create table registeration ( 
studentid char(5), 
csid number(4), 
midterm char check( midterm in ('a', 'b', 'c', 'd', 'f', 'w')), 
final char check(final in ('a', 'b', 'c', 'd', 'f', 'w')), 
regstatus char check (regstatus in ('x', 'r', 'w')), 
Primary key(studentid, csid) 
);

alter table student add constraint c1 foreign key(startterm) references term(termid);

alter table student add constraint c2 foreign key(facultyid) references faculty(facultyid);

alter table student add constraint c3 foreign key(majorid) references major(majorid);

alter table faculty add constraint c4 foreign key(roomid) references location(roomid);

alter table faculty add constraint c5 foreign key(deptid) references department(deptid);

alter table crssection add constraint c6 foreign key(courseid) references course(courseid);

alter table crssection add constraint c7 foreign key(termid) references term(termid);

alter table crssection add constraint c8 foreign key(facultyid) references faculty(facultyid);

alter table crssection add constraint c9 foreign key(roomid) references location(roomid);

alter table course add constraint c10 foreign key(prereq) references course(courseid);

alter table registeration add constraint c11 foreign key(studentid) references student(studentid);

alter table registeration add constraint c12 foreign key(csid) references crssection(csid);

alter table location add constraint c13 foreign key(roomtype) references room(roomtype);

alter table department add constraint c14 foreign key(facultyid) references faculty(facultyid);

