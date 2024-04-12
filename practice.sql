CREATE TABLE Students (
    [Id] int primary key IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50) not null,
    [Email] NVARCHAR(100) unique
)

 

insert into Students([Name], [Surname], [Email])
 VALUES('Semed', 'Huseynov', 'semed@gmail.com'),
    ('Tunzale', 'Mammedova', 'tunzale@gmail.com'),
    ('Arzu', 'Kerimova', 'arzu@gmail.com'),
    ('Oruc', 'Mehrabov', 'oruc@gmail.com')

alter TABLE Students ADD DEFAULT 'XXX' for [Surname];

select * from Students

insert into Students ([Name], [Email])
 VALUES('Oruc', 'oruc1@gmail.com')

 ALTER TABLE Students
 add Age int check (Age > 18);

insert into Students ([Name], [Email], [Age])
 VALUES('Oruc', 'oruc111@gmail.com', 19)

 select Count(*) as 'Student count' from Students

select Sum(Age) as "Students age sum" from Students

Select AVG(Age) as 'Employee avg age' from Students

Select Min(Age) as 'Employee min age' from Students

Select Max(Age) as 'Employee Max age' from Students

Select AVG(Age) as 'Employee avg age' from Students

Select SUBSTRING('Semed bey', 1,3)

Select REPLACE('Salamlar', 's', 'd')

SELECT SUBSTRING([Surname], 1, 4) from Students

DECLARE @avgAge int = (select AVG(Age) from Students)

DECLARE @sumAge int = (select Sum(Age) from Students)

if @sumAge > @avgAge
  print 'Yes'
ELSE
  print 'No'

Create Table Countries(
    [Id] int primary key IDENTITY(1,1),
    [Name] NVARCHAR(50),
)

INSERT into Countries([Name])
VALUES('Azerbaycan'),
('Turkiye'),
('Ispaniya'),
('Almaniya')

select * from Countries

create Table Cities(
    [Id] int primary key IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [CountryId] int ,
    foreign key (CountryId) references Countries(id)
)

select * from Cities

insert into Cities([Name], [CountryId])
VALUES('Baku', 1), ('Aghsu', 1), 
   ('Shusha', 1),
   ('Antalya', 2),
   ('Madrid', 3),
   ('Barcelona', 3), 
   ('Berlin', 4), 
   ('Hamburg', 4)

Select * from Cities WHERE CountryId = 1

Create table Student(
    [Id] int primary key IDENTITY(1,1),
    [FullName] NVARCHAR(100) not null,
    [Email] NVARCHAR(100),
    [Address] NVARCHAR(100),
    [Age] int,
    [CitiId] int,
    foreign key (CitiId) REFERENCES cities(id)
)

select * from Student

Create table Teachers(
    [Id] int primary key IDENTITY(1,1),
    [FullName] NVARCHAR(100),
    [Salary] FLOAT,
    [Age] int,
    [CitiId] int,
    FOREIGN key (CitiId) references Cities(Id)
)

Create table TeacherStudents(
    [Id] int primary key IDENTITY(1,1),
    [TeacherId] int,
    [StudentId] int,
    foreign key (TeacherId) REFERENCES Teachers(id),
    FOREIGN key (StudentId) references Student(id),
)

Select * from Countries co
inner join cities ct
on co.Id = ct.CountryId

 
select ct.Name as 'City', co.Name as 'Country' from Countries co
inner JOIN Cities ct
on co.Id = ct.CountryId

select ct.Name as 'City', co.Name as 'Country' from Countries co
left JOIN Cities ct
on co.Id = ct.CountryId

select ct.Name as 'City', co.Name as 'Country' from Countries co
RIGHT JOIN Cities ct
on co.Id = ct.CountryId

select ct.Name as 'City', co.Name as 'Country' from Countries co
full JOIN Cities ct
on co.Id = ct.CountryId


select * from Student st 
join Cities ct 
on ct.id = st.CitiId

select st.FullName as 'Student Name', st.Email 'Student Email',
 st.age as 'Student age', ct.Name as 'City', co.name as 'Country', t.FullName as 'Teacher Fullname' from Student st
join Cities ct
on ct.Id = st.CitiId
join Countries co
on ct.CountryId = co.Id
join TeacherStudents ts
on ts.Id = ts.StudentId
join Teachers t
on t.Id = ts.StudentId
order by st.Age desc