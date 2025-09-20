USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[T_Libro]    Script Date: 9/20/2025 5:45:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_Libro](
	[Lbo_LibroID] [int] IDENTITY(1,1) NOT NULL,
	[Lbo_Titulo] [varchar](100) NOT NULL,
	[Lbo_AutorID] [int] NOT NULL,
	[Lbo_GeneroID] [int] NOT NULL,
	[Lbo_EditorialID] [int] NOT NULL,
	[Lbo_Stock] [int] NOT NULL,
	[Lbo_Edicion] [varchar](100) NOT NULL,
	[Lbo_FechaCreacion] [date] NOT NULL,
	[Lbo_FechaModificacion] [date] NOT NULL,
	[Lbo_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_T_Libro] PRIMARY KEY CLUSTERED 
(
	[Lbo_LibroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[T_Libro] ADD  CONSTRAINT [DF_T_Libro_Lbo_FechaCreacion]  DEFAULT (getdate()) FOR [Lbo_FechaCreacion]
GO

ALTER TABLE [dbo].[T_Libro] ADD  CONSTRAINT [DF_T_Libro_Lbo_FechaModificacion]  DEFAULT (getdate()) FOR [Lbo_FechaModificacion]
GO

ALTER TABLE [dbo].[T_Libro]  WITH CHECK ADD  CONSTRAINT [FK_T_Libro_C_Autor] FOREIGN KEY([Lbo_AutorID])
REFERENCES [dbo].[C_Autor] ([Atr_AutorID])
GO

ALTER TABLE [dbo].[T_Libro] CHECK CONSTRAINT [FK_T_Libro_C_Autor]
GO

ALTER TABLE [dbo].[T_Libro]  WITH CHECK ADD  CONSTRAINT [FK_T_Libro_C_Editorial] FOREIGN KEY([Lbo_EditorialID])
REFERENCES [dbo].[C_Editorial] ([Edt_EditorialID])
GO

ALTER TABLE [dbo].[T_Libro] CHECK CONSTRAINT [FK_T_Libro_C_Editorial]
GO

ALTER TABLE [dbo].[T_Libro]  WITH CHECK ADD  CONSTRAINT [FK_T_Libro_C_Genero] FOREIGN KEY([Lbo_GeneroID])
REFERENCES [dbo].[C_Genero] ([Gro_GeneroID])
GO

ALTER TABLE [dbo].[T_Libro] CHECK CONSTRAINT [FK_T_Libro_C_Genero]
GO

ALTER TABLE [dbo].[T_Libro]  WITH CHECK ADD  CONSTRAINT [CK_T_Libro_NoBlank] CHECK  ((ltrim(rtrim([Lbo_Titulo]))<>'' AND [Lbo_Titulo]=upper([Lbo_Titulo]) AND NOT [Lbo_Titulo] like ' %' AND NOT [Lbo_Titulo] like '% ' AND (ltrim(rtrim([Lbo_Edicion]))<>'' AND [Lbo_Edicion]=upper([Lbo_Edicion]) AND NOT [Lbo_Edicion] like ' %' AND NOT [Lbo_Edicion] like '% ')))
GO

ALTER TABLE [dbo].[T_Libro] CHECK CONSTRAINT [CK_T_Libro_NoBlank]
GO


