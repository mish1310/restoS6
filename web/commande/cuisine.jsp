<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.DetailCommande" %>
<% List<DetailCommande> platAFaire = (List<DetailCommande>)request.getAttribute("platAFaire"); %>
<html>
    <head>
         <title>Liste des commandes non finis</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <br>

        <h1>Listes des commandes non finis</h1>
        <form method="post" action="Ajout.jsp">

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Produit</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                   <% for (int i = 0; i < platAFaire.size(); i++) {%>
                    <tr>
                        <th>
                            <%=platAFaire.get(i).getProduit().getIntitule() %>
                        </th>
                        <td>
                            <a href="PreparerPlat?idDetailCommande=<%=platAFaire.get(i).getIdDetailCommande() %>" class="btn btn-primary">
                                Preparer le plât
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </form>
    </body>
</html>
