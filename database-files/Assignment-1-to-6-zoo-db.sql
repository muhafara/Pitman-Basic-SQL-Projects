create database db_zoo;

use db_zoo;


create table tb1_animalia(
	animalia_id int primary key not null identity (1,1),
	animalia_type varchar (30) not null
);

insert into tb1_animalia
		(animalia_type)
		values
		('vartebrate'),
		('invertebrate')
;

select * from tb1_animalia;

create table tb1_class(
	class_id int primary key not null identity (100,1),
	class_type varchar (50) not null
);

insert into tb1_class
		(class_type)
		values
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
;

select * from tb1_class;

create table tb1_persons (
	person_id int primary key not null identity (1,1),
	person_fname varchar (50) not null,
	person_lname varchar (50) not null,
	person_contact varchar (50) not null
);

create table tb1_order(
	order_idd int primary key not null identity (1,1),
	order_type varchar (50) not null
);

create table tb1_care(
	care_id varchar (50) primary key not null,
	care_type varchar (50) not null,
	care_specialist int not null
);

create table tb1_nutrition(
	nutrition_id int primary key not null identity (2200,1),
	nutrition_type varchar (50) not null,
	nutrition_cost money not null
);

create table tb1_habitat(
	habitat_id int primary key not null identity (5000,1),
	habitat_type varchar (50) not null,
	habitat_cost money not null
);

create table tbl_specialist(
	specialist_id int primary key not null identity (1,1),
	specialist_fname varchar (50) not null,
	specialist_lname varchar (50) not null,
	speciaist_contact varchar (50) not null
);

insert into tb1_order (order_type)
		values 
		('carnivore'),
		('herbivore'),
		('omnivore')
;

select * from tb1_order;

insert into tb1_care 
		(care_id, care_type, care_specialist)
		values
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins',1),
		('care_3', 'human contact_pet subject',2),
		('care_4', 'clean up animal waste',1),
		('care_5', 'move subject to exercise pen',3),
		('care_6', 'drain and refill aquariam',1),
		('care_7', 'extensive dental work',3)
;

select * from tb1_care;


insert into tb1_nutrition
		(nutrition_type, nutrition_cost)
		values
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice',80),
		('warm bottle of milk',600),
		('syringe fed broth', 600),
		('lard and seed mix',300),
		('aphids' , 150),
		('vitamins and marrow', 3500)
;

select * from tb1_nutrition;

insert into tb1_habitat
	(habitat_type, habitat_cost)
	values
	('tundra',4000 ),
	('grassy knoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquariam with snowy facade', 50000 ),
	('short grass, shade and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches',150000),
	('clif with shaded cave',15000)
;

insert into tbl_specialist
		(specialist_fname, specialist_lname, speciaist_contact)
		values
		('margaret','nguyen','543-987-987'),
		('mary','fischer','765-987-654'),
		('arnold','holden','987-543-987'),
		('kem','byesan','987-234-987'),
		('delmonte','fyedo','987-765-987')
;

select * from tbl_specialist;

create table tb1_species(
		species_id int primary key not null identity (1,1),
		species_name varchar (50) not null,
		species_animalia int not null constraint fk_animalia_id foreign key references tb1_animalia (animalia_id) on update cascade on delete cascade,
		species_class int not null constraint fk_class_id foreign key references tb1_class (class_id) on update cascade on delete cascade,
		species_order int not null constraint fk_order_id foreign key references tb1_order (order_idd) on update cascade on delete cascade,
		species_habitat int not null constraint fk_habitat_id foreign key references tb1_habitat (habitat_id) on update cascade on delete cascade,
		species_nutration int not null constraint fk_nutration_id foreign key references tb1_nutrition(nutrition_id) on update cascade on delete cascade,
		species_care varchar (50) not null constraint fk_care_id foreign key references tb1_care(care_id) on update cascade on delete cascade,
		care_provider int not null constraint fk_specialist_id foreign key references tbl_specialist (specialist_id) on update cascade on delete cascade
);

insert into tb1_species
		(species_name, species_animalia, species_class, species_order,species_habitat, species_nutration, species_care, care_provider)
		values
		('brown bear', 1,  102, 3,  5007, 2200, 'care_1', 1),
		('jaguar',     1,  102, 1,  5007, 2200, 'care_4', 2),
		('penguin',    1,  100, 1,  5003, 2200, 'care_6', 3),
		('ghost bat',  1,  102, 1 , 5007, 2204, 'care_2', 4),
		('chicken',    1,  102, 3,  5001, 2205, 'care_0', 5),
		('panda',      1,  102, 3,  5006, 2202, 'care_4', 4),
		('bobcat',     1,  102, 1,  5001, 2204, 'care_5', 1),
		('grey wolf',  1,  102 ,1 , 5000, 2201, 'care_4', 1)
;



select * from tb1_species;

select * from tb1_species where species_name = 'brown bear';

select 
a1.species_name, a2.animalia_type,
a3.class_type, a4.order_type, a5.habitat_type,
a6.nutrition_type, a7.care_type
from tb1_species a1
inner join tb1_animalia a2 on a2.animalia_id = a1.species_animalia
inner join tb1_class a3 on a3.class_id = a1.species_class
inner join tb1_order a4 on a4.order_idd = a1.species_order
inner join tb1_habitat a5 on a5.habitat_id = a1.species_habitat
inner join tb1_nutrition a6 on a6.nutrition_id = a1.species_nutration
inner join tb1_care a7 on a7.care_id = a1.species_care
where species_name = 'brown bear'
;

select 
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	from tb1_species a1
	inner join tb1_habitat a2 on a2.habitat_id = a1.species_habitat
	inner join tb1_nutrition a3 on a3.nutrition_id =a1.species_nutration
	where species_name = 'ghost bat'


/*Assignment nummber 1*/
select * from tb1_habitat;
/*********END******************/

/*Assignmenet number 2*/
select * from tb1_species;

select * from tb1_species
			where
species_order = 3;
/*********END******************/

/*Assignmenet number 3*/
select * from tb1_nutrition;

select * from tb1_nutrition
			where
nutrition_cost <= 600;
/*********END******************/

/*Assignmenet number 4*/
select * from tb1_species;

select species_name from tb1_species where species_nutration between 2202 and 2206;

/*********END******************/

/*Assignmenet number 5*/
SELECT species_name AS name
FROM tb1_species;

select species_name from tb1_species
order by species_name;

select 
SpeciesName.species_name, NutritionType.nutrition_type
from tb1_species SpeciesName
inner join tb1_nutrition NutritionType on NutritionType.nutrition_id = SpeciesName.species_nutration
order by SpeciesName.species_name;
/*********END******************/

/*Assignmenet number 6*/
select * from tbl_specialist;
/*
Hi instructor,
Just to let you know that i was having difficulty on assignment 6 because I was unable to use joints on table tb1_species as there was no refrence tp the specialist table.
I solvedd this assignment I added one one column in tb1_species as care_provider as a foreign key from specialist table.
so that how i use inner join to retrive people who provided care for the penguin.
i hope this solution works.
cheers!
*/
SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.speciaist_contact
FROM tbl_specialist
INNER JOIN tb1_species ON tb1_species.care_provider=tbl_specialist.specialist_id
where species_name='penguin';
/*********END******************/