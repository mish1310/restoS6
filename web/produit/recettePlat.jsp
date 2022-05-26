<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<% List<Object[]> recetteProduit = (List<Object[]>)request.getAttribute("recetteProduit"); %>
<% Produit produit = (Produit)request.getAttribute("produit"); %>
<html>
    <head>
        <title>Recette - <%=produit.getIntitule() %> </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>Recette de : <%=produit.getIntitule() %> </h1>
        <form method="post" action="Ajout.jsp">

            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Nom</th>
                        <th scope="col">Quantite</th>
                    </tr>
                </thead>
                <tbody>
                   <% for (int i = 0; i < recetteProduit.size(); i++) {
                       Produit recette = (Produit)(recetteProduit.get(i)[0]);
                       Double quantite = (Double)(recetteProduit.get(i)[1]);
                   %>
                    <tr>
                        <th>
                            <%=recette.getIntitule() %>
                        </th>
                        <td>
                            <%=quantite %> <%=recette.getUnite() %>
                        </td>
                    </tr>
                    <%}%>
                  
                </tbody>
            </table>
        </form>
        <!--<form action="envoi.jsp" method="post">   
            <button type="submit" class="btn btn-success">Envoyer</button>
        </form>-->
    </body>
</html>
