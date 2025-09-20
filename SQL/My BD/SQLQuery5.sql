USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[C_Grupo]    Script Date: 9/20/2025 5:45:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[C_Grupo](
	[Gpo_GrupoID] [int] IDENTITY(1,1) NOT NULL,
	[Gpo_Nombre] [varchar](15) NOT NULL,
	[Gpo_FechaCreacion] [date] NOT NULL,
	[Gpo_FechaModificacion] [date] NOT NULL,
	[Gpo_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_C_Grupo] PRIMARY KEY CLUSTERED 
(
	[Gpo_GrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[C_Grupo] ADD  CONSTRAINT [DF_C_Grupo_Gpo_FechaCreacion]  DEFAULT (getdate()) FOR [Gpo_FechaCreacion]
GO

ALTER TABLE [dbo].[C_Grupo] ADD  CONSTRAINT [DF_C_Grupo_Gpo_FechaModificacion]  DEFAULT (getdate()) FOR [Gpo_FechaModificacion]
GO

ALTER TABLE [dbo].[C_Grupo]  WITH CHECK ADD  CONSTRAINT [CK_C_Grupo_May_Grupo] CHECK  (([Gpo_Nombre]=upper([Gpo_Nombre])))
GO

ALTER TABLE [dbo].[C_Grupo] CHECK CONSTRAINT [CK_C_Grupo_May_Grupo]
GO

ALTER TABLE [dbo].[C_Grupo]  WITH CHECK ADD  CONSTRAINT [CK_C_Grupo_NoBlank_Grupo] CHECK  ((ltrim(rtrim([Gpo_Nombre]))<>''))
GO

ALTER TABLE [dbo].[C_Grupo] CHECK CONSTRAINT [CK_C_Grupo_NoBlank_Grupo]
GO

ALTER TABLE [dbo].[C_Grupo]  WITH CHECK ADD  CONSTRAINT [CK_C_Grupo_NoSpace_Group] CHECK  ((NOT [Gpo_Nombre] like ' %' AND NOT [Gpo_Nombre] like '% '))
GO

ALTER TABLE [dbo].[C_Grupo] CHECK CONSTRAINT [CK_C_Grupo_NoSpace_Group]
GO


