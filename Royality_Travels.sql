--create dateabase and table
create database Royality_Travels

create table [Admins] (
	adminID int not null primary key,
	[name] varchar(50) not null, 
	phoneNum char(11)not null, 
	country varchar(50), 
	[password] [varchar](50) not null )

create table [Users] (
	userID int not null primary key,
	[name] varchar(50) not null, 
	phoneNum char(11) not null, 
	country varchar(50), 
	[password] [varchar](50) not null )

	
create table [Trips] (
	tripID int not null primary key,
	location_name varchar(50) not null,
	totalSeats int default 10,
	seatsAvailable int default 0,
	[start_date] date not null,
	end_date date not null,
	price int
	)

	


	

create table [Package] (
	packageID int not null primary key,
	package_name varchar(50) not null)

create table [Bookings] (
	userID int not null,
	tripID int not null,
	seats int not null,
	booking_date date not null,
	packageID int not null foreign key references [Package](packageID),
	price float,
	primary key (userID, tripID) )


create table [History] (
	userID int not null foreign key references [Users](userID),
	tripID int not null foreign key references [Trips](tripID),
	--rating int default null check(rating >= 0 and rating <= 5),
	primary key (userID, tripID) )


create table [Wishlist] (
	userID int not null foreign key references [Users](userID),
	tripID int not null foreign key references [Trips](tripID),
	primary key (userID, tripID) )


create table TourPlan
(
	TripID integer foreign key references [Trips](tripID) primary key,
	[plan] varchar(200)
)
create table Pictures
(
	TripName varchar(50) primary key,
	piclocation varchar(50)
)

create table locationranking(
	locationname varchar(50) primary key,
	[description] varchar(500),
	ranking int
)
create table Rating (
	userID int not null foreign key references [Users](userID),
	tripID int not null foreign key references [Trips](tripID),
	ratings int,
	primary key (userID, tripID) )


ALTER TABLE Users
ADD Email varchar(50);

ALTER TABLE Admins
ADD Email varchar(50);




insert into Pictures values('Swat','Images/Swat.jpg')
insert into Pictures values('Hunza','Images/hunza.jpg')
insert into Pictures values('Kalash','Images/kalash.jpg')
insert into Pictures values('Khunjerab','Images/khunjerab.jpg')
insert into Pictures values('Margala','Images/margala.jpg')
insert into Pictures values('Fairy Meadows','Images/fairy.jpg')

select *from Pictures
insert into Pictures values('Malam Jabbah','Images/Malam Jabbah.jpeg')
insert into Pictures values('Naran','Images/Naran.jpeg')
insert into Pictures values('Neelum Valley','Images/Neelum Valley.jpeg')
insert into Pictures values('Shogran','Images/Shogran.jpeg')
insert into Pictures values('Skardu','Images/Skardu.jpeg')

--insert data in table 
insert into Admins values 
	(1, 'Hammad', 03000000000, 'Pakistan', 'hammad123','student@nu.edu.pk'), 
	(2, 'Abdullah', 03000000001, 'Pakistan', 'abdullah123','student@nu.edu.pk'),
	(3, 'Arslan', 0300000002, 'Pakistan', 'arslan123','student@nu.edu.pk');


insert into Package values
	(1, 'Standard'), 
	(2, 'Gold'),
	(3, 'Premium');






insert into locationranking values('Fairy Meadows','Fairy Meadows is no doubt a stunner. The meadows offer an incredible view of Nanga Prabat, the world’s 9th highest mountain peak.',8)
insert into locationranking values('Hunza','To touch the beauty of nature everybody should visit this place.',9)
insert into locationranking values('Swat','SWAT- PARADISE ON EARTH AND THE SMALL SWITZERLAND OF THE EAST',10)
insert into locationranking values ('Kalash','Kalash Valley is one of the most beautiful and one of the most mysterious places in Pakistan. Kalash valley has a unique indigenous culture and religion that dates back thousands of years',8)
insert into locationranking values ('Khunjerab','This high-mountain pass isn’t for the faint of heart. At nearly 4,600 metres (15,397 feet), this popular tourist attraction connects Pakistan with China to form the highest paved border crossing in the world.',9)
insert into locationranking values('Margala','Islamabad might be a glitzy ‘new’ city, but did you know it also has a vast array of hills perfect for climbing? The Margala Hills are spread out over over 12,000 hectares and contain multiple hiking and running trails.',6)



delete from Users

select *from Package
select *from Admins 
select * from Users
select *from Trips
select *from Bookings

delete from Bookings

select * from Pictures
select *from History

delete from History
delete from Wishlist

select *from Wishlist
select *from TourPlan

select *from Pictures

delete from TourPlan
delete from Trips
delete from History
select *from Rating
delete from Rating
delete from Wishlist
--Stored Procedures and views
go
create procedure UpdateAdmin
@adminID int, @newName [varchar](50), @newCountry [varchar](50),  @newPhone varchar(50),@email varchar(50)

as 
begin 
	update [Admins]
	set [adminID]=@adminID, [name]=@newName, [phoneNum]=@newPhone, [country]=@newCountry
	where [adminID]=@adminID
end
go
create procedure userRating @userID int,@tripID int,@rat int as
insert into Rating values (@userID,@tripID,@rat)
go 
create procedure userTrips @userID int as
select tripID from History where userID=@userID
go
create procedure showRating @userID int as
	select Rating.tripID,location_name,ratings as Rating
	from Rating join  Trips on Rating.tripID=Trips.tripID where userID=@userID
go
create procedure UpdateUser
@userID int, @oldPass [varchar](50), @newPass [varchar](50), @newName [varchar](50), @newEmail [varchar](50), @newCountry [varchar](50),  @newPhone char(11)

as 
begin 
	update Users
	set [userID]=@userID, [name]=@newName, [phoneNum]=@newPhone, [country]=@newCountry, [password]=@newPass, [Email]=@newEmail
	where [userID]=@userID
end



go
create procedure ResetPassword
@userID int, @emailID varchar(50), @newpassword varchar(50)
as 
begin 
	update Users
	set password=@newpassword
	where userID=@userID and Email=@emailID
end
go
--trending places
go
create view Trending as
select locationname,[description],piclocation 
from locationranking join Pictures on locationranking.locationname=Pictures.TripName
where ranking>=8
go

--see users wishlist
go
create procedure showWishlist @userID int as
begin
select Wishlist.tripID,location_name,seatsAvailable,[start_date],end_date,price 
	from Wishlist join Trips on Wishlist.tripID=Trips.tripID where Wishlist.userID=@userID
end
go
--see a user history
go
create procedure showHistory @userID int as
begin
	select History.tripID,seats,booking_date,packageID,Bookings.price 
	from History join Bookings on History.userID=Bookings.userID where History.userID=@userID
end

--add to wishlist
go
create procedure addtowish @user int,@trip int
as
begin
	insert into Wishlist values (@user,@trip)
end


--book a trip
go
create procedure booktrips @user int, @trip int,@seat int,@date date,@package int,@price float
as
begin
	insert into Bookings values(@user,@trip,@seat,@date,@package,@price)
end
--update seats after booking
go
create procedure updateseats @seat int,@id int	as
begin
update Trips set seatsAvailable=@seat where tripID=@id
end

--show available trips
go
create procedure showtrips as
begin 
	select tripID from Trips
end

--search for a trip
go
create procedure showeverytrips @id int as
begin 
	select * from Trips where tripID=@id
end
--view for tour plans
go
create view guides as
select Trips.TripID,location_name,[plan],piclocation
from Trips join TourPlan on Trips.tripID=TourPlan.TripID join Pictures on location_name=Pictures.TripName

--add to history
go
create procedure addtoHistory @userID int, @trip int
as
begin
	insert into History values(@userID,@trip)
end

--add to trips
go
create procedure addtrips @id int,@name varchar(50),@seats int,@aseats int,@sdate date,@edate date, @price int
as
begin
insert into Trips values(@id,@name,@seats,@aseats,@sdate,@edate,@price)
end
--add to plan
go
create procedure addplan @id int,@plan varchar(200)
as
begin
	insert into TourPlan values(@id,@plan)
end

--check for user login
go
create Procedure UserLogIn 
@userID int , @password [varchar](50) 
As
Begin
	select* 
	from[Users] 
	where [Users].userID=@userID AND [Users].password=@password
end

--check for id before sign up
go
create Procedure CheckUser @userID int
as
begin
	select * from Users where userID=@userID
end

--check for admin login
go
create Procedure AdminLogin 
@adminID int , @password [varchar](50) 
As
Begin
	select* 
	from Admins 
	where Admins.adminID=@adminID AND Admins.password=@password
end

--insert into users
go
CREATE PROCEDURE forinsert @id varchar(50), @name varchar(50), @phone varchar(50), @country varchar(50),@pass varchar(50),@email varchar(50) 
AS
insert into Users values (@id,@name,@phone,@country,@pass,@email)
GO

--see all the users
go
create procedure seeUsers
as
select *from Users
go
