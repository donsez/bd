--
-- Queries on the ZOO PostgreSQL database
-- (c) Stéphane Desvismes, Didier Donsez, Université Grenoble Alpes
--

-- REMARK: Execute populate.sql before querying the database

-- Connect to the database
\connect db_zoo

\d

-- Req 1
select noma
from LesAnimaux;

-- Req 2
select distinct fonction
from LesCages;

-- Req 3
select noma
from LesAnimaux
where type='léopard';

-- Req 4
select distinct nomm
from LesMaladies;

-- Req 5
select noma, nocage
from LesAnimaux
where pays='Kenya' and anNais<1993 and sexe='mâle';

-- Req 6 concat ou ||
select concat(concat(nome, ' vit à '),adresse) as domicile
from LesEmployes;

-- Req 7
select noma,2022-anNais as age
from LesAnimaux;

-- Req 8 
select distinct nome 
from LesEmployes natural join LesGardiens 
where adresse='Ushuaia';

-- Req 9
select distinct fonction, nome 
from LesCages natural join LesGardiens natural join LesEmployes 
where adresse='Calvi';

-- Req 10
select noma, nome from LesAnimaux natural join LesEmployes
union
select noma, nome from LesAnimaux natural  join LesCages natural join LesResponsables;

-- Req 11 
select distinct nome
from LesGardiens G
where not exists 
    (select nocage from LesAnimaux C where
    not exists 
    (select * from LesGardiens G2  where G2.nocage = C.nocage and G2.nome = G.nome));  

-- Req 11 version 2
select distinct nome
from LesGardiens
group by nome 
having count(*) = (select count(distinct nocage) from LesAnimaux);

-- Req 12 (Remark MINUS : MySQL et Oracle and EXCEPT : PostgreSQL)
(select noma, type from LesAnimaux)
except
(select noma, type from LesAnimaux natural join LesMaladies);

-- Req 13
select noma
from LesAnimaux natural join LesMaladies 
where pays='Kenya' and nomm ='grippe';

-- Req 14
select nocage from LesCages
except 
select nocage from LesAnimaux;

-- Req 15
select noma, nomm
from LesAnimaux natural join LesMaladies
where sexe='mâle';

-- Req 16 
select distinct nocage, fonction
from  LesAnimaux natural join LesCages 
group by nocage,fonction having count(*)>1;

-- Req 16 bis 
select distinct c.nocage, c.fonction
from LesAnimaux a1
join LesAnimaux a2 on a1.noma <> a2.noma and a1.nocage = a2.nocage
join LesCages c on a1.nocage = c.nocage;

-- Req 17 : Les noms des responsables et les noms des gardiens de Charly
select nome from LesAnimaux natural join LesGardiens where noma='Charly'
union
select nome from LesAnimaux natural join LesCages natural join LesResponsables where noma='Charly';

-- Req 18 : Le nom et le pays d’origine de l’animal doyen du zoo (il peut y en avoir plusieurs)
select noma, pays
from LesAnimaux 
where anNais=(select max(anNais) from LesAnimaux); 

-- Req 19 : Le nom, le type et l’ann ́ee de naissance des animaux qui ont contract ́e toutes les maladies (connues) du zoo.
select noma, type, anNais 
from LesAnimaux natural join LesMaladies group by noma,type, annais 
having count(*)=(select count(distinct nomm) from LesMaladies);

-- Req 20 : Le nom, le type et le pays d’origine des animaux qui partagent la cage de Charly.
select noma, type, pays
from LesAnimaux 
where noma<>'Charly' and nocage=(select nocage from LesAnimaux where noma='Charly');

-- Req 21
select nome, adresse
from LesCages natural join LesGardiens natural join  LesEmployes natural join LesAnimaux 
group by nome,adresse 
having count(distinct type) = (select count(distinct type) from LesAnimaux); 

-- Cohérence

-- Req 1
select nome from LesGardiens
intersect
select nome from LesResponsables;

-- Req 2
(select nocage from LesCages 
except
select nocage from LesAnimaux)
intersect
select nocage from LesGardiens;

-- instruction préparée
PREPARE plusvieuxque (int) AS
    SELECT nomA, 2022-anNais AS age FROM LesAnimaux WHERE 2022-anNais >= $1;
EXECUTE plusvieuxque(20);
EXECUTE plusvieuxque(40);


-- desallocation d'une instruction préparée
DEALLOCATE PREPARE plusvieuxque;