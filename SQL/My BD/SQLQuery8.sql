USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[T_Prestamo]    Script Date: 9/20/2025 5:45:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_Prestamo](
	[Pro_PrestamoID] [int] IDENTITY(1,1) NOT NULL,
	[Pro_AlumnoID] [int] NOT NULL,
	[Pro_LibroID] [int] NOT NULL,
	[Pro_FechaPrestamo] [date] NOT NULL,
	[Pro_FechaDevolucion] [date] NOT NULL,
	[Pro_Status] [tinyint] NOT NULL,
	[Pro_FechaEntrega] [nchar](10) NULL,
	[Pro_FechaCreacion] [date] NOT NULL,
	[Pro_FechaModificacion] [date] NOT NULL,
	[Pro_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_T_Prestamo] PRIMARY KEY CLUSTERED 
(
	[Pro_PrestamoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_Prestamo] ADD  CONSTRAINT [DF_T_Prestamo_Pro_FechaCreacion]  DEFAULT (getdate()) FOR [Pro_FechaCreacion]
GO

ALTER TABLE [dbo].[T_Prestamo] ADD  CONSTRAINT [DF_T_Prestamo_Pro_FechaModificacion]  DEFAULT (getdate()) FOR [Pro_FechaModificacion]
GO

ALTER TABLE [dbo].[T_Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_T_Prestamo_T_Alumno] FOREIGN KEY([Pro_AlumnoID])
REFERENCES [dbo].[T_Alumno] ([Alo_AlumnoID])
GO

ALTER TABLE [dbo].[T_Prestamo] CHECK CONSTRAINT [FK_T_Prestamo_T_Alumno]
GO

ALTER TABLE [dbo].[T_Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_T_Prestamo_T_Libro] FOREIGN KEY([Pro_LibroID])
REFERENCES [dbo].[T_Libro] ([Lbo_LibroID])
GO

ALTER TABLE [dbo].[T_Prestamo] CHECK CONSTRAINT [FK_T_Prestamo_T_Libro]
GO


