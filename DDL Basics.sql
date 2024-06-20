-- By using syntax 'create database database_name' or 'create schema database_name' we can create a new database.
-- We use ';' as delimiter to end a query.
create database sampledb;

-- To use that database we use the syntax 'use database_name'.
use sampledb;

-- To view all the tables present in the database we can use syntax 'show tables'.
show tables;

-- Before creating tables we need to know what are the data types in sql.
-- SQL has datatypes like int(integer),float(decimals),varchar(string),date(a specific data type which stores date),time,date_time etc.
-- I have used basic data types like int and varchar.

-- To create a table we use the format 'create table table_name(column1 datatype,column2 ......)'
create table table1(Student_id int ,Student__name varchar(50),Age int,Branch varchar(3));

-- To view the description or details of a table we use desc or description keyword and the syntax goes like 'desc table_name'.
-- By this we can get details like column names,data types etc.
desc table1;

-- Let's create another table called table2 which we will try to delete.
create table table2(example_column1 int);

desc table2;

-- To delete a table from the database entirely we use 'drop table table_name'.
drop table table2;

-- If we don't know whether the table we want to create already exists or not, we can use the condition 'if not exists'.
create table if not exists table2 (example_column2 int);
-- If table with same table name we want to create already exists then we won't get an error. 
-- Instead we will get warning that says that the table we want to create already exists.

-- Earlier as we dropped the table2 with example_column1 , we get the details of the table2 with example_column2.
desc table2;

-- To modify a table or the columns in it we use the keyword 'alter'.
-- To rename a table name the syntax is 'alter table table_name rename as new_table_name'
alter table table2 rename as table3;

desc table3;

-- To get the data inside a table we use the keyword 'select'
-- There is more we can do with select keyword so that we get the data we want by using different conditions or filters.
select * from table1;
-- For now, consider the above syntax which retrives all the data in a table.

-- To add a column we use 'alter table table_name add column column_name datatype'.
alter table table1 add column Gender char;

desc table1;

-- To delete a column we use syntax 'alter table table_name drop column column_name'
alter table table1 drop column Gender;

desc table1;

-- To rename or change name of a column we use syntax 'alter table table_name change old_column_name new_old_column_name datatype'.
alter table table1 change Branch Dept varchar(30);

desc table1;

-- To modify a column's datatype we use syntax 'alter table table_name modify column column_name new_datatype'.
alter table table1 modify column Student_id varchar(10);

desc table1;

-- While creating a table we can use certain constraints or conditions on every column so that the data which satisfies the condition will be inserted or else it will not.
/*
Different types of constraints in SQL:
1. NOT NULL: Ensures the values inserted in the column cannot be null.
2. UNIQUE: Ensures that no two values inserted in the column are same.
3. PRIMARY KEY: Ensures that each value in the column is unique and not null. Also, it can be used to uniquely identify each row in the table.
   Only one Primary Key can exist in a table.
4. AUTO_INCREMENT: Automatically increments value for each new row.
5. FOREIGN KEY: We use foreign keys to refer the same column in another table. There can exist multiple foreign keys in a table(there are limited to 253).
6. CHECK: Ensures that every value inserted in the column satisfies the condition stated.
7. DEFAULT: Sets the default value of a column if no value is provided.
*/
-- Multiple constraints can be used on a single column.
-- We mention the constraints after the datatypes of the columns.
create table table_main(id int,Employee_name varchar(30) not null ,Age int not null check(Age>=21),City varchar(20) default 'Remote',Email varchar(50) unique,primary key (id));
/* 
Here the column name id represents employee's id and then the next column is employee's name followed by age,city and email.
The column id is the 'primary key' which makes sure that there can be no null values and all values are unique.
The column Employee_name is given a constraint 'not null' which makes sure that there are no null values as name can not be null.
The column Age is given two constraint 'not null' which makes sure there are no null values and constraint 'check' which makes sure values are greater than or equal to 21.
The column City is given a constraint 'default'. If no value is provided then the default value is inserted.
The column Email is given a constraint 'unique' which makes sure no two emails are same as all emails are unique.
*/

-- We can get details of constraints used on the columns in the table description. It does not show the constraint information like check etc.
desc table_main;

-- To insert values in a table we use syntax 'insert into table_name(column1,column2...) values(value1,value2...),(value3,value4...)'.
-- Here each set of values are stored as each individual row and the order is followed as the their order in the query.
-- If we are inserting values for every column we don't have to mention the column names and we have to make sure we values follow the order columns in the table or else values may be inserted in the wrong columns.
insert into table_main values(1,'Rohith',21,'Hyderabad','rcworks0@gmail.com'),(2,'Kush',22,'Bengaluru','Kush03@gmail.com');

select * from table_main;

-- Let us not insert the city value to check if the default value is inserted.
insert into table_main(id,Employee_name,Age,Email) values (3,'Pranay',25,'pranay@gmail.com');

select * from table_main;

-- Let us now insert values where the age is less than 21.
insert into table_main values (4,'Uday',20,'Delhi','uday@gmail.com');

select * from table_main;
-- As we can see the set of values are not present in the table as the age provided is less than 21 which fails to satisfy the age condition.
-- This is how constraints work.

-- To update values in a table we use 'update' and the syntax is 'update table_name set column_name = new_value where conditon'
-- If no condition is given the new values replaces values of the column in every row.
update table_main set Email = 'rohith@gmail.com' where id=1;

select * from table_main;

-- To delete we use 'delete' and the syntax is 'delete from table_name where condition'.
-- If the condition matches then the entire row is deleted.
delete from table_main where id=3;

select * from table_main;

-- Update and Delete are row wise operations and this does not effect the columns' characteristics.

-- To delete all the rows in a table we use 'Truncate' and the syntax is 'truncate table_name'.
truncate table_main;
-- This does not remove the table from the database. It only deletes all the rows and the table characteristics remain as they were.

select * from table_main;
