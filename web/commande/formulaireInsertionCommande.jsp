<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
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
        <form method="post" action="paiement.jsp">
            <div class="form-group row">
                <div class="form-group row col-md-6"></div>
                <div class="form-group row col-md-5">
                    <h1>Listes Commandes</h1>
                    <h2><b>Numero table:</b></h2>
                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-2">

                </div>
                <div class="form-group row col-md-4">
                    <h1>Prix Totale</h1>

                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-2">

                </div>
                <div class="form-group row col-md-10">

                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Nom</th>
                                <th scope="col">Categorie</th>
                                <th scope="col">Quantite</th>
                                <th scope="col">Prix</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"></th>
                                <th scope="row"> </th>
                                <td> </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </body>
</html>
