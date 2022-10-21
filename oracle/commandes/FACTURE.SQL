-- Simple base de données commerciale (pour ORACLE Sqlplus)
-- Auteur: Didier Donsez



-- Peuplage de la table FACTURE

insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10000,100,to_date('01/01/1998','MM/DD/YYYY'),10.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10001,100,to_date('10/01/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10002,102,to_date('15/01/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10003,103,to_date('12/02/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10004,103,to_date('12/02/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10005,104,to_date('20/02/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10006,105,to_date('21/02/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10007,105,to_date('25/02/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10008,106,to_date('01/03/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10009,106,to_date('02/03/1998','MM/DD/YYYY'),0.00);
insert into FACTURE(NoFact,NoClient,DateFact,Reduction) VALUES(10010,103,to_date('05/03/1998','MM/DD/YYYY'),15.00);
