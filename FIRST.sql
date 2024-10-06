/*it is not case sensitive
but we have to be cateful for table name and values*/
create database country;
use country;
create table country.states( state_id varchar(2), state_name varchar(50), region_id decimal(10,0));
/*varchar-vraiable length between 0 to 65535
char-fixed length between 0 to 255
binary- 0 or 1 (1 by defaukt)
varbinary(size)- =to varchar but stores binary strings. 
size parameter specifies the maximum column length in bytes
decimal(size,d) int dec(size,d)*/
select * from states;
insert into states(state_id,state_name,region_id)values
('A1','DELHI',1100),
('A2','MUMBAI',1200),
('A3','UTTRAKHAND',1300);
select * from states where region_id=1300 and state_id='A3';
alter table states add primary key(region_id);
select * from country.jobs;
select * from country.jobs order by job_title asc;
select * from country.jobs order by job_id desc;


