<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<% List<Object[]> ingredientsUtilises = (List<Object[]>) request.getAttribute("ingredientsUtilises"); %>
<% double sommePrixIngredients = (double) request.getAttribute("sommePrixIngredients"); %>
<html>
    <head>
        <title>Liste des commandes non payés</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <br>

        <h1>Listes des commandes non payés</h1>
        <form method="post" action="Ajout.jsp">

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Produit</th>
                        <th scope="col">Quantite utilise</th>
                        <th scope="col">Prix de l'ingredient utilisé</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < ingredientsUtilises.size(); i++) {
                            Produit produit = (Produit) ingredientsUtilises.get(i)[0];
                            double quantite = (double) ingredientsUtilises.get(i)[1];
                            double prixIngredient = (double) ingredientsUtilises.get(i)[2];
                    %>
                    <tr>
                        <td>
                            <%=produit.getIntitule()%>
                        </td>
                        <td>
                            <%=quantite%> <%=produit.getUnite()%>
                        </td>
                        <td>
                            <%=prixIngredient%> Ar
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <div class="col-12 text-center">
                <h3>Somme prix ingredients = <%=sommePrixIngredients%> Ar</h3>
            </div>
        </form>
    </body>
</html>
