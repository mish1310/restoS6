<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.List" %>
<%@page import="modele.Categorie" %>
<% List<Categorie> listeCategorie = (List<Categorie>) request.getAttribute("listeCategorie");
%>
<html>

    <head>
        <title>Liste des produits</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
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
                               href="PageFormulaireInserionCommande">Modification de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="VueProduitNonLivre">Livraison de produit</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="statistique/index.jsp">Statistiques</a>
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
                    <h1><b>Recherche produit(s)</b></h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form method="post" action="ListeProduit">
                        <br>
                        <div class="form-group">
                            <label for="inputCategorie"><b>Categorie</b></label>
                            <select id="inputCategorie" class="form-control" name="idCategorie">
                                <option value="tout">Tout</option>
                                <% for (int i = 0; i < listeCategorie.size(); i++) { %>
                                <option value="<%out.print(listeCategorie.get(i).getIdCategorie());%>">
                                    <%out.print(listeCategorie.get(i).getNomCategorie());%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" class="form-control" name="rechercheVal">
                                Afficher
                            </button>
                        </div>
                    </form>
                </div>
                <div class="form-group col-md-10"> </div>
            </div>
        </div>
    </body>
</html>