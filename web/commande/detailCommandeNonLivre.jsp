<%-- 
    Document   : formulaireCommande
    Created on : 24 mai 2022, 09:41:37
    Author     : Manda
--%>
<%@page import="modele.Serveur"%>
<%@page import="modele.Produit"%>
<%@page import="modele.Table"%>
<%@page import="modele.DetailCommande"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<DetailCommande> detailCommandeNonLivre = null;
    try {
        detailCommandeNonLivre = (List<DetailCommande>) request.getAttribute("listeDetailCommandeNonLivre");
    } catch (Exception ex) {
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produits non livrés</title>
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="Accueil">Serveur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="VueCommandeNonPaye">Modification de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="VueProduitNonLivre">Livraison de produit</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top: 5vh;">

            <div class="row">
                <div class="col-12 text-center">
                    <h1>Liste des plats à livrer</h1>
                </div>
            </div>

            <div class="row" id="listeProduit">
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Plat</th>
                            <th>Table</th>
                            <th>Livrer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (detailCommandeNonLivre != null) {
                                for (int i = 0; i < detailCommandeNonLivre.size(); i++) {
                        %>
                        <tr>
                            <td><%=detailCommandeNonLivre.get(i).getProduit().getIntitule()%></td>
                            <td>Numero de table</td>
                            <td>
                                <form action="LivrerDetailCommande" method="get">
                                    <input type="number" name="detailCommande" id="detailCommande" value="<%=detailCommandeNonLivre.get(i).getIdDetailCommande() %>" style="display:none;">
                                    <button type="submit" class="btn btn-primary">Livrer</button>
                                </form>
                            </td>
                        </tr>
                        <% }
                            }%>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
