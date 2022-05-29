<%-- 
    Document   : listePlatAFabriquer
    Created on : 26 mai 2022, 14:56:43
    Author     : Manda
--%>

<%@page import="java.util.List"%>
<%@page import="modele.DetailCommande"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<DetailCommande> listePlatsAFabriquer = (List<DetailCommande>) request.getAttribute("listePlatsAFabriquer"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Cuisine</title>
    </head>
    <body>
        <nav class="navbar navbar-expand navbar-dark bg-dark" aria-label="Second navbar example">
            <div class="container-fluid" style="margin-left: 40vw;">
                <a class="navbar-brand" href="AccueilCuisine">Cuisine</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                </div>
                    <ul class="navbar-nav me-auto">
<!--                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>-->
                    </ul>
                <div class="" style="float: right;" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top: 5vh;">

            <div class="row">
                <div class="col-12 text-center">
                    <h1>Plat en attente de préparation</h1>
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
                                                    <th>Plat</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for(DetailCommande detailCommande : listePlatsAFabriquer){ %>
                                                    <tr>
                                                        <td class="text-nowrap align-middle"><%=detailCommande.getProduit().getIntitule() %></td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <a class="btn btn-primary" href="FabriquerPlat?idDetailCommande=<%=detailCommande.getIdDetailCommande() %>" >
                                                                    Fabriquer
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
