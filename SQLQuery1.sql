create database market
 

 use market

 create table Brands(
 Id int primary key identity,
 Name nvarchar(25)
 )

 create table Notebooks(
 Id int primary key identity,
 Name nvarchar(25),
 Price money
 )

 create table Phones(
 Id int primary key identity,
 Name nvarchar(25),
 Price money
 )

 --1
Alter Table Notebooks
Add BrandId int Foreign Key References Brands(Id)

--2
Alter Table Phones
Add BrandId int Foreign Key References Brands(Id)

--3
Select n.Name , b.Name 'BrandName', n.Price From Notebooks n
Left Join Brands b
On n.BrandId = b.Id

--4
Select p.Name, b.Name 'BrandName', p.Price From Phones p
Left Join Brands b
On p.BrandId = b.Id

--5
Select Name From Notebooks where BrandID =(Select Id From Brands where Name like '%s%')


--6
Select Name, Price From Notebooks where Price Between 2000 and 5000
Select Name, Price  From Notebooks where Price> 5000

--7
Select Name, Price From Phones where Price Between 1000 and 1500
Select Name, Price From Phones where Price> 1500

--8
Select Name, COUNT(Name) From Notebooks Group By BrandId Having COUNT(BrandId) > 1



