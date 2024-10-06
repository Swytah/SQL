create database school;
use school;
create table if not exists school.co(id varchar(4) not null unique, c_name varchar(20), primary key(id));
insert into co(id,c_name) values
('c1','maths'),
('c2','physics');
create table if not existS school.sd(id int unique, s_name varchar(20) not null, age int, c_id varchar(4), primary key(id),foreign key(c_id) references co(id));
insert into sd(id,s_name,age,c_id)values
(1,'Alice',20,'c1'),
(2,'Bob',22,'c2'),
(3,'Alice',20,'c1');
select * from sd;
select * from co;
select s_name, s.id, c_name from sd s, co c where s.c_id=c.id;
insert into sd values(4,'Arya',20,null);
insert into sd values(5,'Ailya',21,'c2');
insert into sd values(6,'Aman',23,'c1');
insert into sd values(7,'Akash',29,'c2');
insert into sd values(8,'Aradhya',20,null);
insert into sd values(9,'Abhishek',25,null);
select * from sd where s_name like 'A%';
update sd set c_id='c1' where age=20 and c_id is null;
select count(*) as student, c.id from sd s, co c where s.c_id=c.id group by c.id;
/*JOINS*/
-- INNER JOIN
-- Returns records that have matching values in both tables.
SELECT s.s_name, s.age, c.c_name, c.id, s.id
FROM sd s
INNER JOIN co c ON s.c_id = c.id;
--- LEFT JOIN (or LEFT OUTER JOIN)
-- Returns all records from the left table (sd), and the matched records from the right table (co). If there is no match, the result is NULL from the right table.
SELECT s.s_name, s.age, c.c_name, c.id
FROM sd s
LEFT JOIN co c ON s.c_id = c.id; -- This query will return all students, showing the course name if they are enrolled in one. For students without a course, the course name will be NULL.
--  RIGHT JOIN (or RIGHT OUTER JOIN)
-- Returns all records from the right table (sd), and the matched records from the left table (co). If there is no match, the result is NULL from the left table. 
SELECT s.s_name, s.age, c.c_name, c.id
FROM co c
RIGHT JOIN sd s ON s.c_id = c.id;
-- FULL OUTER JOIN
-- Returns all records when there is a match in either table. Unmatched rows will have NULL for the non-matching side.
SELECT s.s_name, s.age, c.c_name
FROM sd s
 JOIN co c ON s.c_id = c.id;
-- CROSS JOIN
-- Returns the Cartesian product of the two tables (i.e., all combinations of rows).
SELECT s.s_name, c.c_name, s.id
FROM sd s
CROSS JOIN co c;
-- default join is inner join
-- UNION: Combining results from two SELECT statements, removing duplicates.
SELECT s_name FROM sd
UNION
SELECT c_name FROM co;
-- INTERSECT: Retrieve records that are present in both SELECT statements.
SELECT s_name FROM sd WHERE age > 20
INTERSECT
SELECT c_name FROM co WHERE id = 'c2';
-- EXCEPT: Retrieve records from the first SELECT that are not in the second SELECT
SELECT s_name FROM sd
EXCEPT
SELECT c_name FROM co;
-- Begin transaction to ensure data integrity
BEGIN;

INSERT INTO sd (id, s_name, age, c_id) VALUES (10, 'Riya', 24, 'c1');
INSERT INTO sd (id, s_name, age, c_id) VALUES (11, 'Raj', 23, 'c2');

-- Check the inserted values
SELECT * FROM sd WHERE id IN (10, 11);

-- Commit if all queries are successful
COMMIT;

-- Rollback example if there is an error (commented out)
-- ROLLBACK;
-- The BEGIN statement starts a transaction. If all statements within the transaction succeed, a COMMIT is issued to save the changes. If any errors occur, you can issue a ROLLBACK to revert the changes.
create database bank;
use bank;
create table if not exists bank.acc(acc_id int primary key, acc_holder varchar(100),balance decimal(10,2));
insert into acc(acc_id,acc_holder,balance)values
(1,'Alice',1000.00),
(2,'Bob',1500.00);
-- begin commit rollback(undo)
begin;
-- subtract 252.01 from Alice's account
update acc set balance=balance-252.01 where acc_id=1;
-- add 225.25 to Bob's account
update acc set balance=balance+225.25 where acc_id=999;
commit;
rollback;
select * from acc;
-- try and catch kind in mysql
START TRANSACTION  ;

UPDATE acc SET balance = balance - 252.01 WHERE acc_id = 1;
UPDATE acc SET balance = balance + 225.25 WHERE acc_id = 999;

-- If you want to roll back:
ROLLBACK WORK AND NO CHAIN;

-- If you want to commit the transaction:
-- COMMIT WORK AND NO CHAIN;

-- Optionally, disable autocommit for the session:
SET autocommit = 0;
/*START TRANSACTION or BEGIN start a new transaction.


COMMIT commits the current transaction, making its changes permanent.

ROLLBACK rolls back the current transaction, canceling its changes.

SET autocommit disables or enables the default autocommit mode for the current session.*/
-- deleting a column
/*ALTER TABLE table_name
DROP COLUMN column_name;
*/
-- deleting a specific row
/*DELETE FROM table_name
WHERE condition;
*/
