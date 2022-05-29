<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.DetailCommande" %>
<%@page import="modele.Commande" %>
<% List<DetailCommande> detailsCommande = (List<DetailCommande>)request.getAttribute("detailsCommande"); %>
<% Commande commande = (Commande)request.getAttribute("commande"); %>
<html>
    <head>
         <title>Liste des plats commandés</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <br>

        <h1>LListe des plats commandés</h1>
        <form method="post" action="Ajout.jsp">

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Produit</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                   <% for (int i = 0; i < detailsCommande.size(); i++) {%>
                    <tr>
                        <th>
                            <%=detailsCommande.get(i).getProduit().getIntitule() %>
                        </th>
                        <td>
                            <a href="PayerPlat?idDetailCommande=<%=detailsCommande.get(i).getIdDetailCommande() %>&idCommande=<%=commande.getIdCommande() %>" class="btn btn-primary">
                                Payer
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </form>
    </body>
</html>
