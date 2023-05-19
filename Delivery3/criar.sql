drop table if exists Apartamento;

drop table if exists Moradia;

drop table if exists Escritorio;

drop table if exists Armazem;

drop table if exists Garagem;

drop table if exists Terreno;

drop table if exists IndividuoProp;

drop table if exists BancoProp;

drop table if exists Anonimo;

drop table if exists Vendedor;

drop table if exists Visita;

drop table if exists PropImovel;

drop table if exists ImovelAgencia;

drop table if exists PropAnuncio;

drop table if exists Favorita;

drop table if exists Entrevista;

drop table if exists AgenciaImobiliaria;

drop table if exists Utilizador;

drop table if exists Anuncio;

drop table if exists Localizacao_Geral;

drop table if exists Localizacao_Exata;

drop table if exists Imovel;

drop table if exists Proprietario;

drop table if exists Visitante;

create table AgenciaImobiliaria(

					idAgenciaImobiliaria INTEGER,
					Contacto CHAR(9),
					Nome VARCHAR(255) NOT NULL, 
					Email VARCHAR(255),

					CONSTRAINT UNIQUE_AgenciaImobiliaria_Email UNIQUE (Email),
					CONSTRAINT UNIQUE_AgenciaImobiliaria_Contacto UNIQUE (Contacto),
					CONSTRAINT PK_AgenciaImobiliaria PRIMARY KEY (idAgenciaImobiliaria)
);

create table Localizacao_Geral(

					Freguesia VARCHAR(255), 
					Concelho VARCHAR(255) NOT NULL, 
					Zona VARCHAR(255) NOT NULL,

					CONSTRAINT PK_Localizacao_Geral PRIMARY KEY(Freguesia)
);

create table Localizacao_Exata(
					idLocalizacao INTEGER,
					Freguesia VARCHAR(255) NOT NULL, 
					Rua VARCHAR(255), 
					Numero INTEGER,

					CONSTRAINT PK_Localizacao_Exata PRIMARY KEY (idLocalizacao),
					CONSTRAINT FOREIGNKEY_Freguesia FOREIGN KEY (Freguesia) REFERENCES Localizacao_Geral(Freguesia) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Imovel(
					idImovel INTEGER,
					Referencia VARCHAR(5) NOT NULL, 
					Dimensao INT NOT NULL,  
					Preco INT NOT NULL, 
					Estado VARCHAR(15),
					TipoNegocio VARCHAR(255),
					idLocalizacao INTEGER,

					CONSTRAINT CHECK_Imovel_TipoNegocio CHECK (TipoNegocio = 'Arrendar' or TipoNegocio = 'Vender'),
					CONSTRAINT CHECK_Imovel_Estado CHECK(Estado = 'Nova construcao' or Estado = 'Bom estado' or Estado = 'Para recuperar'),
					CONSTRAINT PK_Imovel PRIMARY KEY (idImovel), 
					CONSTRAINT UNIQUE_Imovel_Referencia UNIQUE (Referencia),
					CONSTRAINT FOREIGNKEY_idLocalizacao FOREIGN KEY (idLocalizacao) REFERENCES Localizacao_Exata(idLocalizacao) ON DELETE CASCADE ON UPDATE CASCADE

);


create table Apartamento(

					idImovel INTEGER,
				    Tipo VARCHAR(12), 
				    Andar INT,
				    NumCasasBanho INTEGER, 
				    Tipologia VARCHAR(3) NOT NULL,

				    CONSTRAINT PK_Apartamento PRIMARY KEY (idImovel),
				    CONSTRAINT FOREIGNKEY_idApart FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE,
				    CONSTRAINT CHECK_Apartamento_Tipo CHECK(Tipo = 'penthouse' or Tipo = 'apartamento'or Tipo = 'duplex'),
				    CONSTRAINT CHECK_Apartamento_Tipologia CHECK(Tipologia = 'T0'or Tipologia = 'T1'or Tipologia = 'T2'or Tipologia = 'T3'or Tipologia = 'T4+')
);

	
create table Moradia(
					idImovel INTEGER,
					Tipo VARCHAR(9), 
					NumPisos INT,
					NumCasasBanho INT, 
					Tipologia VARCHAR(3) NOT NULL,

					CONSTRAINT CHECK_Moradia_Tipologia CHECK(Tipologia = 'T0'or Tipologia = 'T1'or Tipologia = 'T2'or Tipologia = 'T3'or Tipologia = 'T4+'),
					CONSTRAINT CHECK_Moradia_Tipo CHECK(Tipo = 'isoladas' or Tipo = 'geminadas' or Tipo = 'em banda'),
					CONSTRAINT FOREIGNKEY_idMoradia FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT PK_Moradia PRIMARY KEY (idImovel)
);

create table Escritorio(
					idImovel INTEGER,
 					Distribuicao VARCHAR(14),

 					CONSTRAINT CHECK_Escritorio_Distribuicao CHECK(Distribuicao = 'Indiferente'or Distribuicao = 'Open Space'or Distribuicao = 'Com divisorias'),
 					CONSTRAINT FOREIGNKEY_idEscritorio FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE,
 					CONSTRAINT PK_Escritorio PRIMARY KEY (idImovel)
 );

create table Armazem(
					idImovel INTEGER, 

					CONSTRAINT PK_Armazem PRIMARY KEY (idImovel), 
					CONSTRAINT FOREIGNKEY_idArmazem FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Garagem(
					idImovel INTEGER,
					Vigilancia BOOLEAN,

					CONSTRAINT PK_Garagem PRIMARY KEY (idImovel),
					CONSTRAINT FOREIGNKEY_idGaragem FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE
); 

create table Terreno(
					idImovel INTEGER,
					Tipo VARCHAR(12),

					CONSTRAINT PK_Terreno PRIMARY KEY (idImovel),
					CONSTRAINT FOREIGNKEY_idTerreno FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE, 
					CONSTRAINT CHECK_Terreno_Tipo CHECK(Tipo = 'Urbano' or Tipo = 'Urbanizavel' or Tipo = 'Nao Urbanizavel')
);

create table Proprietario(
					idProprietario INTEGER,
					Contacto CHAR(9),
					Nome VARCHAR(255) NOT NULL,
					Email VARCHAR(255),

					CONSTRAINT PK_Proprietario PRIMARY KEY (idProprietario),
					CONSTRAINT UNIQUE_Proprietario_Contacto UNIQUE (Contacto),
					CONSTRAINT UNIQUE_Proprietario_Email UNIQUE(Email)
);

create table IndividuoProp(
					idProprietario INTEGER,
					NIdentificacao INT NOT NULL,

					CONSTRAINT PK_IndividuoProp PRIMARY KEY (idProprietario),
					CONSTRAINT FOREIGNKEY_idIndividuoProp FOREIGN KEY (idProprietario) REFERENCES Proprietario(idProprietario) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT UNIQUE_IndividuoProp_NIdentificacao UNIQUE (NIdentificacao)
);

create table BancoProp(
					idProprietario INTEGER,
					ReferenciaBanco VARCHAR(25) NOT NULL,


					CONSTRAINT PK_BancoProp PRIMARY KEY (idProprietario),
					CONSTRAINT FOREIGNKEY_idBancoProp FOREIGN KEY (idProprietario) REFERENCES Proprietario(idProprietario) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT UNIQUE_BancoProp_ReferenciaBanco UNIQUE (ReferenciaBanco)
);

create table Visitante(
					idVisitante INTEGER,
					IP VARCHAR(15) NOT NULL,
 
					CONSTRAINT PK_Visitante PRIMARY KEY (idVisitante),
					CONSTRAINT UNIQUE_Visitante_IP UNIQUE (IP)
);

create table Utilizador(
					idVisitante INTEGER,
					Email VARCHAR(255) NOT NULL,
					Password VARCHAR(255) NOT NULL,
					Nome VARCHAR(255) NOT NULL,

					CONSTRAINT PK_Utilizador PRIMARY KEY (idVisitante),
					CONSTRAINT FOREIGNKEY_idVisitante FOREIGN KEY (idVisitante) REFERENCES Visitante(idVisitante) ON DELETE CASCADE ON UPDATE CASCADE, 
					CONSTRAINT UNIQUE_Utilizador_Email UNIQUE (Email)
);

create table Anonimo(
					idVisitante INTEGER,

					CONSTRAINT PK_Anonimo PRIMARY KEY (idVisitante),
					CONSTRAINT FOREIGNKEY_idAnonimo FOREIGN KEY (idVisitante) REFERENCES Visitante(idVisitante) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Anuncio(
					idAnuncio INTEGER,
					Data DATE NOT NULL,
					idImovel INTEGER,
					idAgenciaImobiliaria INTEGER,

					CONSTRAINT PK_Anuncio PRIMARY KEY (idAnuncio),
					CONSTRAINT FOREIGNKEY_Anuncio_idImovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_Anuncio_idAgenciaImobiliaria FOREIGN KEY (idAgenciaImobiliaria) REFERENCES AgenciaImobiliaria(idAgenciaImobiliaria) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Vendedor(
					idVendedor INTEGER,
					Nome VARCHAR(255) NOT NULL, 
					Email VARCHAR(255),
					idAgenciaImobiliaria INTEGER NOT NULL,
					Contacto CHAR(9),

					CONSTRAINT PK_Vendedor PRIMARY KEY (idVendedor),
					CONSTRAINT UNIQUE_Vendedor_Email UNIQUE (Email),
					CONSTRAINT FOREIGNKEY_Vendedor_idAgenciaImobiliaria FOREIGN KEY (idAgenciaImobiliaria) REFERENCES AgenciaImobiliaria(idAgenciaImobiliaria) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Visita(
					idAnuncio INTEGER,
					idVisitante INTEGER,
					Data DATE NOT NULL,
					Hora TIME NOT NULL, 

					CONSTRAINT PK_Visita_idAnuncio_idVisitante PRIMARY KEY (idVisitante, idAnuncio),
					CONSTRAINT FOREIGNKEY_Visita_idAnuncio FOREIGN KEY (idAnuncio) REFERENCES Anuncio(idAnuncio) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_Visita_idVisitante FOREIGN KEY (idVisitante) REFERENCES Visitante(idVisitante) ON DELETE CASCADE ON UPDATE CASCADE

); 

create table PropImovel(
					idProprietario INTEGER,
					idImovel INTEGER,

					CONSTRAINT PK_PropImovel_idProp_idImovel PRIMARY KEY (idProprietario, idImovel),
					CONSTRAINT FOREIGNKEY_PropImovel_idProp FOREIGN KEY (idProprietario) REFERENCES Proprietario(idProprietario) ON DELETE CASCADE ON UPDATE CASCADE, 
					CONSTRAINT FOREIGNKEY_PropImovel_idImov FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE
);

create table ImovelAgencia(
					idImovel INTEGER,
					idAgenciaImobiliaria INTEGER,

					CONSTRAINT PK_ImovelAgencia_idImovel_idAgenciaImobiliaria PRIMARY KEY(idImovel, idAgenciaImobiliaria),
					CONSTRAINT FOREIGNKEY_ImovelAgencia_idImovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE, 
					CONSTRAINT FOREIGNKEY_ImovelAgencia_idAgenciaImobiliaria FOREIGN KEY (idAgenciaImobiliaria) REFERENCES AgenciaImobiliaria(idAgenciaImobiliaria) ON DELETE CASCADE ON UPDATE CASCADE
					
);

create table PropAnuncio(
					idProprietario INTEGER,
					idAnuncio INTEGER,

					CONSTRAINT PK_PropAnuncio_idImovel_idAnuncio PRIMARY KEY(idProprietario, idAnuncio),
					CONSTRAINT FOREIGNKEY_PropAnun_idProp FOREIGN KEY (idProprietario) REFERENCES Proprietario(idProprietario) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_PropAnun_idAnuncio FOREIGN KEY (idAnuncio) REFERENCES Anuncio(idAnuncio) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Favorita(
					idAnuncio INTEGER,
					idVisitante INTEGER,

					CONSTRAINT PK_Favorita_idAnuncio_idVisitante PRIMARY KEY (idAnuncio, idVisitante),
					CONSTRAINT FOREIGNKEY_Favorita_idAnuncio FOREIGN KEY (idAnuncio) REFERENCES Anuncio(idAnuncio) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_Favorita_idVisitante FOREIGN KEY (idVisitante) REFERENCES Utilizador(idVisitante) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Entrevista(
					idVisitante INTEGER,
					idImovel INTEGER,
					idAgenciaImobiliaria INTEGER,
					Data DATE NOT NULL,
					Hora TIME NOT NULL,

					CONSTRAINT PK_Entrevista_idVisitante_idImovel PRIMARY KEY(idVisitante, idImovel),
					CONSTRAINT FOREIGNKEY_Entrevista_idVisitante FOREIGN KEY (idVisitante) REFERENCES Utilizador(idVisitante) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_Entrevista_idImovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel) ON DELETE CASCADE ON UPDATE CASCADE,
					CONSTRAINT FOREIGNKEY_Entrevista_idAgenciaImobiliaria FOREIGN KEY (idAgenciaImobiliaria) REFERENCES AgenciaImobiliaria(idAgenciaImobiliaria) ON DELETE CASCADE ON UPDATE CASCADE
);