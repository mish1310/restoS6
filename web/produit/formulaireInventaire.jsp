
<%@page import="modele.Produit"%>
<%@page import="java.util.List"%>
<% List<Produit> listeProduit = (List<Produit>) request.getAttribute("listeProduit"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <title>Formulaire d'inventaire</title>
    </head>
    <body>
        <div class="col-12 text-center" >
            <h1> Formulaire d'inventaire </h1>
        </div>
        <form method="POST" action="FaireInventaire">
            <div class="form-group row">
                <div class="form-group row col-md-4"></div>
                <div class="form-group row col-md-4">
                    <label for="idProduit" >Selection du produit : </label>
                    <select name="idProduit" id="idProduit" class="form-control" >
                        <% for (int i = 0; i < listeProduit.size(); i++) {%>
                        <option value="<%=listeProduit.get(i).getIdProduit()%>" ><%=listeProduit.get(i).getIntitule()%></option>
                        <% }%>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-4"></div>
                <div class="form-group row col-md-4">
                    <label for="dateInventaire" >Selection de la date : </label>
                    <input type="date" name="dateInventaire"  class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-4"></div>
                <div class="form-group row col-md-4">
                    <input type="submit" class="form-control btn btn-primary" value="Faire l'inventaire" >
                </div>
            </div>
            <br>
        </form>
    </body>
</html>
