USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[C_Genero]    Script Date: 9/20/2025 5:44:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[C_Genero](
	[Gro_GeneroID] [int] IDENTITY(1,1) NOT NULL,
	[Gro_Nombre] [varchar](30) NOT NULL,
	[Gro_FechaCreacion] [date] NOT NULL,
	[Gro_FechaModificacion] [date] NOT NULL,
	[Gro_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_C_Genero] PRIMARY KEY CLUSTERED 
(
	[Gro_GeneroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[C_Genero] ADD  CONSTRAINT [DF_C_Genero_Gro_FechaCreacion]  DEFAULT (getdate()) FOR [Gro_FechaCreacion]
GO

ALTER TABLE [dbo].[C_Genero] ADD  CONSTRAINT [DF_C_Genero_Gro_FechaModificacion]  DEFAULT (getdate()) FOR [Gro_FechaModificacion]
GO

ALTER TABLE [dbo].[C_Genero]  WITH CHECK ADD  CONSTRAINT [CK_C_Genero_NoBlank] CHECK  ((ltrim(rtrim([Gro_Nombre]))<>'' AND [Gro_Nombre]=upper([Gro_Nombre]) AND NOT [Gro_Nombre] like ' %' AND NOT [Gro_Nombre] like '% '))
GO

ALTER TABLE [dbo].[C_Genero] CHECK CONSTRAINT [CK_C_Genero_NoBlank]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No permite espacios en blanco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'C_Genero', @level2type=N'CONSTRAINT',@level2name=N'CK_C_Genero_NoBlank'
GO


