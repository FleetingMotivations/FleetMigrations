USE [FleetEntityFramework]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 8/23/2016 1:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 8/23/2016 1:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingIdentifier] [varchar](100) NOT NULL,
	[CampusId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Campus]    Script Date: 8/23/2016 1:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[CampusId] [int] IDENTITY(1,1) NOT NULL,
	[CampusIdentifer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Campus] PRIMARY KEY CLUSTERED 
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 8/23/2016 1:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[WorkstationId] [int] NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[Sent] [datetime] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileType] [nvarchar](max) NULL,
	[FileSize] [int] NULL,
	[HasBeenScanned] [bit] NULL,
	[Uri] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomIdentifier] [varchar](100) NOT NULL,
	[BuildingId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Identifer] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkgroupApplications]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkgroupApplications](
	[Workgroup_WorkgroupId] [int] NOT NULL,
	[Application_ApplicationId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WorkgroupApplications] PRIMARY KEY CLUSTERED 
(
	[Workgroup_WorkgroupId] ASC,
	[Application_ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workgroups]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workgroups](
	[WorkgroupId] [int] IDENTITY(1,1) NOT NULL,
	[Started] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[CommisionedById] [int] NOT NULL,
	[CommisionedBy_UserId] [int] NULL,
 CONSTRAINT [PK_dbo.Workgroups] PRIMARY KEY CLUSTERED 
(
	[WorkgroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkgroupWorkstations]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkgroupWorkstations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkstationId] [int] NOT NULL,
	[WorkgroupId] [int] NOT NULL,
	[TimeRemoved] [datetime] NULL,
	[SharingEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.WorkgroupWorkstations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkstationLogins]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkstationLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkstationId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.WorkstationLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkstationMessages]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkstationMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkStationId] [int] NOT NULL,
	[MessageId] [int] NOT NULL,
	[Received] [datetime] NULL,
	[HasBeenSeen] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.WorkstationMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workstations]    Script Date: 8/23/2016 1:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workstations](
	[WorkstationId] [int] IDENTITY(1,1) NOT NULL,
	[WorkstationIdentifier] [varchar](100) NOT NULL,
	[IpAddress] [varchar](100) NOT NULL,
	[MacAddress] [varchar](450) NULL,
	[RoomID] [int] NULL,
	[LastSeen] [datetime] NOT NULL,
	[FriendlyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Workstations] PRIMARY KEY CLUSTERED 
(
	[WorkstationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Buildings_dbo.Campus_CampusId] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campus] ([CampusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_dbo.Buildings_dbo.Campus_CampusId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Messages_dbo.Applications_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_dbo.Messages_dbo.Applications_ApplicationId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Messages_dbo.Workstations_WorkstationId] FOREIGN KEY([WorkstationId])
REFERENCES [dbo].[Workstations] ([WorkstationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_dbo.Messages_dbo.Workstations_WorkstationId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rooms_dbo.Buildings_BuildingId] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_dbo.Rooms_dbo.Buildings_BuildingId]
GO
ALTER TABLE [dbo].[WorkgroupApplications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkgroupApplications_dbo.Applications_Application_ApplicationId] FOREIGN KEY([Application_ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkgroupApplications] CHECK CONSTRAINT [FK_dbo.WorkgroupApplications_dbo.Applications_Application_ApplicationId]
GO
ALTER TABLE [dbo].[WorkgroupApplications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkgroupApplications_dbo.Workgroups_Workgroup_WorkgroupId] FOREIGN KEY([Workgroup_WorkgroupId])
REFERENCES [dbo].[Workgroups] ([WorkgroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkgroupApplications] CHECK CONSTRAINT [FK_dbo.WorkgroupApplications_dbo.Workgroups_Workgroup_WorkgroupId]
GO
ALTER TABLE [dbo].[Workgroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Workgroups_dbo.Users_CommisionedBy_UserId] FOREIGN KEY([CommisionedBy_UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Workgroups] CHECK CONSTRAINT [FK_dbo.Workgroups_dbo.Users_CommisionedBy_UserId]
GO
ALTER TABLE [dbo].[WorkgroupWorkstations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkgroupWorkstations_dbo.Workgroups_WorkgroupId] FOREIGN KEY([WorkgroupId])
REFERENCES [dbo].[Workgroups] ([WorkgroupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkgroupWorkstations] CHECK CONSTRAINT [FK_dbo.WorkgroupWorkstations_dbo.Workgroups_WorkgroupId]
GO
ALTER TABLE [dbo].[WorkgroupWorkstations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkgroupWorkstations_dbo.Workstations_WorkstationId] FOREIGN KEY([WorkstationId])
REFERENCES [dbo].[Workstations] ([WorkstationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkgroupWorkstations] CHECK CONSTRAINT [FK_dbo.WorkgroupWorkstations_dbo.Workstations_WorkstationId]
GO
ALTER TABLE [dbo].[WorkstationLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkstationLogins_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkstationLogins] CHECK CONSTRAINT [FK_dbo.WorkstationLogins_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[WorkstationLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkstationLogins_dbo.Workstations_WorkstationId] FOREIGN KEY([WorkstationId])
REFERENCES [dbo].[Workstations] ([WorkstationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkstationLogins] CHECK CONSTRAINT [FK_dbo.WorkstationLogins_dbo.Workstations_WorkstationId]
GO
ALTER TABLE [dbo].[WorkstationMessages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkstationMessages_dbo.Messages_MessageId] FOREIGN KEY([MessageId])
REFERENCES [dbo].[Messages] ([MessageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkstationMessages] CHECK CONSTRAINT [FK_dbo.WorkstationMessages_dbo.Messages_MessageId]
GO
ALTER TABLE [dbo].[WorkstationMessages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.WorkstationMessages_dbo.Workstations_WorkStationId] FOREIGN KEY([WorkStationId])
REFERENCES [dbo].[Workstations] ([WorkstationId])
GO
ALTER TABLE [dbo].[WorkstationMessages] CHECK CONSTRAINT [FK_dbo.WorkstationMessages_dbo.Workstations_WorkStationId]
GO
ALTER TABLE [dbo].[Workstations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Workstations_dbo.Rooms_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[Workstations] CHECK CONSTRAINT [FK_dbo.Workstations_dbo.Rooms_RoomID]
GO
