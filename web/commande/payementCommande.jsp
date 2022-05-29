<%@page import="modele.TypePaiement"%>
<!DOCTYPE html>
<!-- 
    Document   : FenTabProduit
    Created on : 3 nov. 2021, 19:25:55
    Author     : Dx2Big
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="modele.DetailCommande" %>
<%@page import="modele.Commande" %>
<% List<DetailCommande> detailsCommande = (List<DetailCommande>) request.getAttribute("detailsCommande"); %>
<% List<TypePaiement> listeTypePaiement = (List<TypePaiement>) request.getAttribute("listeTypePaiement"); %>
<% Commande commande = (Commande) request.getAttribute("commande");%>

<html>
    <head>
        <title>Liste des plats commandés</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                    <h1>Paiement de commande , table N°: <%=commande.getTable().getIdTable()%></h1>
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
                                                    <th>Plât</th>
                                                    <th class="max-width">Montant</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < detailsCommande.size(); i++) {%>
                                                <tr>
                                                    <td> <%=detailsCommande.get(i).getProduit().getIntitule()%></td>
                                                    <td> <%=detailsCommande.get(i).getPrixUnitaire() %> </td>
                                                </tr>
                                                <%}%>
                                                <tr style="background-color: black;" >
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>Montant commande</th>
                                                    <td><%=commande.getPrixTotal()  %></td>
                                                </tr>
                                                <tr>
                                                    <th>Montant payé</th>
                                                    <td><%=commande.getSommePayement()  %></td>
                                                </tr>
                                                <tr>
                                                    <th>Reste à payer</th>
                                                    <td><%=commande.getPrixTotal() - commande.getSommePayement()  %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-3 mb-3">
                        <div class="col-12 text-center">
                            <h3>Payer</h3>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <hr class="my-3">
                                <div>
                                    <div class="form-group">
                                        <form method="POST" action="PayerCommande?idCommande=<%=commande.getIdCommande()%>" >
                                            <div class="form-group" >
                                                <label for="montant">Montant : </label>
                                                <input id="montant" name="montant" class="form-control" type="number" min="0" required>
                                            </div>
                                            <% if(request.getAttribute("erreurPaiement") != null) { %>
                                            <div class="alert alert-danger" >
                                                <p><small>Montant supérieur au reste à payer!</small></p>
                                            </div>
                                            <% } %>
                                            <div class="form-group">
                                                <label for="typePaiement">Type de paiement</label>
                                                <select name="typePaiement" id="typePaiement" class="form-control" required>
                                                    <% for(TypePaiement typePaiement: listeTypePaiement) { %>
                                                        <option value="<%=typePaiement.getIdTypePayement() %>"><%=typePaiement.getNomTypePayement()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" value="Payer" class="btn btn-primary">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <hr class="my-3">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
