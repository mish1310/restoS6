<%-- 
    Document   : Addition.jsp
    Created on : 31 mars 2022, 13:45:04
    Author     : P3B-1222
--%>
<%@page import="modele.DetailCommande"%>
<%@page import="modele.Table"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Produit" %>
<%
    List<Table> listeTable = (List<Table>) request.getAttribute("listeTable");
    List<DetailCommande> listePlat = (List<DetailCommande>) request.getAttribute("listePlat");
    //int g=Integer.valueOf(request.getParameter("verif"));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="form-group row">
            <div class="form-group col-md-4">

            </div>
            <div class="form-group col-md-4">


                <form method="post" action="VoirAdditionTable"> 
                    <h1><b>Addition</b></h1>
                    <br>

                    <label for="inputBirth"><b>Table</b></label>
                    <select id="inputCategorie" class="form-control" name="table">
                        <%for (int i = 0; i < listeTable.size(); i++) {%>
                        <option value="<%= listeTable.get(i).getIdTable()%>"><%out.println(listeTable.get(i).getNumero());%></option>
                        <%}%>

                    </select>



                    <button type="submit" class="btn btn-success" 
                            name="affiche">Afficher</button>

                    <br>
                    <br>
                </form>    
            </div>
        </div>
        <div class="form-group row">
            <div class="form-group col-md-2">

            </div>
            <div class="form-group col-md-8">
                <% if (request.getAttribute("verif") != null) { %>
                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th scope="col">IdProduit</th>
                            <th scope="col">Nom Produit</th>
                            <th scope="col">Quantite</th>
                            <th scope="col">Prix Unitaire</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < listePlat.size(); i++) {%>
                        <tr>
                            <th scope="row">
                                <%out.println(listePlat.get(i).getProduit().getIdProduit());%>
                            </th>
                            <td name="nom">
                                <%out.println(listePlat.get(i).getProduit().getIntitule());%>
                            </td>
                            <td name="categorie">
                                <% out.println(listePlat.get(i).getQuantite());%>
                            </td>
                            <td name="categorie">
                                <% out.println(listePlat.get(i).getPrixUnitaire());%>
                            </td>
                            <td name="prixRevenu">
                                <a href="PrixRevenuProduit?idProduit=<%=listePlat.get(i).getProduit().getIdProduit()%>" class="btn btn-primary">
                                    Details
                                </a>
                            </td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>
                <br>
                <br>
                <br>
                <h3>Addition total:<% out.println(request.getAttribute("addition"));%></h3>

                <%}%>
            </div>
        </div>




    </body>
</html>
