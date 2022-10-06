-- Explain
explain select * from LesPreferences;
explain select * from LesPreferences where nomA = 'Adrian';

select * from LesPreferences join LesPlats using (nomP);
select * from LesPreferences natural join LesPlats;
select nomA, typeP from LesPreferences join LesPlats using (nomP);
select * from LesPreferences full outer join LesPlats using (nomP);
select count(*) from LesPreferences full outer join LesPlats using (nomP);
select nomA, count(*) from LesPreferences full outer join LesPlats using (nomP) group by nomA;

explain select * from LesPreferences join LesPlats using (nomP);
explain select * from LesPreferences natural join LesPlats;
explain select nomA, typeP from LesPreferences join LesPlats using (nomP);
explain select * from LesPreferences full outer join LesPlats using (nomP);
explain select count(*) from LesPreferences full outer join LesPlats using (nomP);
explain select nomA, count(*) from LesPreferences full outer join LesPlats using (nomP) group by nomA;

explain analyze select * from LesPreferences natural join LesPlats;
explain verbose select * from LesPreferences natural join LesPlats;

explain (costs true) select * from LesPreferences natural join LesPlats;
explain (costs false) select * from LesPreferences natural join LesPlats;

-- Plus ? Voir https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-explain/ 
