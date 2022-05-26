<%-- 
    Document   : rechercheMontant
    Created on : 7 avr. 2022, 14:10:55
    Author     : P3B-1222
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="form-group row">
            <div class="form-group col-md-4">
            </div>
            <div class="form-group col-md-8">
                <form method="POST" action="RecupererMontant"> 
                    <h1><b>Recherche Montant</b></h1>
                    <br>
                    <label for="inputBirth"><b>Date1</b></label>
                    <input type="date" name="date1">
                    <label for="inputBirth"><b>Date2</b></label>
                    <input type="date" name="date2">
                    <button type="submit" class="btn btn-primary" value="1" name="produits">rechercher</button>
                </form>
                <br>
                <br>
            </div>
        </div>
        <div class="form-group row">
            <div class="form-group col-md-4">

            </div>
            <div class="form-group col-md-4">
                <% if (request.getAttribute("verif") != null) {
                        HashMap<String, Double> paiements = (HashMap<String, Double>) request.getAttribute("paiements");

                %>
                <div class="form-group col-md-4 text-center">
                    <% for (Map.Entry<String, Double> entry : paiements.entrySet()) {
                            String cle = entry.getKey();
                            Double valeur = entry.getValue();
                    %>
                    <p> <strong style="font-weight: 700; "> <%=cle%> </strong> : <%=valeur%> </p>
                    <% } %>
                </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
