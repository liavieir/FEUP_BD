.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Número de imóveis:'
.print ''

SELECT count(idImovel) AS NumImoveis
FROM Imovel;

.print ''
.print 'Adicionando um imóvel'
.print ''

INSERT INTO Imovel(Referencia, Dimensao, Preco) values (12345, 200, 200000);

.print ''
.print 'Número atual de imóveis (como se pode verificar, o imóvel foi adicionado):'
.print ''

SELECT count(idImovel) AS NumImoveis
FROM Imovel;

.print ''
.print 'Tentado associar o imóvel a um proprietario cujo capital excede o valor limite'
.print ''

INSERT INTO PropImovel values (267,101);

.print ''
.print 'Número atual de imóveis (como se pode verificar, o imóvel foi eliminado):'
.print ''

SELECT count(idImovel) AS NumImoveis
FROM Imovel;
