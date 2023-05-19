.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Entrevistas marcadas para o dia 2015-10-09 para o imóvel de id 90:'
.print ''

CREATE VIEW HorarioEntrevista AS
SELECT idImovel, Data, Hora
FROM Entrevista
WHERE idImovel = 90 AND Data = '2015-10-09'
ORDER BY Hora;

SELECT * 
FROM HorarioEntrevista;

.print ''
.print 'Tentado adicionar uma entrevista às 07:00:'
.print ''

INSERT INTO Entrevista VALUES (100, 90, 3, '2015-10-09', '07:00:00');

.print ''
.print ''

.print ''
.print 'Entrevistas marcadas para o dia 2015-10-09 para o imóvel de id 90 (como se pode verificar, a entrevista nao foi adicionada):'
.print ''

SELECT * 
FROM HorarioEntrevista;

.print ''
.print 'Tentado adicionar uma entrevista às 07:30:00'
.print ''

INSERT INTO Entrevista VALUES (100, 90, 3, '2015-10-09', '07:30:00');

.print ''
.print 'Entrevistas marcadas para o dia 2015-10-09 para o imóvel de id 90 (como se pode verificar, a entrevista foi adicionada):'
.print ''

SELECT * 
FROM HorarioEntrevista;
