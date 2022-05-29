<%@page import="java.text.DateFormatSymbols"%>
<%@page import="modele.StatVenteProduit"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="statistique.*" %>
<%

    List<StatVenteProduit> listeProduit = (List<StatVenteProduit>) request.getAttribute("statVenteProduit");
    Position p = new Position();
    List<Position> dataGraphe = new ArrayList();

    for (int ii = 0; ii < listeProduit.size(); ii++) {
        String converMonthName = new DateFormatSymbols().getMonths()[Integer.valueOf(listeProduit.get(ii).getMois())];
        dataGraphe.add(new Position((int) listeProduit.get(ii).getMontantTotal(), converMonthName));

    }
    for (int j = 0; j < dataGraphe.size(); j++) {
        //out.println(dataGraphe.get(j).getY());
    }
    String jsonStr = p.convertJson(dataGraphe);

%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Statistique de vente</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script>
            window.onload = async function () {
                // var quantiteMax = <% //json_encode($quantite)%>;
                var dataGraph =<%= jsonStr%>;
                //var listeBatterie=<% //System.out.println(json_encode($data));%>;
                var getValueIndiceY = 0;
                console.log(dataGraph);
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    title: {
                        text: "Statistiques Ventes des Produits"
                    },

                    data: [{
                            type: "column",
                            dataPoints: dataGraph

                        }],
                    axisY: {
                        suffix: " Ar"
                    }

                });
                chart.render();

                var xSnapDistance = chart.axisX[0].convertPixelToValue(chart.get("dataPointWidth")) / 2;
                var ySnapDistance = 3;

                var xValue, yValue;

                var mouseDown = false;
                var selected = null;
                var changeCursor = false;

                var timerId = null;

                function getPosition(e) {
                    var parentOffset = $("#chartContainer > .canvasjs-chart-container").offset();
                    var relX = e.pageX - parentOffset.left;
                    var relY = e.pageY - parentOffset.top;
                    xValue = Math.round(chart.axisX[0].convertPixelToValue(relX));
                    //console.log("x="+relX);
                    yValue = Math.round(chart.axisY[0].convertPixelToValue(relY));
                    //console.log("y="+relY);
                }
                var idBatterie = 0;
                function searchDataPoint() {
                    var dps = chart.data[0].dataPoints;
                    console.log(dps);
                    var getUpdateValueindiceY = dps[0].y;
                    console.log("indice update" + getUpdateValueindiceY);
                    for (var i = 0; i < dps.length; i++) {

                        if ((xValue >= dps[i].x - xSnapDistance && xValue <= dps[i].x + xSnapDistance))
                        {

                            //console.log(xValue+">="+(dps[i].x - xSnapDistance)+"&&"+xValue+"<="+(dps[i].x + xSnapDistance));
                            if (mouseDown) {
                                selected = i;
                                getValueIndiceY = dataGraph[i].y;
                                idBatterie = listeBatterie[selected];
                                //console.log("indice initiale"+getValueIndiceY);

                                console.log(idBatterie);
                                break;
                            } else {
                                changeCursor = true;
                                break;
                            }
                        } else {
                            selected = null;
                            changeCursor = false;
                        }
                    }
                }

                jQuery("#chartContainer > .canvasjs-chart-container").on({
                    mousedown: function (e) {
                        mouseDown = true;
                        getPosition(e);
                        searchDataPoint();
                    },
                    mousemove: function (e) {
                        getPosition(e);
                        if (mouseDown) {
                            clearTimeout(timerId);
                            timerId = setTimeout(function () {
                                if (selected != null) {
                                    //chart.data[0].dataPoints[selected].y = yValue;
                                    //console.log("move"+chart.data[0].dataPoints[selected].y);
                                    chart.render();
                                }
                            }, 0);
                        } else {
                            searchDataPoint();
                            if (changeCursor) {
                                chart.data[0].set("cursor", "n-resize");
                            } else {
                                chart.data[0].set("cursor", "default");
                            }
                        }
                    },
                    mouseup: function (e)//update a value y
                    {
                        if (selected != null) {
                            //chart.data[0].dataPoints[selected].y = yValue;
                            //console.log("y" + getValueIndiceY);
                            //console.log("up" + chart.data[0].dataPoints[selected].y);

                            chart.render();
                            mouseDown = false;
                        }
                    }
                });

            }
        </script>
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

        <div class="row" style="margin-top: 5vh;">
            <div class="col-12 text-center">
                <h1>Statistique de vente</h1>
            </div>
        </div>
        
        <div class="row">
            <div class="col-2"></div>
            <div class="col-7">
                <form action="StatVente" method="POST">

                    <label>Annee</label>
        
                    <select name="annee" class="form-control">
                        <% for(int i=2019 ; i< 2030 ;i++) {%>
                        <option value="<% out.println(i); %>"><%out.println(i);%></option>
                        <%}%>
                    </select>
                    <button class="btn btn-primary" type="submit">View</button>
                </form>
            </div>
        </div>
        
        <% if(request.getAttribute("verif")!= null){ %>
        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;">
        </div>  
        <% } %>
        <script src="${pageContext.request.contextPath}/assets/js/canvasjs.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
        <!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--> 
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/assets/js/function.js"></script> 
    </body>
</html>