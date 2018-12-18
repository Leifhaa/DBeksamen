create schema IF NOT EXISTS litenjobb; /* Opprett nytt schema */
USE litenjobb; /* Benytt nylig opprettet schema  */


/* NOTE: Rekkefølge! */
drop table if exists bud;
drop table if exists oppdrag;
drop table IF exists kommune;
drop table if exists fylke;
drop table if exists oppdragstype;
drop table if exists bruker;

create table Bruker(
	BrukerNr int auto_increment,
    Fornavn varchar(45),
    Etternavn varchar(65),
    Passord varchar(20),
    ePost varchar(254), /*Max email size */
    primary key(BrukerNr)
);

create table Oppdragstype(
	TypeNr int auto_increment,
    Beskrivelse varchar(300),
    primary key (TypeNr)
);

create table Fylke(
	FNr int auto_increment,
    Fnavn varchar(40),
    primary key (FNr)
);

create table Kommune(
	KNr int auto_increment,
    KNavn varchar(40),
    FNr int, /* OBS, ha like verdier for primær og fremmednøkkel*/
    primary key (KNr),
    foreign key (FNr) references Fylke(FNr)
);

create table Oppdrag(
    ONr int auto_increment,
    Adresse varchar(60),
    PoengTilOppdragsgiver  TINYINT, /*Kun opp til 10*/
    PoengTilBudGiver  TINYINT,
    MaksPris int,
    TypeNr int,
    KNr int,
    BrukerNr int,
    primary key (ONr),
    foreign key (TypeNr) references OppdragsType(TypeNr),
    foreign key (KNr) references Kommune(KNr),
    foreign key (BrukerNr) references Bruker(BrukerNr)
);

create table Bud (
	BudNr int auto_increment,
    BudPris int,
    Akseptert boolean, /*Boolsk verdi, nyttig for lav-nivå språk */
    ONr int,
    BrukerNr int,
    primary key(BudNr),
    foreign key(ONr) references Oppdrag(ONr),
    foreign key(BrukerNr) references Bruker(BrukerNr)
);
    
    
    
    
Insert into /* Hvorfor skriver jeg på flere linjer? */
	bruker (Fornavn, Etternavn, Passord, Epost) /* Vi bruker auto increment, husk */
Values
	('Per','Andreassen','PassordStyrke','Adreassen1@hotmai.com'),
    ('Per','Sivertsen','HemmeligHoldt','Sivert1@hotmai.com'),
    ('Randi','Andreassen','IngeSinge','Kjent1@gmail.com'),
    ('Tore','Stilberg','Hammer99','HamKam@hotmai.com');
    
    
    
Insert into
	Fylke (FNavn)
Values
	('Oppland'),
    ('Hedmark'),
    ('Buskerud');
    
    
Insert into
	Kommune (KNavn,FNr)
Values
	('Lunner',1),
    ('Gran',1),
    ('Jevnaker',1),
    ('Trysil',2),
    ('Tynset',2),
    ('Hemsedal',3),
    ('Gol',3);
	
Insert into 
	OppdragsType (Beskrivelse)
Values
	('Klippe fotballbane'),
    ('Beise hus'),
    ('Lufte hunder');
    
Insert into 
	Oppdrag (Adresse,PoengTilOppdragsGiver,PoengTilBudgiver,MaksPris,TypeNr,KNr,BrukerNr)
Values
	('Skogsveien 3',5,6,6000,1,2,1),
    ('Furugata 109',9,9,12000,2,1,3),
    ('Skigutua 1',9,9,1000,3,3,2);
    
    
Insert into
	Bud (BudPris,Akseptert,ONr,BrukerNr)
Values
	(5000,FALSE,1,4),
    (5500,TRUE,1,3),
    (1200,TRUE,3,1);
    
select * from bud
    

    

    

    
    
    