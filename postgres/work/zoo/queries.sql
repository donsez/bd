--
-- Queries on the ZOO database
--

-- Connect to the database
\connect db_zoo

\d

-- Req 1
select noma from lesanimaux;

-- Req 2
select distinct fonction from lescages;

-- Req 3
select noma from lesanimaux where type='léopard';

-- Req 4
select distinct nomm from lesmaladies;

-- Req 5
select noma, nocage from lesanimaux where pays='Kenya' and anNais<1993 and sexe='mâle';

-- Req 6 concat ou ||
select concat(concat(nome, ' vit à '),adresse) as domicile from lesemployes;

-- Req 7
select noma,2022-anNais as age from lesanimaux;

-- Req 8 
select distinct nome 
from lesemployes natural join lesgardiens 
where adresse='Ushuaia';

-- Req 9
select distinct fonction, nome 
from lescages natural join lesgardiens natural join
lesemployes 
where adresse='Calvi';

-- Req 10
select noma, nome from lesanimaux natural join lesemployes
union
select noma, nome from lesanimaux natural  join lescages natural join lesresponsables;

-- Req 11 
select distinct nome from lesgardiens G where not exists 
(select nocage from lesanimaux C where
not exists 
(select * from lesgardiens G2  where G2.nocage = C.nocage and G2.nome = G.nome));  

-- Req 11 version 2
select distinct nome from lesgardiens group by nome 
having count(*) = (select count(distinct nocage) from lesanimaux);

-- Req 12 (Remark MINUS : MySQL et Oracle and EXCEPT : PostgreSQL)
(select noma, type from lesanimaux)
except
(select noma, type from lesanimaux natural join lesmaladies);

-- Req 13
select noma from lesanimaux natural join lesmaladies 
where pays='Kenya' and nomm ='grippe';

-- Req 14
select nocage from lescages
except 
select nocage from lesanimaux;

-- Req 15
select noma, nomm from lesanimaux natural join lesmaladies where sexe='mâle';

-- Req 16 
select distinct nocage, fonction from  lesanimaux natural join lescages 
group by nocage,fonction having count(*)>1;

-- Req 16 bis 
select distinct c.nocage, c.fonction from lesanimaux a1
join lesanimaux a2 on a1.noma <> a2.noma and a1.nocage = a2.nocage
join lescages c on a1.nocage = c.nocage;

-- Req 17
select nome from lesanimaux natural join lesgardiens where noma='Charly'
union
select nome from lesanimaux natural join lescages natural join lesresponsables where noma='Charly';

-- Req 18
select noma, pays from lesanimaux 
where anNais=(select min(anNais) from lesanimaux); 

-- Req 19
select noma, type, anNais 
from lesanimaux natural join lesmaladies group by noma,type, annais 
having count(*)=(select count(distinct nomm) from lesmaladies);

-- Req 20
select noma, type,pays from lesanimaux 
where noma<>'Charly' and 
nocage=(select nocage from lesanimaux where noma='Charly');

-- Req 21
select nome, adresse from lescages natural join lesgardiens natural join 
lesemployes natural join lesanimaux 
group by nome,adresse 
having count(distinct type) = (select count(distinct type) from lesanimaux); 

-- Cohérence

-- Req 1
select nome from lesgardiens
intersect
select nome from lesresponsables;

-- Req 2
(select nocage from lescages 
except
select nocage from lesanimaux)
intersect
select nocage from lesgardiens;

-- instruction préparée
PREPARE plusvieuxque (int) AS
    SELECT nomA, 2022-anNais AS age FROM LesAnimaux WHERE 2022-anNais >= $1;
EXECUTE plusvieuxque(20);
EXECUTE plusvieuxque(40);


-- desallocation d'une instruction préparée
DEALLOCATE PREPARE plusvieuxque;