<%-- 
    Document   : listeCommandeNonPaye
    Created on : 25 mai 2022, 16:12:05
    Author     : Manda
--%>

<%@page import="modele.Commande"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Commande> listeCommandeNonPayes = (List<Commande>)request.getAttribute("listeCommandeNonPaye"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Liste des commandes non payés</title>
    </head>
    <body>

        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid" style="margin-left: 40vw;">
                <a class="navbar-brand" href="AccueilCaisse">Caisse</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
<!--                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>-->
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
                    <h1>Commandes non payés</h1>
                </div>
            </div>

            <div class="col">
                <div class="e-tabs mb-3 px-3">
                    <ul class="nav nav-tabs">
                        <!--<li class="nav-item"><a class="nav-link active" href="#">Users</a></li>-->
                    </ul>
                </div>

                <div class="row flex-lg-nowrap">
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
                                                    <th>Table</th>
                                                    <th class="max-width">Montant de la commande</th>
                                                    <th class="sortable">Montant payé</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for(Commande commande : listeCommandeNonPayes){ %>
                                                    <tr>
                                                        <td class="text-nowrap align-middle"><%=commande.getTable().getIdTable() %></td>
                                                        <td class="text-right align-middle"><span><%=commande.getPrixTotal()  %></span></td>
                                                        <td class="text-right align-middle"><%=commande.getSommePayement() %></td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <a class="btn btn-primary" href="PayerCommande?idCommande=<%=commande.getIdCommande() %>" >
                                                                    Procéder au payement
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <% } %>
                                                <tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--                    <div class="col-12 col-lg-3 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <hr class="my-3">
                                <div>
                                    <div class="form-group">
                                        <label>Numero de table</label>
                                        <div>
                                            <input id="dates-range" class="form-control flatpickr-input" placeholder="01 Dec 17 - 27 Jan 18"
                                                   type="text" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-3">
                            </div>
                        </div>
                    </div>-->
                </div>

            </div>
        </div>

        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f8f8f8
            }
        </style>

        <script type="text/javascript">

        </script>

    </body>
</html>
