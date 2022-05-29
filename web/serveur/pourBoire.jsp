<%@page import="modele.Serveur"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<%
    List<Serveur> listeServeur = (List<Serveur>) request.getAttribute("listeServeur");
    //int g=Integer.valueOf(request.getParameter("verif"));
%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="form-group row">
            <div class="form-group col-md-4">

            </div>
            <div class="form-group col-md-4">


                <form method="post" action="VoirPouboire"> 
                    <h1><b>Pour boire serveur</b></h1>
                    <br>

                    <label for="inputBirth"><b>Serveure</b></label>
                    <select id="inputCategorie" class="form-control" name="categorie">
                        <%for (int i = 0; i < listeServeur.size(); i++) {%>
                        <option value="<%= listeServeur.get(i).getIdServeur()%>"><%out.println(listeServeur.get(i).getNom());%></option>
                        <%}%>

                    </select>

                    <label for="inputBirth"><b>Date1</b></label>
                    <input type="date" name="date1" >
                    <br>
                    <label for="inputBirth"><b>Date2</b></label>
                    <input type="date" name="date2" >

                    <button type="submit" class="btn btn-primary" 
                            name="affiche">Calculer</button>

                    <br>
                    <br>
                </form>     
                <% if (request.getAttribute("verif") != null) { %>
                <h3>Total pour Boire:<% out.println(request.getAttribute("pourBoire"));%></h3>
                <%}%>

            </div>

            <div class="form-group col-md-10">

                <br>


            </div>

        </div>
    </body>
</html>
