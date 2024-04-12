create table Students(
    [Id] int PRIMARY key IDENTITY(1,1),
    [Fullname] NVARCHAR(50),
    [Email] NVARCHAR(50) UNIQUE
)

insert into Students([Fullname], [Email])
values('Elnur Safiyev','elnur@gmail.com' )

select * from Students



SELECT
SUBSTRING(Email, 1, CHARINDEX('@', Email) -1) as 'half email'
from Students

SELECT
SUBSTRING(Email, CHARINDEX('@', Email) +1, len(Email)) as ' end half email'
from Students
