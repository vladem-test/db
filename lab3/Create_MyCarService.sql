USE [MyCarService]

CREATE TABLE [State] (
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](50) NOT NULL UNIQUE,
	CONSTRAINT [PK_State] PRIMARY KEY ([state_id] ASC) 
 )

 CREATE TABLE [OperationStatus] (
	[OperationStatus_id] [int] IDENTITY(1,1) NOT NULL,
	[operation_id] int NOT NULL,
	[status_id] int NOT NULL DEFAULT 4, -- 'В обработке'
	[start_date] date NOT NULL DEFAULT getdate() CHECK([start_date] <= getdate()),
	CONSTRAINT [PK_OperationStatus] PRIMARY KEY ([OperationStatus_id] ASC) 
 )

CREATE TABLE [Manufacturer](
	[manufacturer_id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer_name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Manufacturer] PRIMARY KEY ([manufacturer_id] ASC) 
 )

 CREATE TABLE [Model](
 	[model_code] [int] IDENTITY(1,1) NOT NULL,
	[model_name] [nvarchar](50) NULL,
	[daily_hire_rate] [money] NULL,
	[manufacturer_id] [int] NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY ([model_code] ASC)
 )

 CREATE TABLE [Car](
	[car_id] [int] IDENTITY(1,1) NOT NULL,
	[license_number] [nchar](6) NOT NULL,
	[owner_id] [int] NOT NULL,
	[current_mileage] [real] NULL,
	[engine_size] [real] NULL,
	[other_car_details] [ntext] NULL,
	[realese_year] [int] NULL CHECK ([realese_year] <= YEAR(getdate())),
	[model_code] [int] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY ([car_id] ASC)
 )

 CREATE TABLE [Customer](
 	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nchar](20) NOT NULL,
	[last_name] [nchar](20) NOT NULL,
	[email_adress] [char](30) NULL,
	[city_id] [int] NULL,
	[loyalty_score] [money] NULL,
	[card_expire_date] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY ([customer_id] ASC)
 )

 CREATE TABLE [Job](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[post] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY 
 (
		[job_id] ASC
 ))

 CREATE TABLE [Details](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[detail_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY
(
	[detail_id] ASC
))

CREATE TABLE [Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[adress] [ntext] NOT NULL,
	[capacity] [int] NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY
(
	[department_id] ASC
))

CREATE TABLE [Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY
(
	[status_id] ASC
))

CREATE TABLE [Employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[job_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[experience] [int] NOT NULL,
	[department] [int] NULL,
	[rank] [int] NULL CHECK (0 < [rank] AND [rank] < 5),
 CONSTRAINT [PK_Employee] PRIMARY KEY 
(
	[employee_id] ASC
))

CREATE TABLE [Operation](
	[operation_id] [int] IDENTITY(1,1) NOT NULL,
	[mechanic_id] [int] NULL,
	[service_type_id] [int] NOT NULL,
	[car_id] [int] NULL,
	[iterations] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[unit_price] [money] NOT NULL,
	[planned_end_date] [date] NOT NULL,
	[actual_end_date] [date] NULL CHECK ([actual_end_date] <= getdate()),
 CONSTRAINT [PK_Operation] PRIMARY KEY 
(
	[operation_id] ASC
))

CREATE TABLE [Transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[detail_id] [int] NULL,
	[amount] [int] NOT NULL,
	[order_id] [int] NULL,
	[unit_price] [money] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY 
(
	[transaction_id] ASC
))

CREATE TABLE [ServiceType](
	[service_type_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NOT NULL,
	[required_experience] [int] NULL,
	[isRepair] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY
(
	[service_type_id] ASC
))

CREATE TABLE [City](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state_id] int NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY
(
	[city_id] ASC
))

CREATE TABLE [Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NOT NULL DEFAULT(getdate()),
	[end_date] [date] NULL,
	[total] [money] NULL,
	[manager_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY 
(
	[order_id] ASC
))

CREATE UNIQUE INDEX [IX_Manufacturer] ON [Manufacturer]
(
[manufacturer_name] ASC
);

CREATE UNIQUE INDEX [IX_Model] ON [Model]
(
	[model_name] ASC
);

CREATE UNIQUE INDEX [IX_Details] ON [Details]
(
[detail_name] ASC
);

ALTER TABLE OperationStatus ADD CONSTRAINT [FK_OperationStatus_Operation] FOREIGN KEY([operation_id])
REFERENCES Operation ([operation_id])

ALTER TABLE OperationStatus ADD CONSTRAINT [FK_OperationStatus_Status] FOREIGN KEY([status_id])
REFERENCES [Status] ([status_id])

ALTER TABLE [City] ADD CONSTRAINT [FK_City_State] FOREIGN KEY([state_id])
REFERENCES [State] ([state_id])

ALTER TABLE [Model] ADD CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY([manufacturer_id])
REFERENCES [Manufacturer] ([manufacturer_id])

ALTER TABLE [Car] ADD CONSTRAINT [FK_Car_Customer] FOREIGN KEY([owner_id])
REFERENCES [Customer] ([customer_id])

ALTER TABLE [Car] ADD CONSTRAINT [FK_Car_Model] FOREIGN KEY([model_code])
REFERENCES [Model] ([model_code])

ALTER TABLE [Customer] ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([city_id])
REFERENCES [City] ([city_id])

ALTER TABLE [Order] ADD CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])

ALTER TABLE [Order] ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([manager_id])
REFERENCES [Employee] ([employee_id])

ALTER TABLE [Department] ADD CONSTRAINT [FK_Department_City] FOREIGN KEY([city_id])
REFERENCES [City] ([city_id])

ALTER TABLE [Employee] ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY([department])
REFERENCES [Department] ([department_id])

ALTER TABLE [Employee] ADD CONSTRAINT [FK_Employee_Job] FOREIGN KEY([job_id])
REFERENCES [Job] ([job_id])

ALTER TABLE [Operation] ADD CONSTRAINT [FK_Operation_Car] FOREIGN KEY([car_id])
REFERENCES [Car] ([car_id])

ALTER TABLE [Operation] ADD CONSTRAINT [FK_Operation_Employee] FOREIGN KEY([mechanic_id])
REFERENCES [Employee] ([employee_id])

ALTER TABLE [Operation] ADD CONSTRAINT [FK_Operation_Order] FOREIGN KEY([order_id])
REFERENCES [Order] ([order_id])

ALTER TABLE [Operation] ADD CONSTRAINT [FK_Operation_ServiceType] FOREIGN KEY([service_type_id])
REFERENCES [ServiceType] ([service_type_id])

ALTER TABLE [Transactions] ADD  CONSTRAINT [FK_Transactions_Details] FOREIGN KEY([detail_id])
REFERENCES [Details] ([detail_id])

ALTER TABLE [Transactions] ADD CONSTRAINT [FK_Transactions_Order] FOREIGN KEY([order_id])
REFERENCES [Order] ([order_id])