<%-- 
    Document   : stock
    Created on : 29 mai 2022, 16:36:34
    Author     : Manda
--%>

<%@page import="modele.Produit"%>
<%@page import="modele.Stock"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Stock> stocks = (List<Stock>) request.getAttribute("stocks"); %>
<% List<Produit> produits = (List<Produit>) request.getAttribute("produits"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Gestion de stock</title>
    </head>
    <body>
        <script>
            
            function rechercher(){
                let produit = document.getElementById("produit").value;
                let dateInf = document.getElementById("dateInf").value;
                let dateSup = document.getElementById("dateSup").value;
                $.ajax({
                    type:"POST",
                    url:"GererStock?rechercher=1",
                    data: {
                        "produit": produit,
                        "dateInf": dateInf,
                        "dateSup": dateSup
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(result){
                        console.log("result");
                    }
                });
            }
            
        </script>
        
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
                    <h1>Gestion de stock</h1>
                </div>
            </div>

            <div class="col">
                <div class="e-tabs mb-3 px-3">
                    <ul class="nav nav-tabs">
                        <!--<li class="nav-item"><a class="nav-link active" href="#">Users</a></li>-->
                    </ul>
                </div>

                <div class="row flex-lg-nowrap">
                    <div class="col-12 col-lg-3 mb-3">
                        <div class="col-12 text-center">
                            <h3>Recherche</h3>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <hr class="my-3">
                                <div>
                                    <div class="form-group">
                                        <form method="POST" action="GererStock?rechercher=1" >
                                            <div class="form-group" >
                                                <label for="produit">Produit : </label>
                                                <input id="produit" name="produit" class="form-control" type="text">
                                            </div>
                                            <div class="form-group" >
                                                <label for="dateInf">Date inférieure : </label>
                                                <input id="dateInf" name="dateInf" class="form-control" type="date">
                                            </div>
                                            <div class="form-group" >
                                                <label for="dateSup">Date supérieure : </label>
                                                <input id="dateSup" name="dateSup" class="form-control" type="date">
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" onclick="//rechercher()" value="Rechercher" class="btn btn-primary form-control"  >
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <hr class="my-3">
                            </div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <div class="e-panel card">
                            <div class="card-body">
                                <div class="card-title">
                                </div>
                                <div class="e-table">
                                    <div class="table-responsive table-lg mt-3">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Produit</th>
                                                    <th>Prix unitaire d'achat</th>
                                                    <th>Quantite en stock</th>
                                                    <th>Date de stockage</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (Stock stock : stocks) {%>
                                                <tr>
                                                    <td> <%=stock.getProduit().getIntitule()%> </td>
                                                    <td class="text-right" > <%=stock.getPrixUnitaire()%> </td>
                                                    <td class="text-right" > <%=stock.getQuantite()%> </td>
                                                    <td> <%=stock.getDateStock().toString()%> </td>
                                                </tr>
                                                <%}%>
                                                <tr>
                                                    <td colspan="4" > 
                                                        <form action="GererStock?ajout=1" method="post">
                                                            <select name="produit" id="produit">
                                                                <% for (Produit produit : produits) {%>
                                                                <option value="<%=produit.getIdProduit()%>"><%=produit.getIntitule()%></option>
                                                                <% }%>
                                                            </select>
                                                            <input type="number" name="prixUnitaire" id="prixUnitaire" placeholder="Prix unitaire" >
                                                            <input type="number" name="quantite" id="quantite" placeholder="Quantite" >
                                                            <input type="date" name="dateStockage" id="dateStock" placeholder="Date de stockage" >
                                                            <br>
                                                            <input type="submit" value="Ajouter" class="btn btn-primary form-control" >
                                                        </form>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
        
    </body>
</html>
