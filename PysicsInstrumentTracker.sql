drop table if exists engineer cascade;
drop table if exists sector_has_locator cascade;
drop table if exists locator cascade;
drop table if exists sector cascade;
drop table if exists technicalSystem cascade;
drop table if exists logBookEntry cascade;
drop table if exists componentType cascade;
drop table if exists element cascade;
drop table if exists entryElement cascade;



create table engineer
(
engineer_id serial primary key,
engineer_fName varchar(45) not null,
engineer_lName varchar(45) not null,
engineer_mInitial varchar(1)

);

create table logBookEntry
(
logBookEntry_id serial primary key,
logBookEntry_activityDescription text not null,
logBookEntry_date timestamp not null,
engineer_id int,
constraint logBookEntry_engineer_id_fk
foreign key (engineer_id) references engineer
);

create table technicalSystem
(
technicalSystem_id char(1) constraint technicalSystem_id_pk primary key,
technicalSystem_description text not null
);

create table componentType
(

componentType_id char(2),
componentType_description text not null,
componentType_technicalSystem_id char(1),
constraint componentType_technicalSystem_id_fk
foreign key (componentType_technicalSystem_id) references technicalSystem,
constraint componentType_pk primary key (componentType_technicalSystem_id,componentType_id)
);

create table sector
(
sector_id char(2) constraint sector_id_pk primary key,
sector_description text not null
);

create table locator
(
locator_id char(2) constraint locator_id_pk primary key,
sector_id char(2),
constraint sector_id_fk
foreign key (sector_id) references sector
);


create table sector_has_locator
(
sector_id char(2),
locator_id char(2),
constraint sector_id_fk
foreign key (sector_id) references sector,
constraint locator_id_fk
foreign key (locator_id) references locator,
constraint sector_has_locator_pk primary key(sector_id, locator_id)
)
;
create table element
(
element_note text,
componentType_technicalSystem_id char(1),
componentType_id char(2),
sector_has_locator_sector_sector_id char(2),
sector_has_locator_locator_locator_id char(2),
element_elementnumber varchar(2) default '', 

constraint sector_has_locator_sector_locator_fk
foreign key (sector_has_locator_sector_sector_id, sector_has_locator_locator_locator_id) references sector_has_locator,
constraint componentType_id_fk
foreign key (componentType_technicalSystem_id, componentType_id) references componentType,
constraint element_pk primary key (componentType_technicalSystem_id, componentType_id, sector_has_locator_sector_sector_id, sector_has_locator_locator_locator_id, element_elementnumber)
);


create table entryelement
(
logBookEntry_id int,
logBookEntry_engineer_engineer_id int,
element_componentType_technicalSystem_technicalSystem_id char(1),
element_componentType_componentType_id char(2),
element_sector_has_locator_sector_sector_id char(2),
element_sector_has_locator_locator_locator_id char(2),
element_elementnumber varchar(2),
entryElement_id serial primary key,
constraint logBookEntry_id_fk
foreign key(logBookEntry_id) references logBookEntry,
constraint logBookEntry_engineer_engineer_id_fk
foreign key (logBookEntry_engineer_engineer_id) references logBookEntry,
constraint element_primary_fk
foreign key (element_componentType_technicalSystem_technicalSystem_id, element_componentType_componentType_id, element_sector_has_locator_sector_sector_id, element_sector_has_locator_locator_locator_id, element_elementnumber) references element
)
;



/* *** S Codes *** */
insert into technicalSystem values
(
'I', 'Instrumentation'
)
;

insert into technicalSystem values
(
'C', 'Cyrogenics'
)
;

insert into technicalSystem values
(
'M', 'Magnets'
)
;
/* S code end */

/* *** V Codes *** */

insert into componentType values
(
'BC', 'Beam Current Monitor','I'
)
;

insert into componentType values
(
'CA', 'Cyromodule','C'
)
;

insert into componentType values
(
'HR', 'Heater Control','C'
)
;

insert into componentType values
(
'DA', 'Beam Dump, Retractable','I'
)
;

insert into componentType values
(
'TV', 'Beam Viewer','I'
)
;

insert into componentType values
(
'AA', 'Dipole Magnent','M'
)
;

insert into componentType values
(
'QA', 'Quadruple Magnet','M'
)
;
/* V code end */


/* *** XX codes *** */
insert into sector values
(
'1H', 'Hall A'
)
;
insert into sector values
(
'2H', 'Hall B'
)
;

insert into sector values
(
'3H', 'Hall C'
)
;
insert into sector values
(
'1I', 'Injector'
)
;
insert into sector values
(
'1A', 'First Arc'
)
;
insert into sector values
(
'2A', 'Second Arc'
)
;
insert into sector values
(
'3A', 'Third Arc'
)
;
insert into sector values
(
'4A', 'Fourth Arc'
)
;
insert into sector values
(
'5A', 'Fifth Arc'
)
;
insert into sector values
(
'1L', 'North Linac'
)
;
insert into sector values
(
'2L', 'South Linac'
)
;
/* X code end */

/* *** Y-codes start *** */
insert into locator values
(
'01'
);
insert into locator values
(
'02'
);
insert into locator values
(
'03'
);
insert into locator values
(
'04'
);
insert into locator values
(
'05'
);
insert into locator values
(
'06'
);
insert into locator values
(
'07'
);
insert into locator values
(
'08'
);

/* Y code ends */

/* Associative entity for sector and locator */

insert into sector_has_locator values
(
'1H', '04'
);
insert into sector_has_locator values
(
'1H', '01'
);
insert into sector_has_locator values
(
'2H', '01'
);
insert into sector_has_locator values
(
'2H', '04'
);
insert into sector_has_locator values
(
'3H', '01'
);
insert into sector_has_locator values
(
'3H', '04'
);
insert into sector_has_locator values
(
'3H', '02'
);
insert into sector_has_locator values
(
'1I', '01'
);
insert into sector_has_locator values
(
'1A', '01'
);
insert into sector_has_locator values
(
'2A', '01'
);
insert into sector_has_locator values
(
'3A', '01'
);
insert into sector_has_locator values
(
'4A', '01'
);
insert into sector_has_locator values
(
'5A', '01'
);
insert into sector_has_locator values
(
'1L', '01'
);
insert into sector_has_locator values
(
'1L', '02'
);
insert into sector_has_locator values
(
'1L', '03'
);
insert into sector_has_locator values
(
'1L', '04'
);
insert into sector_has_locator values
(
'1L', '05'
);
insert into sector_has_locator values
(
'1L', '06'
);
insert into sector_has_locator values
(
'1L', '07'
);
insert into sector_has_locator values
(
'1L', '08'
);
insert into sector_has_locator values
(
'2L', '01'
);
insert into sector_has_locator values
(
'2L', '02'
);
insert into sector_has_locator values
(
'2L', '03'
);
insert into sector_has_locator values
(
'2L', '04'
);
insert into sector_has_locator values
(
'2L', '05'
);
insert into sector_has_locator values
(
'2L', '06'
);
insert into sector_has_locator values
(
'2L', '07'
);
insert into sector_has_locator values
(
'2L', '08'
);

--end of sector has locator values

select * from sector_has_locator;
select * from element;

--insert element data
insert into element("element_note","componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'YAG Viewer','I', 'TV', '1I', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '1H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '2H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '3H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '1L', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '1L', '02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '1L', '03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '2L', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '2L', '02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'TV', '2L', '03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '1H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '2H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '3H', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'BC', '2L', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'BC', '2L', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '1A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '2A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '3A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '4A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'I', 'DA', '5A', '01'
);
insert into element("element_note","componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'Half Module','C', 'CA', '1L', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '05'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '06'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '07'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '1L', '08'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '04'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '05'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '06'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '07'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'CA', '2L', '08'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'HR', '1H', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'HR', '2H', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'HR', '3H', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'C', 'HR', '3H', '02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'M', 'AA', '1A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'M', 'AA', '2A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'M', 'AA', '3A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'M', 'AA', '4A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id")  values
(
 'M', 'AA', '5A', '01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '01','01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '01','02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '01','03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '03','01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '03','02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '03','03'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '02','01'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '02','02'
);
insert into element("componenttype_technicalsystem_id","componenttype_id","sector_has_locator_sector_sector_id", "sector_has_locator_locator_locator_id", "element_elementnumber")  values
(
 'M', 'QA', '1L', '02','03'
);
--END OF ELEMENT INSERT

--Misc Selects
select * from technicalSystem;
select * from componentType;
select * from sector;
select * from element;
select* from logBookEntry;
select * from engineer;
--end of Misc Selects

drop view if exists elementName;
create view elementName as select element.componentType_technicalSystem_id || element.componentType_id || element.sector_has_locator_sector_sector_id|| element.sector_has_locator_locator_locator_id || element.element_elementnumber as "Element Name" from element;
select * from elementName;

insert into engineer("engineer_fname", "engineer_lname") values 
(
'Dylan', 'Sheffer'
);

insert into logBookEntry("logbookentry_activitydescription", "logbookentry_date", "engineer_id")values
(
'Routine maintenance', '2012-03-01', 01
);
insert into entryElement values
(
01, 01, 'M', 'QA', '1L', '01', '01'
)
;
insert into entryElement values
(
01, 01, 'M', 'QA', '1L', '01', '02'
)
;

select* from entryElement;
