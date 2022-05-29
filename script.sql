alter table produit add column unite varchar(10);

update produit set unite='g' WHERE idProduit=6;
update produit set unite='g' WHERE idProduit=7;
update produit set unite='g' WHERE idProduit=8;
update produit set unite='g' WHERE idProduit=9;
update produit set unite='g' WHERE idProduit=10;
update produit set unite='g' WHERE idProduit=12;
update produit set unite='g' WHERE idProduit=13;
update produit set unite='g' WHERE idProduit=14;
update produit set unite='ml' WHERE idProduit=11;

alter table detailsCommande add column dateCommande DATE;


CREATE TABLE etat (
	idEtat SERIAL PRIMARY KEY,
	nomEtat VARCHAR(20)
);

INSERT INTO etat (nomEtat) VALUES('Fini');
INSERT INTO etat (nomEtat) VALUES('Livre');
INSERT INTO etat (nomEtat) VALUES('Paye');

CREATE TABLE etatPlat (
	idEtat SMALLINT,
	idDetailsCommande INT,
	FOREIGN KEY (idEtat) REFERENCES etat(idEtat),
	FOREIGN KEY (idDetailsCommande) REFERENCES detailsCommande(idDetailsCommande)
);

INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 1);
INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 2);
INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 3);
INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 4);
INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 5);
INSERT INTO etatPlat (idEtat, idDetailsCommande) VALUES(1, 6);

CREATE VIEW platFabrique AS(SELECT dc.idDetailsCommande, dc.idProduit, dc.idCommande, dc.prixUnitaire, dc.idServeur, dc.dateCommande FROM etatPlat ep JOIN detailsCommande dc on ep.idDetailsCommande=dc.idDetailsCommande WHERE idEtat=1);

UPDATE detailsCommande set dateCommande='2022-03-11' WHERE idDetailsCommande=6;
UPDATE detailsCommande set dateCommande='2022-03-11' WHERE idDetailsCommande=5;
UPDATE detailsCommande set dateCommande='2022-03-11' WHERE idDetailsCommande=4;
UPDATE detailsCommande set dateCommande='2022-03-11' WHERE idDetailsCommande=3;

ALTER TABLE stock ADD COLUMN quantite INT;

CREATE TABLE stockSortant (
	idStock INT,
	quantiteSortant INT,
	dateSortie DATE,
	FOREIGN KEY(idStock) REFERENCES stock(idStock)
);

CREATE VIEW stockSortieGroupe AS (SELECT idStock, SUM(quantiteSortant) as quantiteSortant FROM stockSortant GROUP BY idStock);
CREATE VIEW resteStock AS (SELECT s.idStock, s.quantite - ssg.quantiteSortant as quantiteRestant from stock s JOIN stockSortieGroupe ssg on s.idStock=ssg.idStock);

CREATE TABLE inventaire (
	idInventaire SERIAL PRIMARY KEY,
	dateInventaire DATE
);

CREATE TABLE detailsInventaire(
	idInventaire INT,
	idProduit SMALLINT,
	quantiteRestant INT,
	FOREIGN KEY(idInventaire) REFERENCES inventaire(idInventaire),
	FOREIGN KEY(idProduit) REFERENCES produit(idProduit)
);

UPDATE stock setQuantiteEntrant=10000 WHERE idStock=1;
UPDATE stock setQuantiteEntrant=10000 WHERE idStock=1;
 
alter table inventaire add column quantite int;

drop table inventaire;


CREATE TABLE inventaire (
	idInventaire SERIAL PRIMARY KEY,
	dateInventaire DATE,
	quantite INT,
	idProduit SMALLINT,
	FOREIGN KEY(idProduit) REFERENCES produit(idProduit)
);

DROP TABLE paiement;
CREATE TABLE paiement(
	idCommande INT ,
	idTypePaiement SMALLINT,
	montant FLOAT,
	datePaiement DATE,
	FOREIGN KEY(idCommande) REFERENCES commande(idCommande),
	FOREIGN KEY(idTypePaiement) REFERENCES typePaiement(idTypePaiement)
);

CREATE VIEW paiementCommande AS(
	SELECT SUM(montant) AS sommePayement, idCommande FROM paiement
	GROUP BY idCommande
);

CREATE VIEW commandeNonPaye AS(
	SELECT c.idCommande, c.dateCommande, c.prixTotal, c.idTable AS sommePayement FROM paiement p
	JOIN commande c ON p.idCommande = c.idCommande
	GROUP BY c.idCommande 
	HAVING SUM(montant) < prixTotal
);

UPDATE commande SET prixTotal = 7200 where idCommande=1;


CREATE TABLE profil(
	idProfil SERIAL PRIMARY KEY,
	nomProfil VARCHAR(20),
	motDePasse VARCHAR(50)
);

INSERT INTO profil(nomProfil, motDePasse) VALUES('admin', '1');
INSERT INTO profil(nomProfil, motDePasse) VALUES('serveur', '2');
INSERT INTO profil(nomProfil, motDePasse) VALUES('cuisiner', '3');
INSERT INTO profil(nomProfil, motDePasse) VALUES('caissier', '4');

UPDATE produit SET prixUnitaire=6000 WHERE idProduit=1;
UPDATE produit SET prixUnitaire=2000 WHERE idProduit=2;
UPDATE produit SET prixUnitaire=5000 WHERE idProduit=3;
UPDATE produit SET prixUnitaire=7000 WHERE idProduit=4;
UPDATE produit SET prixUnitaire=8000 WHERE idProduit=5;

UPDATE stock SET quantite = 50000 WHERE idStock=1;
UPDATE stock SET quantite = 10000 WHERE idStock=2;
UPDATE stock SET quantite = 5000 WHERE idStock=3;
UPDATE stock SET quantite = 3000 WHERE idStock=4;
UPDATE stock SET quantite = 10000 WHERE idStock=5;
UPDATE stock SET quantite = 2000 WHERE idStock=6;
UPDATE stock SET quantite = 5000 WHERE idStock=7;
UPDATE stock SET quantite = 1000 WHERE idStock=8;
UPDATE stock SET quantite = 1000 WHERE idStock=9;


UPDATE profil SET motdepasse='mdpprom13';
