USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[C_Carrera]    Script Date: 9/20/2025 5:44:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[C_Carrera](
	[Car_CarreraID] [int] IDENTITY(1,1) NOT NULL,
	[Car_Nombre] [varchar](100) NOT NULL,
	[Car_FechaCreacion] [date] NOT NULL,
	[Car_FechaModificacion] [date] NOT NULL,
	[Car_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_C_Carrera] PRIMARY KEY CLUSTERED 
(
	[Car_CarreraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[C_Carrera] ADD  CONSTRAINT [DF_C_Carrera_Car_FechaCreacion]  DEFAULT (getdate()) FOR [Car_FechaCreacion]
GO

ALTER TABLE [dbo].[C_Carrera] ADD  CONSTRAINT [DF_C_Carrera_Car_FechaModificacion]  DEFAULT (getdate()) FOR [Car_FechaModificacion]
GO

ALTER TABLE [dbo].[C_Carrera]  WITH CHECK ADD  CONSTRAINT [CK_C_Carrera_NoBlank] CHECK  ((ltrim(rtrim([Car_Nombre]))<>'' AND [Car_Nombre]=upper([Car_Nombre]) AND NOT [Car_Nombre] like ' %' AND NOT [Car_Nombre] like '% '))
GO

ALTER TABLE [dbo].[C_Carrera] CHECK CONSTRAINT [CK_C_Carrera_NoBlank]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No permite espacios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'C_Carrera', @level2type=N'CONSTRAINT',@level2name=N'CK_C_Carrera_NoBlank'
GO


