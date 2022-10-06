-- Explain
explain select * from LesPreferences;
explain select * from LesPreferences where nomA = 'Adrian';

select * from LesPreferences join LesPlats using (nomP);
select * from LesPreferences natural join LesPlats;
select nomA, typeP from LesPreferences join LesPlats using (nomP);
select * from LesPreferences full outer join LesPlats using (nomP);

explain select * from LesPreferences join LesPlats using (nomP);
explain select * from LesPreferences natural join LesPlats;
explain select nomA, typeP from LesPreferences join LesPlats using (nomP);
explain select * from LesPreferences full outer join LesPlats using (nomP);
