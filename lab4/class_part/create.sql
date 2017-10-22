create table [Months](
	month_id [int] IDENTITY(1,1) NOT NULL,
	month_str [nvarchar] (15),
	CONSTRAINT [PK_Months] PRIMARY KEY (month_id ASC) 
)

create table [Time](
	time_id [int] IDENTITY(1,1) NOT NULL,
	month_id [int] NOT NULL,
	year int NOT NULL,
	CONSTRAINT [PK_Time] PRIMARY KEY ([time_id] ASC) 
)

create table Fact(
	fact_id [int] IDENTITY(1,1) NOT NULL,
	time_id [int],
	service_id [int] NOT NULL,
	model_id [int] NOT NULL,
	[count] [int] NULL,
	[sum] [money] NULL,
	CONSTRAINT [PK_Fact] PRIMARY KEY (fact_id ASC) 
)

ALTER TABLE [Time] ADD CONSTRAINT [FK_Time_Month] FOREIGN KEY(month_id)
REFERENCES Months (month_id)

ALTER TABLE Fact ADD CONSTRAINT [FK_Fact_Manufacturer] FOREIGN KEY(model_id)
REFERENCES [Manufacturer] ([manufacturer_id])

ALTER TABLE Fact ADD CONSTRAINT [FK_Fact_ServiceType] FOREIGN KEY(service_id)
REFERENCES ServiceType (service_type_id)

ALTER TABLE Fact ADD CONSTRAINT [FK_Fact_Time] FOREIGN KEY(time_id)
REFERENCES [Time] (time_id)
