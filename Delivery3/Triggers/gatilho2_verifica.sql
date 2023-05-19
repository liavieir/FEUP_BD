.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Numero total de bancos proprietários:'
.print ''

SELECT count(*) AS NumBancos
FROM BancoProp;

.print ''
.print 'Tentado adicionar ao BancoProp um proprietário que já foi identificado como indivíduo:'
.print ''

INSERT INTO BancoProp VALUES (11, 'ReferenciaBancoXX');

.print ''

.print ''
.print 'Numero total de bancos proprietários (como se pode verificar, o proprietário nao foi adicionado):'
.print ''

SELECT count(*) AS NumBancos
FROM BancoProp;

.print ''
.print 'Tentado adicionar ao BancoProp um proprietário que ainda não foi identificado:'
.print ''

INSERT INTO Proprietario(Contacto, Nome, Email) VALUES (915956590, 'Banco Lia', 'bancodalia@gmail.com');
INSERT INTO BancoProp VALUES(311, 'LIA123');

.print ''
.print 'Numero total de bancos proprietários (como se pode verificar, o proprietário foi adicionado):'
.print ''

SELECT count(*)
FROM BancoProp;


.print ''
.print 'Numero total de individuos proprietários:'
.print ''

SELECT count(*)
FROM IndividuoProp;

.print ''
.print 'Tentado adicionar ao IndividuoProp um proprietário que já foi identificado como banco:'
.print ''

INSERT INTO IndividuoProp VALUES (10, '23456789');

.print ''
.print 'Numero total de individuos proprietários (como se pode verificar, o proprietário nao foi adicionado):'
.print ''

SELECT count(*) AS NumIndividuos
FROM IndividuoProp;

.print ''
.print 'Tentado adicionar ao IndividuoProp um proprietário que ainda não foi identificado:'
.print ''

INSERT INTO Proprietario(Contacto, Nome, Email) VALUES (915956545, 'Rui Meireles', 'ruimeireles@gmail.com');
INSERT INTO IndividuoProp VALUES(312, '24256798');

.print ''
.print 'Numero total de individuos proprietários (como se pode verificar, o proprietário foi adicionado):'
.print ''

SELECT count(*) AS NumIndividuos
FROM IndividuoProp;