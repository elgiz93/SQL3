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
Select Brands.Name, Count(Brands.Id) 'Count' From Brands Join Notebooks On Notebooks.BrandId=Brands.Id Group By Brands.Name

--9
Select Brands.Name, Count(Brands.Id) 'Count' From Brands Join Phones On Phones.BrandId=Brands.Id Group By Brands.Name

--10
Select Name, BrandId From Notebooks
Union
Select Name, BrandId From Phones

--11
Select * From Notebooks
Union All
Select * From Phones

--12
Select n.Id,n.Name,n.Price,b.Name 'BrandName' From Notebooks n Join Brands b On n.BrandId=b.Id
Union All
Select p.Id,p.Name,p.Price,b.Name 'BrandName'  From Phones p Join Brands b On p.BrandId=b.Id

--13 
Select n.Id,n.Name,n.Price,b.Name 'BrandName' From Notebooks n Join Brands b On n.BrandId=b.Id Where n.Price>1000
Union All
Select p.Id,p.Name,p.Price,b.Name 'BrandName'  From Phones p Join Brands b On p.BrandId=b.Id Where p.Price>1000

--14
Select b.Name, Sum(p.Price) 'Total Price',Count(*) 'Product count' From Brands b
Join Phones p On p.BrandsId=b.Id
Group by b.Name

--15
Select b.Name, Sum(n.Price) 'Total Price',Count(*) 'Product count' From Brands b
Join Notebooks n On n.BrandsId=b.Id
Group by b.Name Having Count(*)>3




