
<%@page import="modele.Inventaire"%>
<%@page import="modele.Produit"%>
<%@page import="java.util.List"%>
<% List<Inventaire> inventaires = (List<Inventaire>) request.getAttribute("inventaires");%>

<!DOCTYPE html>
<html>
    <head>
        <title>Inventaire</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="GererStock">Gestion de stock</a>
                        </li>
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
                    <h1>Inventaire</h1>
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
                                        <form method="POST" action="Inventaire?rechercher=1" >
                                            <div class="form-group" >
                                                <label for="produit">Produit : </label>
                                                <input id="produit" name="produit" class="form-control" type="text">
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" value="Rechercher" class="btn btn-primary form-control" onclick="//rechercherInventaire()" >
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <hr class="my-3">
                                <div>
                                    <div class="form-group">
                                        <form method="POST" action="FaireInventaire?tout=1" >
                                            <div class="form-group">
                                                <input type="submit" value="Faire l'inventaire" class="btn btn-primary form-control">
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
                                                    <th class="max-width">Stock</th>
                                                    <th class="max-width">Date dernier inventaire</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (Inventaire inventaire : inventaires) {%>
                                                <tr>
                                                    <td> <%=inventaire.getProduit().getIntitule()%> </td>
                                                    <td class="text-right" > <%=inventaire.getQuantiteEnStock()%> </td>
                                                    <td> <%=inventaire.getDateInventaire().toString()%> </td>
                                                </tr>
                                                <%}%>
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

        <script src="bootstrap-4.3-2.1-dist\js\jquery.min.css" ></script>
        <script>

                                                    function genererTableau() {

                                                    }

                                                    function rechercherInventaire() {
                                                        let nomProduit = document.getElementById("produit").value;

                                                        console.log(nomProduit);
                                                    }

        </script>
    </body>
</html>