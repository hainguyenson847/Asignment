

drop table OrderDetail
drop table [Order]
drop table Products
drop table Categories
drop table Accounts
--ACCOUNT
-- UserName
-- FullName
-- Password
-- Role
-- Image
-- Email
-- BirthDay
-- Address
-- Phone

create table Accounts (
	Username varchar(50) primary key,
	FullName nvarchar(50) not null,
	Password varchar(50) not null,
	Role int default 1,
	Image varchar(MAX) default 'img/avatar/Default_Avatar.jpg',
	Email varchar(50) not null,
	BirthDay date null,
	Address nvarchar(200) null,
	Phone nvarchar(50) null,
	status bit not null default 1
)


--CATEGORY
-- cid
-- cName

create table Categories (
	Cid int IDENTITY(1,1) NOT NULL primary key,
	CategoryName nvarchar(50) not null
)

--PRODUCT
-- pid
-- pName
-- img
-- price
-- description
-- quantity
-- discount
-- sold
-- releaseDate
-- cid
-- status

create table Products (
	Pid int IDENTITY(1,1) NOT NULL primary key,
	ProductName nvarchar(300) not null,
	Image varchar(MAX) NULL,
	SalePrice int null,
	Description nvarchar(max),
	Quantity int,
	Discount float,
	Sold int,
	ReleaseDate date,
	Cid int references Categories(Cid) on update cascade on delete set null,
	status bit not null default 1
)



--ORDER
-- oid
-- Date
-- UserName
-- TotalPrice
-- status

create table [Order] (
	Oid int IDENTITY(1,1) NOT NULL primary key,
	Date date not null,
	UserName varchar(50) references Accounts(UserName) not null,
	TotalPrice money null,
	status int not null
)

create table OrderDetail (
	Oid int references [Order](Oid) on delete cascade not null,
	Pid int references Products(Pid) on delete cascade not null,
	Quantity int not null
	primary key(oid, pid)
)

drop trigger trg_UpdateOrderAndProduct

CREATE TRIGGER trg_UpdateOrderAndProduct
ON OrderDetail
AFTER INSERT
AS
BEGIN
    -- Variables to store values from inserted rows
    DECLARE @Oid INT;
    DECLARE @Pid INT;
    DECLARE @Quantity INT;
    DECLARE @UnitPrice MONEY;

    -- Iterate through each inserted row
    DECLARE InsertedCursor CURSOR FOR
    SELECT Oid, Pid, Quantity
    FROM inserted;

    OPEN InsertedCursor;
    FETCH NEXT FROM InsertedCursor INTO @Oid, @Pid, @Quantity;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Retrieve the unit price (SalePrice) of the product
        SELECT @UnitPrice = SalePrice FROM Products WHERE Pid = @Pid;


        -- Update the Quantity in the Products table
        UPDATE Products
        SET Quantity = Quantity - @Quantity
        WHERE Pid = @Pid;

        FETCH NEXT FROM InsertedCursor INTO @Oid, @Pid, @Quantity;
    END

    CLOSE InsertedCursor;
    DEALLOCATE InsertedCursor;
END

CREATE TRIGGER trg_UpdateOnDeleteOrderDetail
ON OrderDetail
AFTER DELETE
AS
BEGIN
    -- Variables to store values from deleted rows
    DECLARE @Oid INT;
    DECLARE @Pid INT;
    DECLARE @Quantity INT;
    DECLARE @UnitPrice MONEY;

    -- Iterate through each deleted row
    DECLARE DeletedCursor CURSOR FOR
    SELECT Oid, Pid, Quantity
    FROM deleted;

    OPEN DeletedCursor;
    FETCH NEXT FROM DeletedCursor INTO @Oid, @Pid, @Quantity;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Retrieve the unit price (SalePrice) of the product
        SELECT @UnitPrice = SalePrice FROM Products WHERE Pid = @Pid;

        -- Update the TotalPrice in the Order table by subtracting the removed product's value
        UPDATE [Order]
        SET TotalPrice = COALESCE(TotalPrice, 0) - (@UnitPrice * @Quantity)
        WHERE Oid = @Oid;

        -- Update the Quantity in the Products table by adding back the removed quantity
        UPDATE Products
        SET Quantity = Quantity + @Quantity
        WHERE Pid = @Pid;

        FETCH NEXT FROM DeletedCursor INTO @Oid, @Pid, @Quantity;
    END

    CLOSE DeletedCursor;
    DEALLOCATE DeletedCursor;
END

drop trigger UpdateProductSoldAndQuantity

CREATE TRIGGER UpdateProductSoldAndQuantity
ON [Order]
AFTER UPDATE
AS
BEGIN
    -- Check if the status changed from 0 to 1
    IF UPDATE(status)
    BEGIN
        -- Use the inserted and deleted pseudo-tables to find status changes
        UPDATE p
        SET p.Sold = p.Sold + od.Quantity
        FROM Products p
        INNER JOIN OrderDetail od ON p.Pid = od.Pid
        INNER JOIN inserted i ON od.Oid = i.Oid
        INNER JOIN deleted d ON d.Oid = i.Oid
        WHERE d.status = 0 AND i.status = 1;
    END
END;



CREATE TRIGGER trg_DeleteOrderDetails
ON [Order]
AFTER DELETE
AS
BEGIN
    -- Xóa các hàng trong bảng OrderDetail dựa trên các Oid đã bị xóa từ bảng [Order]
    DELETE FROM OrderDetail
    WHERE Oid IN (SELECT Oid FROM deleted)
END



