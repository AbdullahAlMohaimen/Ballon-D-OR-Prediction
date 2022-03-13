drop table LaLiga_Top;
drop table EPL_Top;
drop table SeriaA_Top;
drop table BundesLiga_Top;
drop table LeagueO_Top;

drop SEQUENCE LT;
drop SEQUENCE ET;
drop SEQUENCE ST;



create table LaLiga_Top(
	lID int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number
	);
create sequence LT;
create or replace trigger Laliga_Top_Trigger
before insert on LaLiga_Top
for each row
begin
	select LT.NEXTVAL into :NEW.lID from dual;
end;
/



create table EPL_Top(
	eID int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number
	);
create sequence ET;

create or replace trigger EPL_Top_Trigger
before insert on EPL_Top
for each row
begin
	select ET.NEXTVAL into :NEW.eID from dual;
end;
/


create table SeriaA_Top(
	sID int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number
	);
create sequence ST;

create or replace trigger SeriaA_Top_Trigger
before insert on SeriaA_Top
for each row
begin
	select ST.NEXTVAL into :NEW.sID from dual;
end;
/







insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Karim Benzema','Real Mardid',31,12);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Luis Suarez','Athletico Madrid',28,12);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Ansu Fati','Barcelona',25,15);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Ivan Rakitic','Sevilla',14,20);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Iker Munian','Athletico Bilbao',20,14);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Joao Felix','Atletico Madrid',20,12);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Inaki Williams','Atletico Bilbao',22,13);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Iago Aspas','Celta vigo',20,10);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Pedri Gonzalez','Barcelona',25,15);
insert into LaLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Vinicious Junior','Real Madrid',20,15);




insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Mohammad Salah','Liverpool',35,16);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Sadio Mane','Liverpool',25,13);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Kevin De Bruyn','Manchester City',26,15);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Bruno Fernandez','Manchester United',20,20);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Cristiano Ronaldo','Manchester United',25,7);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Marcus Rashford','Manchester United',20,15);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Riyad Mahrez','Manchester City',25,10);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Harry Kane','Tottenham Hotspur',30,12);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Phil Foden','Manchester City',25,14);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Bernardo Silva','Manchester City',20,12);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Son Hyung Min','Tottenham Hotspur',30,15);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Kai Havertz','Chelsea',30,12);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Jamie Vardy','Liecester City',30,14);
insert into EPL_Top(Name,Team_Name,Goal,Assist) VALUES('Bukayo Saka','Arsenal',25,15);


insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Paulo Dybala','Juventus',25,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Dusan Vlahovic','Juventus',33,10);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Alvaro Morata','Juventus',25,12);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Lautaro Martinez','Inter Milan',25,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Ivan Perisic','Inter Milan',25,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Zlatan Ivrahimovich','AC Milan',27,17);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Hakan Chahanoglu','Inter Milan',20,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Olivier Ziroud','AC Milan',25,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Lorenzo Insigne','Napoli',22,17);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Victor Oshimen','Napoli',29,5);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Dries Mertens','Napoli',20,10);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Tammy Abraham','Roma',23,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Ciro Immobile','Lazio',29,15);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Edin Dzeko','Roma',25,14);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('Duvasn Zapata','Atlanta',25,13);
insert into SeriaA_Top(Name,Team_Name,Goal,Assist) VALUES('G Simieone','Cagliari',24,15);

commit;