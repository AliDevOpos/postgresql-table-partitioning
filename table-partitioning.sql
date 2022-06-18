## Create temp databse ###
create database temp;
## connect to temp database by \c temp ##########
## create table with name  customers as partition by range ############
create table customers (id integer, nem text, age numeric) partition by range (age);
## create partition tables 
create table cust_young partition of customers for values from (MINVALUE) to (25);
create table cust_medium partition of customers for values from (25) to (75);
create table cust_old partition of customers for values from (75) to (MAXVALUE);
insert into customers values (1, 'Bob', 20),(2, 'Alice',20),(3,'do',37),(4,'Richard',80);
## check where data is stored
select tableoid::regclass, * from customers;
