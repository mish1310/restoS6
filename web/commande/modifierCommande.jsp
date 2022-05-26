<%-- 
    Document   : modifierCommande
    Created on : 24 mai 2022, 11:43:53
    Author     : Manda
--%>

<%@page import="modele.DetailCommande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.Commande" %>
<%@page import="modele.Serveur"%>
<%@page import="modele.Produit"%>
<%@page import="java.util.List"%>
<% List<Serveur> listeServeur = (List<Serveur>) request.getAttribute("listeServeur"); %>
<% List<Produit> listeProduitVendable = (List<Produit>) request.getAttribute("listeProduitVendable"); %>
<% Commande commande = (Commande) request.getAttribute("commande");%>
<%
    List<DetailCommande> listeDetailCommandeAjout = null;
    try {
        listeDetailCommandeAjout = (List<DetailCommande>) session.getAttribute("listeDetailCommandeAjout");
    } catch (Exception ex) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modification de commande</title>
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="Accueil">Serveur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="VueCommandeNonPaye">Commandes en cours</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="VueProduitNonLivre">Livraison de produit</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top: 10vh;" >

            <form action="ModifierCommande" method="post">
                <div class="form-group">
                    <input type="text" name="commande" id="commande" value="<%=commande.getIdCommande()%>" style="display:none;">
                </div>
                <div class="form-group">
                    <label for="serveur">Serveur : </label>
                    <select id="serveur" class="form-control" name="serveur">
                        <% for (int i = 0; i < listeServeur.size(); i++) {%>
                        <option value="<%=listeServeur.get(i).getIdServeur()%>"><%=listeServeur.get(i).getNom()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group">
                    <input type="submit" value="Ajouter les nouveaux plats" class="btn btn-primary" >
                </div>
            </form>

            <form action="AjoutDetailCommandeModification" class="jumbotron" method="post">
                <div class="row">
                    <div class="col-8">
                        <div class="form-group">
                            <input type="text" name="commande" id="commande" value="<%=commande.getIdCommande()%>" style="display:none;">
                        </div>
                        <div class="form-group">
                            <label for="produit">Plat à commander : </label>
                            <select id="produit" class="form-control" name="produit">
                                <% for (int i = 0; i < listeProduitVendable.size(); i++) {%>
                                <option value="<%=listeProduitVendable.get(i).getIdProduit()%>"><%=listeProduitVendable.get(i).getIntitule()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="col-2">
                        <label for="quantite">Quantite : </label>
                        <input type="number" name="quantite" id="quantite" class="form-control" min="1" value="1">
                    </div>
                    <div class="col-2">
                        <label for=""></label>
                        <br>
                        <input type="submit" value="Ajouter" class="btn btn-primary">
                    </div>
                </div>
            </form>

            <div class="row" id="listeProduit">
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Plat</th>
                            <th>Prix unitaire</th>
                            <th>Enlever</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (listeDetailCommandeAjout != null) {
                                for (int i = 0; i < listeDetailCommandeAjout.size(); i++) {
                        %>
                        <tr>
                            <td><%=listeDetailCommandeAjout.get(i).getProduit().getIntitule()%></td>
                            <td><%=listeDetailCommandeAjout.get(i).getProduit().getPrixUnitaire()%></td>
                            <td>
                                <form action="SupprimerDetailCommandeModification" method="get">
                                    <input type="number" name="idProduit" id="idProduit" value="<%=listeDetailCommandeAjout.get(i).getProduit().getIdProduit()%>" style="display:none;">
                                    <input type="number" name="commande" id="commande" value="<%=commande.getIdCommande()%>" style="display:none;">
                                    <button type="submit" class="btn btn-danger">Supprimer</button>
                                </form>
                            </td>
                        </tr>
                        <% }
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
