<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.Commande" %>
<% List<Commande> listeCommandeNonPayes = (List<Commande>) request.getAttribute("listeCommandeNonPayes"); %>
<% List<Double> listePaiementCommande = (List<Double>) request.getAttribute("listePaiementCommande"); %>
<html>
    <head>
        <title>Liste des commandes non payés</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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

        <div class="container" style="margin-top : 5vh;">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Listes des commandes non clos</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Numero table</th>
                                <th scope="col">Montant du commande</th>
                                <th scope="col">Montant payés</th>
                                <th scope="col">Ajout de commande</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listeCommandeNonPayes.size(); i++) {%>
                            <tr>
                                <td>
                                    <%=listeCommandeNonPayes.get(i).getIdCommande()%>
                                </td>
                                <td>
                                    <%=listeCommandeNonPayes.get(i).getPrixTotal()%>
                                </td>
                                <td>
                                    <%=listePaiementCommande.get(i)%>
                                </td>
                                <td>
                                    <a href="ModifierCommande?idCommande=<%=listeCommandeNonPayes.get(i).getIdCommande() %>" class="btn btn-primary" > Ajouter des plats </a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </body>
</html>
