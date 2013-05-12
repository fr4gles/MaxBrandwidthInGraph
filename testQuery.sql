use ztp;

drop table Gtable;

CREATE TABLE Gtable ( 
 id int NOT NULL, 
 x int NOT NULL, 
 y int NOT NULL, 
 p float NOT NULL, 
PRIMARY KEY ( id )
)

select * from Gtable;


insert into gtable values 
(1,0,1,90.01),
(2,0,2,70.01),
(3,1,3,100.01),
(4,2,3,120.01),
(5,2,1,10.01);


insert into gtable values 
(1,0,1,90.01),
(2,0,2,70.01),
(3,1,3,100.01),
(4,2,3,120.01),
(5,2,1,10.01),
(6,0,4,1000.01),
(7,4,3,10.01);



insert into gtable values (1,1,2,8);
insert into gtable values (2,1,3,5);
insert into gtable values (3,2,5,1);
insert into gtable values (4,3,4,7);
insert into gtable values (5,4,6,6);
insert into gtable values (6,5,6,8);
insert into gtable values (7,5,7,5);
insert into gtable values (8,6,8,2);
insert into gtable values (9,7,8,2);
insert into gtable values (10,7,9,9);
insert into gtable values (11,8,9,2);