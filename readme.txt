view faite dans la representation des statistiques:
	create view statVenteProduit
	 as select d.idProduit,sum(d.quantite) as quantiteProduit,d.prixUnitaire,(sum(d.quantite)*d.prixUnitaire) as prixTotal,
	 p.intitule,d.dateCommande,nomEtat,d.idDetailsCommande,e.idEtat
	 from detailsCommande d join etatPlat e on d.idDetailsCommande=e.idDetailsCommande
	 join etat et on e.idetat=et.idetat
	 join produit p on d.idProduit=p.idProduit where et.idetat=3 group by d.idProduit,p.intitule,d.dateCommande,nometat,d.idDetailsCommande,e.idEtat;

	statistique achat:
	create view statAchatProduit as
	select sum(prixUnitaire*quantite) montantTotal, extract(year from dateStock) as annee,extract(month from dateStock) as mois
	from stock group by extract(year from dateStock),extract(month from dateStock);

requete statVenteProduit:
	select sum(prixTotal) as montantTotal , extract(month from dateCommande) as mois,extract(year from dateCommande) as annee 
	from statVenteProduit group by extract(month from dateCommande) ,extract(year from dateCommande);


	