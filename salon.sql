/*

c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\frizerski.sql"

*/

drop database if exists frizerski;
create database frizerski default character set utf8;
use frizerski;

create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null check(len(ime)>2),
prezime varchar(50) not null check(len(prezime)>2),
oib char(11)
);

create table korisnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null check(len(ime)>2),
prezime varchar(50) not null check(len(prezime)>2)
);

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar(50) not null check(len(ime)>2),
cijena decimal(18,2)
);

create table racun(
sifra int not null primary key auto_increment,
datum datetime default now(),
djelatnik int,
korisnik int,
usluga int
);

alter table racun add foreign key (korisnik) references korisnik(sifra);
alter table racun add foreign key (djelatnik) references djelatnik(sifra);
alter table racun add foreign key (usluga) references usluga(sifra);


insert into djelatnik 
(ime,prezime,oib) values 
# 1
('Marko','Marulić',12345333301),
# 2
('Tomislav','Glavašić',123456789101),
# 3
('Mario','Radman',45673215678)
;

insert into korisnik 
(ime,prezime) values 
# 1
('Marko','pavlovic'),
# 2
('Tvrtko','Barun'),
# 3
('Sebastijan','Šujević')
;

insert into usluga
(naziv,cijena) values 
('musko sisanje',30.00),
('žensko sisanje',50.00),
('pramenovi',110.00),
('brijanje',45.00)
;

insert into racun
(djelatnik,korisnik,usluga) values
(1,2,3);




