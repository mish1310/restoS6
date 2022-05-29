<%-- 
    Document   : resultatSuggestionVente
    Created on : 24 mars 2022, 16:42:19
    Author     : User
--%>

<%@page import="modele.Inventaire"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Inventaire inventaire = (Inventaire)request.getAttribute("inventaire"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Changement</h1>
        <p>Quantite restante du produit : <%=inventaire.getQuantiteEnStock() %></p>
    </body>
</html>
