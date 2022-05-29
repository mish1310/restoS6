<%-- 
    Document   : formulaireCommande
    Created on : 24 mai 2022, 09:41:37
    Author     : Manda
--%>
<%@page import="modele.Serveur"%>
<%@page import="modele.Produit"%>
<%@page import="modele.Table"%>
<%@page import="modele.DetailCommande"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<Serveur> listeServeur = (List<Serveur>) request.getAttribute("listeServeur"); %>
<% List<Table> listeTable = (List<Table>) request.getAttribute("listeTable"); %>
<% List<Produit> listeProduitVendable = (List<Produit>) request.getAttribute("listeProduitVendable"); %>
<%
    List<DetailCommande> listeDetailCommande = null;
    try {
        listeDetailCommande = (List<DetailCommande>) session.getAttribute("listeDetailCommande");
    } catch (Exception ex) {
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulaire de commande</title>
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

        <div class="container" style="margin-top: 5vh;">

            <div class="row">
                <div class="col-12 text-center">
                    <h1>Faire une commande</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <form action="InsertionCommande" class="jumbotron" method="POST">
                        <div class="form-group">
                            <label for="serveur">Serveur : </label>
                            <select id="serveur" class="form-control" name="serveur">
                                <% for (int i = 0; i < listeServeur.size(); i++) {%>
                                <option value="<%=listeServeur.get(i).getIdServeur()%>"><%=listeServeur.get(i).getNom()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="table">Table : </label>
                            <select id="table" class="form-control" name="table">
                                <% for (int i = 0; i < listeTable.size(); i++) {%>
                                <option value="<%=listeTable.get(i).getIdTable()%>"><%=listeTable.get(i).getNumero()%></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="form-group">
                            <button  class="btn btn-primary" style="float: right;">Valider la commande</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <form action="AjoutDetailCommande" class="jumbotron" method="post">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-group">
                                    <label for="produit">Plat à commander : </label>
                                    <select id="produit" class="form-control" name="produit">
                                        <% for (int i = 0; i < listeProduitVendable.size(); i++) {%>
                                        <option value="<%=listeProduitVendable.get(i).getIdProduit()%>"><%=listeProduitVendable.get(i).getIntitule()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-2">
                                <label for="quantite">Quantite : </label>
                                <input type="number" name="quantite" id="quantite" class="form-control" min="1" value="1">
                            </div>
                            <div class="col-2">
                                <label for=""></label>
                                <br>
                                <input type="submit" value="Ajouter" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-12 text-center">
                    <h2>Liste des plats commandés</h2>
                </div>
            </div>

            <div class="row" id="listeProduit">
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Plat</th>
                            <th>Prix unitaire</th>
                            <th>Enlever</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (listeDetailCommande != null) {
                                for (int i = 0; i < listeDetailCommande.size(); i++) {
                        %>
                        <tr>
                            <td><%=listeDetailCommande.get(i).getProduit().getIntitule()%></td>
                            <td><%=listeDetailCommande.get(i).getProduit().getPrixUnitaire()%></td>
                            <td>
                                <form action="SupprimerDetailCommande" method="get">
                                    <input type="number" name="idProduit" id="idProduit" value="<%=listeDetailCommande.get(i).getProduit().getIdProduit()%>" style="display:none;">
                                    <button type="submit" class="btn btn-danger">Supprimer</button>
                                </form>
                            </td>
                        </tr>
                        <% }
                            }%>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
