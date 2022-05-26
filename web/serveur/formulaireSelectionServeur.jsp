<%@page import="modele.Serveur"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% List<Serveur> listeServeur = (List<Serveur>) request.getAttribute("listeServeur"); %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="Accueil">Gestion de restaurant</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="PageFormulaireInsertionCommande">Insertion de commande</a>
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
        <div class="form-group row">
            <div class="form-group col-md-4">

            </div>
            <div class="form-group col-md-4">


                <form method="POST" action="PageFormulaireInsertionProduit"> 
                    <h1><b>Commande</b></h1>
                    <br>

                    <label for="inputBirth"><b>Serveur</b></label>
                    <select id="inputCategorie" class="form-control" name="serveure">
                        <% for (int i = 0; i < listeServeur.size(); i++) { %>
                        <option value="<%=listeServeur.get(i).getIdServeur() %>"><%=listeServeur.get(i).getNom() %></option>
                        <% } %>
                    </select>


                    <button type="submit" class="btn btn-primary" value="1" name="produits">Assigner des produits</button>

                </form>
                <br>
                <br>



            </div>

            <div class="form-group col-md-10">

                <br>


            </div>

        </div>
    </body>
</html>
