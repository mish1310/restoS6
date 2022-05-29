<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<%@page import="modele.Categorie" %>
<% List<Produit> listeProduit = (List<Produit>) request.getAttribute("listeProduit"); %>
<% List<Categorie> categories = (List<Categorie>) request.getAttribute("categories"); %>
<html>
    <head>
        <title>Resultat de la recherche</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid" style="margin-left: 10vw;">
                <a class="navbar-brand" href="AccueilCaisse">Administrateur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="Inventaire">Inventaire</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="ListeProduit">Liste des produit vendables</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="InsererProduit">Insertion de produit</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="GererStock">Gestion de stock</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="StatAchat">Statistique d'achat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="StatVente">Statistique de vente</a>
                        </li>
                    </ul>
                </div>
                <div class="" style="float: right;" id="">
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
                
                <div class="col-3">
                    <div class="col-12 text-center">
                        <h3>Filtre</h3>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <hr class="my-3">
                            <div>
                                <div class="form-group">
                                    <form method="GET" action="ListeProduit" >
                                        <label for="categorie">Categorie : </label>
                                        <select name="categorie" id="categorie" class="form-control" >
                                            <option value="0">Tout</option>
                                            <% for (Categorie categorie : categories) {%>
                                            <option value="<%=categorie.getIdCategorie()%>"><%=categorie.getNomCategorie()%></option>
                                            <% }%>
                                        </select>
                                        <br>
                                        <div class="form-group">
                                            <input type="submit" value="Rechercher" class="btn btn-primary form-control" onclick="rechercherInventaire()" >
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <hr class="my-3">
                        </div>
                    </div>
                    <hr class="my-3">
                    <div class="col-12 text-center">
                        <h3>Cadrage de prix</h3>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <hr class="my-3">
                            <div>
                                <div class="form-group">
                                    <form method="GET" action="SuggestionPrixVente" >
                                        <div class="form-group">
                                            <label for="montantSup">Prix max : </label>
                                            <input type="number" class="form-control" name="montantSup" value="-1" placeholder="price max">
                                        </div>
                                        <div class="form-group">
                                            <label for="montantInf">Prix min : </label>
                                            <input type="number" class="form-control" name="montantInf" value="-1" placeholder="price min">
                                        </div>
                                        <div class="form-group">
                                            <label for="pourcentageSuggestion"><b>Pourcentage</b></label>
                                            <input type="number" class="form-control" name="pourcentageSuggestion" placeholder="%">
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <button class="btn btn-primary form-control" name="idCommande">Cadrer les prix</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <hr class="my-3">
                        </div>
                    </div>
                </div>
                                        
                <div class="col-9">
                    <table class="table table-striped ">
                        <thead class="table-dark">
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
                                <td>
                                    <% out.println(listeProduit.get(i).getIntitule());%>
                                </td>
                                <td class="text-right" >
                                    <% out.println(listeProduit.get(i).getPrixUnitaire());%>
                                </td>
                                <td>
                                    <% out.println(listeProduit.get(i).getCategorie().getNomCategorie());%>
                                </td>
                                <td>
                                    <a href="PrixRevenuProduit?idProduit=<%=listeProduit.get(i).getIdProduit()%>" class="btn btn-primary">
                                        Prix de revient
                                    </a>
                                </td>
                                <td>
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
        </div>

    </body>
</html>
