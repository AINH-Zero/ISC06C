USE [BIBLIO_PrestamosLibros_DEV_APP]
GO

/****** Object:  Table [dbo].[C_Autor]    Script Date: 9/20/2025 5:44:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[C_Autor](
	[Atr_AutorID] [int] IDENTITY(1,1) NOT NULL,
	[Atr_Nombre] [varchar](100) NOT NULL,
	[Atr_FechaCreacion] [date] NOT NULL,
	[Atr_FechaModificacion] [date] NOT NULL,
	[Atr_FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_C_Autor] PRIMARY KEY CLUSTERED 
(
	[Atr_AutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[C_Autor] ADD  CONSTRAINT [DF_C_Autor_Atr_FechaCreacion]  DEFAULT (getdate()) FOR [Atr_FechaCreacion]
GO

ALTER TABLE [dbo].[C_Autor] ADD  CONSTRAINT [DF_C_Autor_Atr_FechaModificacion]  DEFAULT (getdate()) FOR [Atr_FechaModificacion]
GO

ALTER TABLE [dbo].[C_Autor]  WITH CHECK ADD  CONSTRAINT [CK_C_Autor_NoBlank] CHECK  ((ltrim(rtrim([Atr_Nombre]))<>'' AND [Atr_Nombre]=upper([Atr_Nombre]) AND NOT [Atr_Nombre] like ' %' AND NOT [Atr_Nombre] like '% '))
GO

ALTER TABLE [dbo].[C_Autor] CHECK CONSTRAINT [CK_C_Autor_NoBlank]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'No permite espacios en blanco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'C_Autor', @level2type=N'CONSTRAINT',@level2name=N'CK_C_Autor_NoBlank'
GO


