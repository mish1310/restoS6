<%-- 
    Document   : formulaireCommande
    Created on : 24 mai 2022, 09:41:37
    Author     : Manda
--%>
<%@page import="modele.Categorie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Categorie> categories = (List<Categorie>)request.getAttribute("categories"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulaire de commande</title>
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid" style="margin-left: 10vw;">
                <a class="navbar-brand" href="AccueilCaisse">Administrateur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="Inventaire">Inventaire</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="ListeProduit">Liste des produit vendables</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="InsererProduit">Insertion de produit</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="GererStock">Gestion de stock</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="StatAchat">Statistique d'achat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="StatVente">Statistique de vente</a>
                        </li>
                    </ul>
                </div>
                <div class="" style="float: right;" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top: 5vh;">

            <div class="row">
                <div class="col-12 text-center">
                    <h1>Inserer un produit</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <form action="InsererProduit" class="jumbotron" method="POST">
                        <div class="form-group">
                            <label for="intitule">Nom du produit : </label>
                            <input type="text" name="intitule" id="intitule" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="prixUnitaire">Prix unitaire : </label>
                            <input type="number" name="prixUnitaire" id="prixUnitaire" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label for="categorie">Categorie : </label>
                            <select name="categorie" id="categorie" class="form-control">
                                <% for(Categorie categorie: categories) { %>
                                <option value="<%=categorie.getIdCategorie() %>"><%=categorie.getNomCategorie() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="unite">Consistence : </label>
                            <select name="unite" id="unite" class="form-control">
                                <option value="" selected></option>
                                <option value="g">Solide</option>
                                <option value="ml">Liquide</option>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <button  class="btn btn-primary form-control" style="float: right;">Insérer le produit</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </body>
</html>
