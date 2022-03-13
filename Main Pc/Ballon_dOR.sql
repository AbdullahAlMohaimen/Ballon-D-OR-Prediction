
clear screen;
set serveroutput on;
set verify off;

drop table BundesLiga_Top;
drop table LeagueO_Top;

drop SEQUENCE BT;
drop SEQUENCE LLT;



create table BundesLiga_Top(
	bID int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number
	);
create sequence BT;

create or replace trigger BundesLiga_Top_Trigger
before insert on BundesLiga_Top
for each row
begin
	select BT.NEXTVAL into :NEW.bID from dual;
end;
/



create table LeagueO_Top(
	llID int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number
	);
create sequence LLT;

create or replace trigger LeagueO_Top_Trigger
before insert on LeagueO_Top
for each row
begin
	select LLT.NEXTVAL into :NEW.llID from dual;
end;
/

insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Robert Lewandowski','Bayern Munich',35,17;
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Thomas Muller','Bayern Munich',25,15);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Kingsley Coman','Bayern Munich',20,14);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Leroy Sane','Bayern Munich',20,10);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Erling Haland','Borrussia Dortmund',34,10);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Marco Reus','Borrussia Dortmund',25,14);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Raphael Guerriero','Borrussia Dortmund',15,15);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Serge Gnabry','Bayern Munich',25,14);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Patrick Schick','Bayer Leverkusen',26,10);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('C Nkunku','Rb Leipzig',27,15);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Andre Silva','Rb Leipzig',24,10);
insert into BundesLiga_Top(Name,Team_Name,Goal,Assist) VALUES('Fabian Wirtz','Bayer Leverkusen',28,10);



insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Lionel Messi','PSG',37,20);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Kylian Mbappe','PSG',33,18);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Neymar Jr','PSG',29,18);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Angel Di Maria','PSG',19,21);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Mauro Icardi','PSG',18,8);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Dimitri Payet','Marseille',19,8);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('M Dembele','Lyon',29,11);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('J David','Lille',25,15);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Ben Yedder','Monaco',19,8);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Radamel Falcao','Monaco',29,17);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Amine Gouiri','Nice',17,13);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Kevin Gameiro','Strasbourg',13,18);
insert into LeagueO_Top(Name,Team_Name,Goal,Assist) VALUES('Roman Faivre','Bordeaux',24,12);

drop table laliga_Server;

create table laliga_Server(lID int, Name varchar(20), Team_Name VARCHAR2(20), Goal NUMBER, Assist NUMBER);

INSERT INTO laliga_Server values(11, 'Aubameyang','Barcelona',20,17);
INSERT INTO laliga_Server values(12, 'Ferran Torres','Barcelona',23,21);
INSERT INTO laliga_Server values(13, 'De jong','Barcelona',15,22);

COMMIT;

select * from LaLiga_Top@siteA_link order by Goal desc;

select * from (select * from LaLiga_Top@siteA_link UNION select * from laliga_Server) ORDER BY Goal DESC;

select * from EPL_Top@siteA_link order by Goal desc;
select * from SeriaA_Top@siteA_link order by Goal desc;

select * from BundesLiga_Top order by Goal desc;
select * from LeagueO_Top order by Goal desc;


create or replace view BDR_shortList as
select Name,Team_Name,Goal,Assist from 
(select * from (select * from LaLiga_Top@siteA_link UNION select * from laliga_Server) ORDER BY Goal DESC) 
WHERE ROWNUM <=5
union
select Name,Team_Name,Goal,Assist from 
(select * from EPL_Top@siteA_link order by Goal desc) 
WHERE ROWNUM <=5
union
select Name,Team_Name,Goal,Assist from 
(select * from SeriaA_Top@siteA_link order by Goal desc) 
WHERE ROWNUM <=5
union
select Name,Team_Name,Goal,Assist from 
(select * from BundesLiga_Top order by Goal desc) 
WHERE ROWNUM <=5
union
select Name,Team_Name,Goal,Assist from 
(select * from LeagueO_Top order by Goal desc) 
WHERE ROWNUM <=5;



set linesize 500;
select * from BDR_shortList order by Goal desc;


drop table Ballon_Dor;
drop sequence RT;

create table Ballon_Dor(
	bDR int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number,
	Total_Points number
	);

create sequence RT;
create or replace trigger Ballon_Dor_Trigger
before insert on Ballon_Dor
for each row
begin
	select RT.NEXTVAL into :NEW.bDR from dual;
end;
/


drop table Ballon_DorFinalList;
drop sequence FL;

create table Ballon_DorFinalList(
	Position int not null,
	Name varchar2(20),
	Team_Name varchar2(20),
	Goal number,
	Assist number,
	Total_Points number
	);

create sequence FL;
create or replace trigger Ballon_DorFinalList_Trigger
before insert on Ballon_DorFinalList
for each row
begin
	select FL.NEXTVAL into :NEW.Position from dual;
end;
/



declare
	N Ballon_Dor.Name%Type;
	T Ballon_Dor.Team_Name%Type;
	G Ballon_Dor.Goal%Type;
	A Ballon_Dor.Assist%Type;
	P Ballon_Dor.Total_Points%Type;
	
	x Ballon_Dor.Total_Points%Type;
	y Ballon_Dor.Total_Points%Type;
begin
	
	for i in (select Name,Team_Name,Goal,Assist from 
	(select * from BDR_shortList order by Goal desc) order by Assist desc) loop
	
	N:=i.Name;
	T:=i.Team_Name;
	G:=i.Goal;
	A:=i.Assist;
	
	P:=TotalPoints(G,A);
	
	Insert into Ballon_Dor(Name,Team_Name,Goal,Assist,Total_Points)
	values(N,T,G,A,P);
	
	end loop;
	
	
EXCEPTION	
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA not found');
		
	WHEN DUP_VAL_ON_INDEX THEN
		DBMS_OUTPUT.PUT_LINE('DUPPLICATE VALUE');
		
	WHEN PROGRAM_ERROR THEN
		DBMS_OUTPUT.PUT_LINE('DATA not found');
		
	WHEN INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE('INVALID NUMBER');
		
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
	
end;
/



CREATE OR REPLACE FUNCTION TotalPoints(A IN Ballon_Dor.Goal%Type,B IN Ballon_Dor.Assist%Type)
RETURN Ballon_Dor.Total_Points%Type
IS
	x Ballon_Dor.Total_Points%Type;
	y Ballon_Dor.Total_Points%Type;
	Total Ballon_Dor.Total_Points%Type;
BEGIN
	x:=A*5;
	y:=B*2;
	
	Total:=x+y;
	
	return Total;
	
END TotalPoints;
/

declare
	N Ballon_Dor.Name%Type;
	T Ballon_Dor.Team_Name%Type;
	G Ballon_Dor.Goal%Type;
	A Ballon_Dor.Assist%Type;
	P Ballon_Dor.Total_Points%Type;
begin
	for i in(select Name,Team_Name,Goal,Assist,Total_Points from Ballon_Dor order by Total_Points DESC)
	Loop
	N:=i.Name;
	T:=i.Team_Name;
	G:=i.Goal;
	A:=i.Assist;
	P:=i.Total_Points;
	
	insert into Ballon_DorFinalList(Name,Team_Name,Goal,Assist,Total_Points) values(N,T,G,A,P);
	end loop;
end;
/

CREATE OR REPLACE PROCEDURE FindPlayer(M IN Ballon_Dor.Name%Type)
IS
	N Ballon_DorFinalList.Name%Type;
	T Ballon_DorFinalList.Team_Name%Type;
	G Ballon_DorFinalList.Goal%Type;
	A Ballon_DorFinalList.Assist%Type;
	P Ballon_DorFinalList.Total_Points%Type;
	Pst Ballon_DorFinalList.Position%Type;
BEGIN
	Select Position,Name,Team_Name,Goal,Assist,Total_Points
	into Pst,N,T,G,A,P from Ballon_DorFinalList where Name=M;
	
	DBMS_OUTPUT.PUT_LINE('Position: '||Pst);
	DBMS_OUTPUT.PUT_LINE('Name: '||N);
	DBMS_OUTPUT.PUT_LINE('Team Name: '||T);
	DBMS_OUTPUT.PUT_LINE('Goal: '||G);
	DBMS_OUTPUT.PUT_LINE('Assist: '||A);
	DBMS_OUTPUT.PUT_LINE('Total Points: '||P);
	
EXCEPTION	
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA not found');
		
	WHEN DUP_VAL_ON_INDEX THEN
		DBMS_OUTPUT.PUT_LINE('DUPPLICATE VALUE');
		
	WHEN PROGRAM_ERROR THEN
		DBMS_OUTPUT.PUT_LINE('DATA not found');
		
	WHEN INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE('INVALID NUMBER');
		
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
END FindPlayer;
/


select * from Ballon_DorFinalList order by Total_Points DESC;

ACCEPT P PROMPT "Find a Player: ";

declare 
	A Ballon_Dor.Name%Type;
Begin
	A:='&P';
	FindPlayer(A);
end;
/

