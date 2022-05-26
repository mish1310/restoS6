<%-- 
    Document   : resultatSuggestionVente
    Created on : 24 mars 2022, 16:42:19
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modele.Produit"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List changement = new ArrayList(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Changement</h1>
        <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Nom produit</th>
                        <th scope="col">Pourcentage de changement</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(int i = 0; i < changement.size(); i++) { 
                        Object [] ligne = (Object[])changement.get(i);
                        Produit p = (Produit)ligne[0];
                    %>
                    <tr>
                        <th scope="row">
                            <%=p.getIntitule() %>
                        </th>
                        <td name="row">
                            <%=ligne[1] %>
                        </td>
                    </tr>
                    <%}%>
                  
                </tbody>
            </table>
    </body>
</html>
