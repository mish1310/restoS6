<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<% List<Object[]> recetteProduit = (List<Object[]>) request.getAttribute("recetteProduit"); %>
<% Produit produit = (Produit) request.getAttribute("produit");%>
<% List<Produit> ingredients = (List<Produit>)request.getAttribute("ingredients"); %>
<html>
    <head>
        <title>Recette - <%=produit.getIntitule()%> </title>
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
                    <h1>Recette de : <%=produit.getIntitule()%></h1>
                </div>
            </div>
            <div class="row" style="margin-top: 5vh;">
                <div class="col-12">
                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Nom</th>
                                <th scope="col">Quantite</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < recetteProduit.size(); i++) {
                                    Produit recette = (Produit) (recetteProduit.get(i)[0]);
                                    Double quantite = (Double) (recetteProduit.get(i)[1]);
                            %>
                            <tr>
                                <td> <%=recette.getIntitule()%> </td>
                                <td> 
                                    <form method="post" action="ModifierRecette?produitConstituant=<%=recette.getIdProduit()%>&produitConstitue=<%=produit.getIdProduit()%>">
                                        <input type="number" name="quantite" id="quantite" value="<%=quantite%>" required >
                                        <input type="text" name="unite" id="unite" value="<%=recette.getUnite()%>" disabled style="width: 5vw;" >
                                        <button type="submit" class="btn btn-warning" >Modifier</button>
                                    </form>
                                </td>
                                <td> <a href="ModifierRecette?supprimer=<%=recette.getIdProduit()%>&idProduit=<%=produit.getIdProduit()%>" class="btn btn-danger form-control" >Supprimer</a> </td>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="3" >
                                    <form method="post" action="ModifierRecette?idProduit=<%=produit.getIdProduit()%>">
                                        <div class="row">
                                            <div class="col-4">
                                                <select name="ingredient" id="ingredient" class="form-control">
                                                    <% for(Produit ingredient: ingredients)  { %>
                                                    <option value="<%=ingredient.getIdProduit() %>" ><%=ingredient.getIntitule() %></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="col-4">
                                                <label for="quantite">Quantite : </label>
                                                <input type="number" name="quantite" id="quantite">
                                            </div>
                                            <div class="col-4">
                                                <button type="submit" class="btn btn-primary form-control" >Ajouter</button>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
