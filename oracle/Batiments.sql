drop table lesMesures;
drop table lesmesures_temp;
drop table LesReunions;
drop table LesPieces;

create table LesPieces (
		pid integer,
		eid  integer,
		usage varchar(30),
		capacite integer,
		constraint pieces_1 primary key (pid),
		constraint pieces_2 check (capacite >= 0)
);

create table LesMesures (
		pid integer,
		dateMes date,
		hum number (8,2),
		temp number (8,2),
		lum number (8,2),
		constraint mesures_1 primary key (pid,dateMes),
		constraint mesures_2 foreign key (pid) references LesPieces(pid)
);

create table lesmesures_temp (
		pid integer,
		dateMes date,
		hum number (8,2),
		temp number (8,2),
		lum number (8,2)
);

create table LesReunions (
		pid integer,
		debut date,
		fin date,
		objet varchar(40),
		nom varchar (30),
		prenom varchar (30),
		constraint reunions_1 primary key (pid,debut),
		constraint reunions_3 unique (pid,fin),
		constraint reunions_2 foreign key (pid)	references LesPieces(pid)
);

insert into LesPieces values (10,1,'cafeteria', 110);
insert into LesPieces values (11, 2, 'archives', 0);
insert into LesPieces values (12, 3, 'archives', 0);
insert into LesPieces values (21, 1, 'salle de reunion', 20);
insert into LesPieces values (22, 2, 'bureau', 3);
insert into LesPieces values (23, 3, 'bureau', 3);
insert into LesPieces values (24, 4, 'bureau', 3);
insert into LesPieces values (25, 5, 'bureau', 3);
insert into LesPieces values (26, 6, 'salle de reunion', 12);
insert into LesPieces values (31, 1, 'salle de reunion', 90);
insert into LesPieces values (32, 2, 'bureau', 3);
insert into LesPieces values (33, 3, 'bureau', 10);
insert into LesPieces values (34, 4, 'bureau', 8);
insert into LesPieces values (35, 5, 'bureau', 3);
insert into LesPieces values (36, 6, 'salle de reunion', 10);
insert into LesPieces values (41, 1,'bureau', 3);
insert into LesPieces values (42, 2,'bureau', 8);
insert into LesPieces values (43, 3,'bureau', 3);
insert into LesPieces values (44, 4,'bureau', 7);
insert into LesPieces values (45, 5,'bureau', 3);
insert into LesPieces values (46, 6,'bureau', 2);
insert into LesPieces values (51, 1, 'salle de reunion', 100);
insert into LesPieces values (52, 2, 'salle de reunion', 12);
insert into LesPieces values (53, 3, 'salle de reunion', 20);

insert into LesReunions values (21,to_date('03/01/2008 12:00', 'DD/MM/YYYY HH24:MI'), to_date('03/01/2008 13:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (21,to_date('04/01/2008 13:30', 'DD/MM/YYYY HH24:MI'), to_date('04/01/2008 14:30', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (26,to_date('05/01/2008 15:30', 'DD/MM/YYYY HH24:MI'), to_date('05/01/2008 17:30', 'DD/MM/YYYY HH24:MI'), 'visiteurs A','Durand','Paulette');
insert into LesReunions values (31,to_date('06/01/2008 08:45', 'DD/MM/YYYY HH24:MI'), to_date('06/01/2008 11:45', 'DD/MM/YYYY HH24:MI'), 'CE','Martin','Babette');
insert into LesReunions values (21,to_date('06/01/2008 10:00', 'DD/MM/YYYY HH24:MI'), to_date('06/01/2008 10:30', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (21,to_date('06/01/2008 17:45', 'DD/MM/YYYY HH24:MI'), to_date('07/01/2008 19:45', 'DD/MM/YYYY HH24:MI'), 'visiteurs B', 'Dupond','Gustave');
insert into LesReunions values (36,to_date('07/01/2008 10:00', 'DD/MM/YYYY HH24:MI'), to_date('07/01/2008 12:00', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (51,to_date('07/01/2008 11:45', 'DD/MM/YYYY HH24:MI'), to_date('07/01/2008 13:45', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (51,to_date('08/01/2008 14:00', 'DD/MM/YYYY HH24:MI'), to_date('08/01/2008 16:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (53,to_date('04/01/2008 08:00', 'DD/MM/YYYY HH24:MI'), to_date('04/01/2008 11:00', 'DD/MM/YYYY HH24:MI'), 'visiteurs B','Martin','Babette');
insert into LesReunions values (51,to_date('12/01/2008 09:00', 'DD/MM/YYYY HH24:MI'), to_date('13/01/2008 18:00', 'DD/MM/YYYY HH24:MI'), 'CE', 'Dupond','Gustave');
insert into LesReunions values (26,to_date('21/01/2008 10:30', 'DD/MM/YYYY HH24:MI'), to_date('21/01/2008 12:30', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Dupond','Gustave');
insert into LesReunions values (21,to_date('24/01/2008 12:45', 'DD/MM/YYYY HH24:MI'), to_date('24/01/2008 16:45', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (26,to_date('24/01/2008 17:00', 'DD/MM/YYYY HH24:MI'), to_date('24/01/2008 19:00', 'DD/MM/YYYY HH24:MI'), 'visiteurs B','Durand','Paulette');
insert into LesReunions values (31,to_date('15/01/2008 18:30', 'DD/MM/YYYY HH24:MI'), to_date('15/01/2008 20:30', 'DD/MM/YYYY HH24:MI'), 'CE','Martin','Babette');
insert into LesReunions values (52,to_date('04/01/2008 14:45', 'DD/MM/YYYY HH24:MI'), to_date('04/01/2008 15:45', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Durand','Paulette');
insert into LesReunions values (53,to_date('21/01/2008 12:45', 'DD/MM/YYYY HH24:MI'), to_date('21/01/2008 16:45', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C', 'Dupond','Gustave');
insert into LesReunions values (21,to_date('14/01/2008 17:00', 'DD/MM/YYYY HH24:MI'), to_date('14/01/2008 19:00', 'DD/MM/YYYY HH24:MI'), 'visiteurs A','Durand','Paulette');
insert into LesReunions values (21,to_date('15/01/2008 18:30', 'DD/MM/YYYY HH24:MI'), to_date('15/01/2008 20:30', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C','Martin','Babette');
insert into LesReunions values (21,to_date('03/12/2007 12:00', 'DD/MM/YYYY HH24:MI'), to_date('03/12/2007 14:00', 'DD/MM/YYYY HH24:MI'), 'CE','Dupond','Arthur');
insert into LesReunions values (21,to_date('04/12/2007 13:30', 'DD/MM/YYYY HH24:MI'), to_date('04/12/2007 16:30', 'DD/MM/YYYY HH24:MI'), 'visiteurs B','Martin','Babette');
insert into LesReunions values (26,to_date('05/12/2007 15:30', 'DD/MM/YYYY HH24:MI'), to_date('05/12/2007 19:30', 'DD/MM/YYYY HH24:MI'), 'visiteurs A','Martin','Babette');
insert into LesReunions values (31,to_date('06/12/2007 08:45', 'DD/MM/YYYY HH24:MI'), to_date('06/12/2007 18:45', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (21,to_date('06/12/2007 10:00', 'DD/MM/YYYY HH24:MI'), to_date('06/12/2007 18:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction', 'Dupond','Gustave');
insert into LesReunions values (53,to_date('06/12/2007 17:45', 'DD/MM/YYYY HH24:MI'), to_date('06/12/2007 19:45', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C','Durand','Paulette');
insert into LesReunions values (26,to_date('07/12/2007 10:00', 'DD/MM/YYYY HH24:MI'), to_date('07/12/2007 11:00', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (21,to_date('07/12/2007 11:45', 'DD/MM/YYYY HH24:MI'), to_date('08/12/2007 13:45', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C','Martin','Babette');
insert into LesReunions values (36,to_date('08/12/2007 14:00', 'DD/MM/YYYY HH24:MI'), to_date('08/12/2007 15:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction', 'Dupond','Gustave');
insert into LesReunions values (51,to_date('04/12/2007 08:00', 'DD/MM/YYYY HH24:MI'), to_date('04/12/2007 18:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (51,to_date('12/12/2007 09:00', 'DD/MM/YYYY HH24:MI'), to_date('12/12/2007 10:00', 'DD/MM/YYYY HH24:MI'), 'r�glage capteurs','Martin','Babette');
insert into LesReunions values (52,to_date('21/12/2007 10:30', 'DD/MM/YYYY HH24:MI'), to_date('21/12/2007 12:30', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (53,to_date('24/12/2007 12:45', 'DD/MM/YYYY HH24:MI'), to_date('24/12/2007 16:45', 'DD/MM/YYYY HH24:MI'), 'r�glage capteurs','Martin','Babette');
insert into LesReunions values (52,to_date('24/12/2007 17:00', 'DD/MM/YYYY HH24:MI'), to_date('24/12/2007 18:00', 'DD/MM/YYYY HH24:MI'), 'CE','Dupond','Gustave');
insert into LesReunions values (26,to_date('15/12/2007 18:30', 'DD/MM/YYYY HH24:MI'), to_date('15/12/2007 20:30', 'DD/MM/YYYY HH24:MI'), 'visiteurs B','Dupond','Arthur');
insert into LesReunions values (31,to_date('04/12/2007 14:45', 'DD/MM/YYYY HH24:MI'), to_date('04/12/2007 16:45', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction', 'Dupond','Gustave');
insert into LesReunions values (21,to_date('21/12/2007 12:45', 'DD/MM/YYYY HH24:MI'), to_date('21/12/2007 13:45', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C','Martin','Babette');
insert into LesReunions values (21,to_date('14/12/2007 17:00', 'DD/MM/YYYY HH24:MI'), to_date('14/12/2007 18:00', 'DD/MM/YYYY HH24:MI'), 'CE','Durand','Paulette');
insert into LesReunions values (26,to_date('16/12/2007 15:30', 'DD/MM/YYYY HH24:MI'), to_date('16/12/2007 20:30', 'DD/MM/YYYY HH24:MI'), 'r�glage capteurs','Martin','Babette');
insert into LesReunions values (31,to_date('03/02/2008 12:00', 'DD/MM/YYYY HH24:MI'), to_date('03/02/2008 19:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Martin','Babette');
insert into LesReunions values (21,to_date('04/02/2008 13:30', 'DD/MM/YYYY HH24:MI'), to_date('04/02/2008 16:30', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Dupond','Gustave');
insert into LesReunions values (21,to_date('05/02/2008 15:30', 'DD/MM/YYYY HH24:MI'), to_date('05/02/2008 16:30', 'DD/MM/YYYY HH24:MI'), 'r�glage capteurs','Dupond','Arthur');
insert into LesReunions values (36,to_date('06/02/2008 10:45', 'DD/MM/YYYY HH24:MI'), to_date('06/02/2008 16:45', 'DD/MM/YYYY HH24:MI'), 'CE','Martin','Babette');
insert into LesReunions values (53,to_date('06/02/2008 10:00', 'DD/MM/YYYY HH24:MI'), to_date('06/02/2008 18:00', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C', 'Dupond','Gustave');
insert into LesReunions values (52,to_date('06/02/2008 17:45', 'DD/MM/YYYY HH24:MI'), to_date('06/02/2008 19:45', 'DD/MM/YYYY HH24:MI'), 'visiteurs A','Durand','Paulette');
insert into LesReunions values (51,to_date('07/02/2008 10:00', 'DD/MM/YYYY HH24:MI'), to_date('07/02/2008 11:00', 'DD/MM/YYYY HH24:MI'), 'visiteurs A','Martin','Babette');
insert into LesReunions values (21,to_date('07/02/2008 11:45', 'DD/MM/YYYY HH24:MI'), to_date('07/02/2008 12:00', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Dupond','Gustave');
insert into LesReunions values (31,to_date('08/02/2008 14:00', 'DD/MM/YYYY HH24:MI'), to_date('08/02/2008 14:30', 'DD/MM/YYYY HH24:MI'), 'visiteurs B', 'Dupond','Gustave');
insert into LesReunions values (31,to_date('04/02/2008 08:00', 'DD/MM/YYYY HH24:MI'), to_date('04/02/2008 08:30', 'DD/MM/YYYY HH24:MI'), 'Visiteurs C','Martin','Babette');
insert into LesReunions values (51,to_date('12/02/2008 09:00', 'DD/MM/YYYY HH24:MI'), to_date('12/02/2008 18:30', 'DD/MM/YYYY HH24:MI'), 'Comit� de direction','Durand','Paulette');

/* GenererMesure (i, y) genere des valeurs aléatoires dans la relation
   lesMesures avec i comme intervalle maximal entre 2 observations
   le 1er janvier de l'annee y est la date de la 1ere observation
   sysdate est la derniere */
   
create or replace procedure GenererMesure (i integer, d varchar) is
		pid integer;
		eid integer;
		lum real;
		hum real;
		temp real;
		delai real ;		/* le delai depuis l'observation precedente */
		dateObser date ; 	/* la date de l'observation */
		debutObser date; 	/* la borne inferieure des observations */
		finObser date; 		/* la borne supérieures des observations */
		interval real;	/* une duree max de min qui separe 2 observations*/
		cursor pieces is select pid, eid from LesPieces where pid <> 53 and pid <> 12; /* pas de mesures dans les pieces 53 et	12 */
begin
		delete LesMesures_temp;
    debutObser := to_date (d, 'DD/MM/YYYY');
    finObser := sysdate;
    interval := i;
		hum := 0;
		temp := 0;
		lum := 0;
		for p in pieces loop
	    	dateObser := debutObser;
        while dateObser <= finObser loop
        	  select dbms_random.value(10, 30) into temp from dual;
	        	select dbms_random.value(0, 100) into hum from dual;
	        	select dbms_random.value(0, 50) into lum from dual;
            select dbms_random.value(0, interval) into delai from dual;
						dateObser := dateObser + delai/1440 ; /* 1 J = 1440 MIN */
						insert into LesMesures_temp values (
								p.pid,
								to_date (to_char (dateObser, 'DD/MM/YYYY HH24:MI'), 'DD/MM/YYYY HH24:MI'),
								hum, temp, lum
						);
	    	end loop;
		end loop;
exception
		when others
				then null;
end;
/
exec GenererMesure (20, '01/12/2007');

insert into LesMesures 
select pid, dateMes, avg(hum), avg(temp), avg(lum)
from lesMesures_temp
group by pid, dateMes;

/* les capteurs des pieces 41 et 42 en panne de 21/12/2007 à 2/2/2008 */
delete from lesmesures
where pid in (41,42)
			and dateMes between to_date ('21/12/2007', 'DD/MM/YYYY') and to_date ('02/02/2008', 'DD/MM/YYYY');

/* modification de lesReunions pour avoir des reunions sur plusieur jours */
update lesreunions
set fin = fin + 2
where pid = 21 and nom = 'Dupond';

update lesreunions
set fin = fin + 1
where pid = 31 and nom = 'Dupond';

grant select on lesMesures to public;
grant select on LesReunions to public;
grant select on LesPieces to public;
