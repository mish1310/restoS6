<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<% List<Produit> listeProduit = (List<Produit>) request.getAttribute("listeProduit"); %>
<html>
    <head>
        <title>Resultat de la recherche</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                               href="PageFormulaireInserionCommande">Modification de commande</a>
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

        <div class="container" style="margin-top: 5vh;">
            <div class="row ">
                <div class="col-12 text-center">
                    <h1>Listes des Produits</h1>
                </div>
            </div>
            <div class="row" style="margin-top: 5vh;">
                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th scope="col">Nom</th>
                            <th scope="col">Prix Unitaire</th>
                            <th scope="col">Categorie</th>
                            <th scope="col">Prix de revient</th>
                            <th scope="col">Recette</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < listeProduit.size(); i++) {%>
                        <tr>
                            <th scope="row">
                                <% out.println(listeProduit.get(i).getIntitule());%>
                            </th>
                            <td name="nom">
                                <% out.println(listeProduit.get(i).getPrixUnitaire());%>
                            </td>
                            <td name="categorie">
                                <% out.println(listeProduit.get(i).getCategorie().getNomCategorie());%>
                            </td>
                            <td name="prixRevenu">
                                <a href="PrixRevenuProduit?idProduit=<%=listeProduit.get(i).getIdProduit()%>" class="btn btn-primary">
                                    Prix de revient
                                </a>
                            </td>
                            <td name="recette">
                                <a href="RecetteProduit?idProduit=<%=listeProduit.get(i).getIdProduit()%>" class="btn btn-primary">
                                    Voir la recette
                                </a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
