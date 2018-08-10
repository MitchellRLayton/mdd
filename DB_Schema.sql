USE [BPR];
GO


CREATE TABLE [dbo].[ZTest_Metric_Ownership] ( 
    [ID]					 INT IDENTITY (1, 1) NOT NULL, 
    [Owner]					 NVARCHAR (150) NOT NULL,
    [PrimaryReporter]		 NVARCHAR (150) NOT NULL,  
    [BackupReporter]         NVARCHAR (150),  
	[VarianceReporter]       NVARCHAR (150) NOT NULL,  
	[BackupVarianceReporter] NVARCHAR (150),
    [MetricApprover]         NVARCHAR (150), 
	CONSTRAINT PK_Metric_Ownership PRIMARY KEY NONCLUSTERED (ID)
);
GO

CREATE TABLE [dbo].[ZTest_Metric_Information] ( 
	[MetricId]			INT PRIMARY KEY IDENTITY (1, 1) NOT NULL, 
	[OwnerId]           INT NOT NULL,
    [Title]				NVARCHAR (150) NOT NULL,  
    [DateSubmitted]		NVARCHAR (150) NOT NULL,  
    [LOB]				NVARCHAR (150) NOT NULL, 
    [Type]				NVARCHAR (150) NOT NULL,
	[MTD]				INT,
	[YTD]				INT,
	[EOY]				INT,
	[Forecasting]       NVARCHAR (150),
	[DataAvailability]  NVARCHAR (150),
	[ApprovalStatus]    NVARCHAR (150),
	[DateApproved]		NVARCHAR (150),
	FOREIGN KEY ([OwnerId])
		REFERENCES [dbo].[ZTest_Metric_Ownership] ([ID]) 
			ON DELETE CASCADE      
			ON UPDATE CASCADE
);
GO
 
CREATE TABLE [dbo].[ZTest_Metric_Definition] ( 
    [DefinitionId]		  INT PRIMARY KEY IDENTITY (1, 1) NOT NULL, 
	[MetricId]			  INT NOT NULL,
    [Definition]		  NVARCHAR (MAX) NOT NULL,  
    [Units]				  NVARCHAR (50),  
    [CalculationFormula]  NVARCHAR (500), 
    [DataSource]		  NVARCHAR (300) NOT NULL,
	[LowestLevel]         NVARCHAR (125),
	[Exceptions]		  NVARCHAR (300),
	[Changes]		 	  NVARCHAR (300),
	FOREIGN KEY ([MetricId])
		REFERENCES [dbo].[ZTest_Metric_Information] ([MetricId]) 
			ON DELETE CASCADE      
			ON UPDATE CASCADE
);
GO

CREATE TABLE [dbo].[ZTest_Metric_Targets] ( 
    [TargetId]		 INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,  
	[MetricId]		 INT NOT NULL,

    [TargetType]	 NVARCHAR (100) NOT NULL,  
	[RegionDivision] NVARCHAR(100),

	[MTDTargetsJan]  NVARCHAR (50),
    [MTDTargetsFeb]  NVARCHAR (50),  
    [MTDTargetsMar]  NVARCHAR (50),  
    [MTDTargetsApr]  NVARCHAR (50),  
	[MTDTargetsMay]  NVARCHAR (50),  
    [MTDTargetsJun]  NVARCHAR (50),  
    [MTDTargetsJul]  NVARCHAR (50),  
    [MTDTargetsAug]  NVARCHAR (50),  
    [MTDTargetsSep]  NVARCHAR (50),  
    [MTDTargetsOct]  NVARCHAR (50),  
    [MTDTargetsNov]  NVARCHAR (50),  
    [MTDTargetsDec]  NVARCHAR (50),

	[YTDTargetsJan]  NVARCHAR (50),
    [YTDTargetsFeb]  NVARCHAR (50),  
    [YTDTargetsMar]  NVARCHAR (50),  
    [YTDTargetsApr]  NVARCHAR (50),  
	[YTDTargetsMay]  NVARCHAR (50),  
    [YTDTargetsJun]  NVARCHAR (50),  
    [YTDTargetsJul]  NVARCHAR (50),  
    [YTDTargetsAug]  NVARCHAR (50),  
    [YTDTargetsSep]  NVARCHAR (50),  
    [YTDTargetsOct]  NVARCHAR (50),  
    [YTDTargetsNov]  NVARCHAR (50),  
    [YTDTargetsDec]  NVARCHAR (50),

	[EOYTarget]		 NVARCHAR (50),
	[EOYForecast]	 NVARCHAR (50),


	FOREIGN KEY ([MetricId])
		REFERENCES [dbo].[ZTest_Metric_Information] ([MetricId]) 
			ON DELETE CASCADE      
			ON UPDATE CASCADE
);
GO



