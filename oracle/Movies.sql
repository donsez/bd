drop table Opinions;
drop table IsOn;
drop table Frequents;
drop table Movies;
drop table Cinemas;
drop table Spectators;

CREATE TABLE Movies (
  title varchar(100) primary key, 
  releaseYear int
);
CREATE TABLE Cinemas (
  name varchar(100) primary key, 
  city varchar(100)
);
CREATE TABLE Spectators (
  name varchar(100) primary key, 
  birthYear int, 
  city varchar(100)
);
CREATE TABLE IsOn (
  movie varchar(100), 
  cinema varchar(100),
  CONSTRAINT pk_io primary key (movie, cinema), 
  CONSTRAINT fk_io_movie foreign key (movie) references Movies(title), 
  CONSTRAINT fk_io_cinema foreign key (cinema) references Cinemas(name)
);
CREATE TABLE Opinions (
  spectator varchar(100),
  movie varchar(100), 
  stars int not null,
  CONSTRAINT pk_op_stars primary key (spectator, movie), 
  CONSTRAINT fk_op_spectator foreign key (spectator) references Spectators(name), 
  CONSTRAINT fk_op_movie foreign key (movie) references Movies(title), 
  CONSTRAINT Stars_Ck CHECK (stars BETWEEN 0 AND 5)
);
CREATE TABLE Frequents (
  spectator varchar(100), 
  cinema varchar(100), 
  CONSTRAINT pk_fr primary key (spectator, cinema), 
  CONSTRAINT fk_fr_spectator foreign key (spectator) references Spectators(name), 
  CONSTRAINT fk_fr_cinema foreign key (cinema) references Cinemas(name)
);

insert into Movies values ('Guardians of the Galaxy', 2014);
insert into Movies values ('The Inbetweeners 2',2014);
insert into Movies values ('The Hundred Foot Jurney',2014);
insert into Movies values ('Lucy',2014);
insert into Movies values ('If I Stay',2014);
insert into Movies values ('The Green Hornet',2011);
insert into Movies values ('The Company Man',2011);
insert into Movies values ('Every Day',2011);
insert into Movies values ('Last Lions',2011);
insert into Movies values ('Pretty Woman',1990);
insert into Movies values ('Eduard Scissorshands',1990);
insert into Movies values ('Hamlet',1990);
insert into Movies values ('Australia',2008);
insert into Movies values ('Crocks in Clover',1963);
insert into Movies values ('America, America',1963);
insert into Movies values ('A Child is Waiting',1963);
insert into Movies values ('I, Robot', 2004);


insert into Cinemas values ('Hoyts CBD','Sydney');
insert into Cinemas values ('Hoyts','Brisbane');
insert into Cinemas values ('Event Cinema Myer','Brisbane');
insert into Cinemas values ('Event Cinema','Cairns');
insert into Cinemas values ('Birch Carroll and Coyles','Brisbane');
insert into Cinemas values ('Event Cinema Red Center','Alice Spring');


insert into Spectators values ('Marie', 1970, 'Sydney');
insert into Spectators values ('Adrian', 1950, 'Cairns');
insert into Spectators values ('Phil', 1960, 'Sydney');
insert into Spectators values ('Jackie', 1965, 'Sydney');
insert into Spectators values ('Tom', 1986, 'Brisbane');
insert into Spectators values ('Lauranne', 1986, 'Amsterdam');
insert into Spectators values ('Alizee', 1988, 'Alice Sring');


insert into Opinions values ('Marie', 'The Inbetweeners 2', 0);
insert into Opinions values ('Adrian', 'The Inbetweeners 2', 0);
insert into Opinions values ('Phil', 'The Inbetweeners 2', 2);
insert into Opinions values ('Jackie', 'The Inbetweeners 2', 2);
insert into Opinions values ('Tom', 'The Inbetweeners 2', 5);
insert into Opinions values ('Alizee', 'The Inbetweeners 2', 4);
insert into Opinions values ('Lauranne', 'The Inbetweeners 2', 0);
insert into Opinions values ('Marie', 'Pretty Woman', 5);
insert into Opinions values ('Adrian', 'Pretty Woman', 4);
insert into Opinions values ('Phil', 'Pretty Woman', 4);
insert into Opinions values ('Tom', 'Pretty Woman', 5);
insert into Opinions values ('Jackie', 'Pretty Woman', 3);
insert into Opinions values ('Alizee', 'Pretty Woman', 4);
insert into Opinions values ('Alizee', 'Eduard Scissorshands', 4);
insert into Opinions values ('Adrian', 'Eduard Scissorshands', 4);
insert into Opinions values ('Marie', 'Eduard Scissorshands', 3);
insert into Opinions values ('Lauranne', 'Eduard Scissorshands', 5);
insert into Opinions values ('Marie', 'Lucy', 3);
insert into Opinions values ('Adrian', 'Lucy', 4);
insert into Opinions values ('Jackie', 'Lucy', 2);
insert into Opinions values ('Tom', 'Lucy', 1);
insert into Opinions values ('Phil', 'Lucy', 5);
insert into Opinions values ('Lauranne', 'Lucy', 5);
insert into Opinions values ('Alizee', 'Lucy', 5);
insert into Opinions values ('Marie', 'I, Robot', 5);
insert into Opinions values ('Adrian', 'I, Robot', 5);
insert into Opinions values ('Marie', 'Crocks in Clover', 5);
insert into Opinions values ('Tom', 'Crocks in Clover', 5);
insert into Opinions values ('Alizee', 'Crocks in Clover', 5);
insert into Opinions values ('Lauranne', 'Crocks in Clover', 5);
insert into Opinions values ('Marie', 'Australia', 0);
insert into Opinions values ('Adrian', 'Australia', 5);

insert into IsOn values ('Guardians of the Galaxy', 'Hoyts CBD');
insert into IsOn values ('Guardians of the Galaxy', 'Hoyts');
insert into IsOn values ('Guardians of the Galaxy', 'Event Cinema Myer');
insert into IsOn values ('Guardians of the Galaxy', 'Event Cinema');
insert into IsOn values ('Guardians of the Galaxy', 'Birch Carroll and Coyles');
insert into IsOn values ('Crocks in Clover', 'Hoyts CBD');
insert into IsOn values ('Crocks in Clover', 'Hoyts');
insert into IsOn values ('Crocks in Clover', 'Event Cinema Myer');
insert into IsOn values ('Crocks in Clover', 'Event Cinema');
insert into IsOn values ('The Company Man', 'Birch Carroll and Coyles');
insert into IsOn values ('The Company Man', 'Hoyts CBD');
insert into IsOn values ('The Company Man', 'Hoyts');
insert into IsOn values ('America, America', 'Event Cinema Myer');
insert into IsOn values ('America, America', 'Event Cinema');
insert into IsOn values ('America, America', 'Birch Carroll and Coyles');
insert into IsOn values ('Australia', 'Event Cinema Myer');
insert into IsOn values ('Australia', 'Event Cinema');
insert into IsOn values ('Australia', 'Birch Carroll and Coyles');
insert into IsOn values ('Pretty Woman', 'Birch Carroll and Coyles');
insert into IsOn values ('Pretty Woman', 'Event Cinema Myer');
insert into IsOn values ('Pretty Woman', 'Event Cinema');

insert into Frequents values ('Alizee', 'Event Cinema');
insert into Frequents values ('Phil', 'Event Cinema');
insert into Frequents values ('Jackie', 'Event Cinema');
insert into Frequents values ('Phil', 'Hoyts CBD');
insert into Frequents values ('Marie', 'Hoyts CBD');
insert into Frequents values ('Adrian', 'Hoyts CBD');
insert into Frequents values ('Jackie', 'Hoyts CBD');
insert into Frequents values ('Tom', 'Hoyts');
insert into Frequents values ('Marie', 'Hoyts');
insert into Frequents values ('Adrian', 'Hoyts');
insert into Frequents values ('Tom', 'Birch Carroll and Coyles');

grant select on Opinions to public;
grant select on IsOn to public;
grant select on Frequents to public;
grant select on Movies to public;
grant select on Cinemas to public;
grant select on Spectators to public;

commit;
