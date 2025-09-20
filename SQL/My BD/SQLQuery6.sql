USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[T_Alumno]    Script Date: 9/20/2025 5:45:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_Alumno](
	[Alo_AlumnoID] [int] IDENTITY(1,1) NOT NULL,
	[Alo_Nombre] [varchar](50) NOT NULL,
	[Alo_PrimerApellido] [varchar](30) NOT NULL,
	[Alo_SegundoApellido] [varchar](30) NOT NULL,
	[Alo_GrupoID] [int] NOT NULL,
	[Alo_CarreraID] [int] NOT NULL,
	[Alo_Correo] [varchar](100) NOT NULL,
	[Alo_Estatus] [tinyint] NOT NULL,
	[Alo_Turno] [varchar](30) NOT NULL,
	[Alo_Grado] [int] NOT NULL,
	[Alo_FechaCreacion] [date] NOT NULL,
	[Alo_FechaModificacion] [date] NOT NULL,
	[Alo_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_T_Alumno] PRIMARY KEY CLUSTERED 
(
	[Alo_AlumnoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_Alumno] ADD  CONSTRAINT [DF_T_Alumno_Alo_FechaCreacion]  DEFAULT (getdate()) FOR [Alo_FechaCreacion]
GO

ALTER TABLE [dbo].[T_Alumno] ADD  CONSTRAINT [DF_T_Alumno_Alo_FechaModificacion]  DEFAULT (getdate()) FOR [Alo_FechaModificacion]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_T_Alumno_C_Carrera] FOREIGN KEY([Alo_CarreraID])
REFERENCES [dbo].[C_Carrera] ([Car_CarreraID])
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [FK_T_Alumno_C_Carrera]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_T_Alumno_C_Grupo] FOREIGN KEY([Alo_GrupoID])
REFERENCES [dbo].[C_Grupo] ([Gpo_GrupoID])
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [FK_T_Alumno_C_Grupo]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [CK_T_Alumno_Correo] CHECK  (([Alo_Correo] like '%_@__%._%' AND (ltrim(rtrim([Alo_Correo]))<>'' AND [Alo_Correo]=lower([Alo_Correo]) AND NOT [Alo_Correo] like ' %' AND NOT [Alo_Correo] like '% ')))
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [CK_T_Alumno_Correo]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [CK_T_Alumno_Grado] CHECK  (([Alo_Grado]>=(0) AND [Alo_Grado]<=(11)))
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [CK_T_Alumno_Grado]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [CK_T_Alumno_NoBalnk] CHECK  ((ltrim(rtrim([Alo_Nombre]))<>'' AND [Alo_Nombre]=upper([Alo_Nombre]) AND NOT [Alo_Nombre] like ' %' AND NOT [Alo_Nombre] like '% ' AND (ltrim(rtrim([Alo_PrimerApellido]))<>'' AND [Alo_PrimerApellido]=upper([Alo_PrimerApellido]) AND NOT [Alo_PrimerApellido] like ' %' AND NOT [Alo_PrimerApellido] like '% ') AND (ltrim(rtrim([Alo_SegundoApellido]))<>'' AND [Alo_SegundoApellido]=upper([Alo_SegundoApellido]) AND NOT [Alo_SegundoApellido] like ' %' AND NOT [Alo_SegundoApellido] like '% ')))
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [CK_T_Alumno_NoBalnk]
GO

ALTER TABLE [dbo].[T_Alumno]  WITH CHECK ADD  CONSTRAINT [CK_T_Alumno_Turno] CHECK  ((ltrim(rtrim([Alo_Turno]))<>'' AND [Alo_Turno]=upper([Alo_Turno]) AND NOT [Alo_Turno] like ' %' AND NOT [Alo_Turno] like '% ' AND ([Alo_Turno]='VESPERTINO' OR [Alo_Turno]='MATUTINO')))
GO

ALTER TABLE [dbo].[T_Alumno] CHECK CONSTRAINT [CK_T_Alumno_Turno]
GO


