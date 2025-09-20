USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[C_Editorial]    Script Date: 9/20/2025 5:44:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[C_Editorial](
	[Edt_EditorialID] [int] IDENTITY(1,1) NOT NULL,
	[Edt_Nombre] [varchar](30) NOT NULL,
	[Edt_FechaCreacion] [date] NOT NULL,
	[Edt_FechaModificacion] [date] NOT NULL,
	[Edt_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_C_Editorial] PRIMARY KEY CLUSTERED 
(
	[Edt_EditorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[C_Editorial] ADD  CONSTRAINT [DF_C_Editorial_Edt_FechaCreacion]  DEFAULT (getdate()) FOR [Edt_FechaCreacion]
GO

ALTER TABLE [dbo].[C_Editorial] ADD  CONSTRAINT [DF_C_Editorial_Edt_FechaModificacion]  DEFAULT (getdate()) FOR [Edt_FechaModificacion]
GO

ALTER TABLE [dbo].[C_Editorial]  WITH CHECK ADD  CONSTRAINT [CK_C_Editorial_NoBlank] CHECK  ((ltrim(rtrim([Edt_Nombre]))<>'' AND [Edt_Nombre]=upper([Edt_Nombre]) AND NOT [Edt_Nombre] like ' %' AND NOT [Edt_Nombre] like '% '))
GO

ALTER TABLE [dbo].[C_Editorial] CHECK CONSTRAINT [CK_C_Editorial_NoBlank]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No permite espacios en blanco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'C_Editorial', @level2type=N'CONSTRAINT',@level2name=N'CK_C_Editorial_NoBlank'
GO


