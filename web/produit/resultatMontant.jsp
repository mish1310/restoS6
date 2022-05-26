<%-- 
    Document   : rechercheMontant
    Created on : 7 avr. 2022, 14:10:55
    Author     : P3B-1222
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HashMap<String, Double> paiements = (HashMap<String, Double>) request.getAttribute("paiements");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultat montant</title>
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="form-group row">
            <div class="form-group col-md-4">
            </div>
            <div class="form-group col-md-4 text-center">
                <% for (Map.Entry<String, Double> entry : paiements.entrySet()) {
                        String cle = entry.getKey();
                        Double valeur = entry.getValue();
                 %>
                <p> <%=cle %> : <%=valeur %> </p>
                <% } %>
            </div>
        </div>
        <div class="form-group row">
            <div class="form-group col-md-2">

            </div>
            <div class="form-group col-md-8">
                <% if (request.getAttribute("verif") != null) { %>

                <h3>Montant en espece:<% out.println(request.getAttribute("addition"));%></h3>
                <h3>Montant par cheque:<% out.println(request.getAttribute("addition"));%></h3>
                <%}%>
            </div>
        </div>
    </body>
</html>
