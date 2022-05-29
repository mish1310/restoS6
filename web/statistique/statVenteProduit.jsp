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

        dataGraphe.add(new Position((int) listeProduit.get(ii).getMontantTotal(), listeProduit.get(ii).getMois()));

    }
    for (int j = 0; j < dataGraphe.size(); j++) {
        out.println(dataGraphe.get(j).getY());
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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
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
                        text: "Statistiques ventes des produits"
                    },

                    data: [{
                            type: "column",
                            /*dataPoints: [
                             
                             {x: 10, y: 71 },
                             { x: 20, y: 55 },
                             { x: 30, y: 50 },
                             { x: 40, y: 65 },
                             { x: 50, y: 95 },
                             { x: 60, y: 68 },
                             { x: 70, y: 28 },
                             { x: 80, y: 34 },
                             { x: 90, y: 14 }
                             
                             ]*/
                            dataPoints: dataGraph

                        }]

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
                               href="PageFormulaireInserionCommande">Modification de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="VueProduitNonLivre">Livraison de produit</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="statistique/index.jsp">Statistiques</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-danger" href="Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>
        <form action="StatVente" method="POST">
            <label>Annee</label>
             
            <select name="annee" class="form-control">
                <% for(int i=2019 ; i< 2030 ;i++) {%>
                <option value="<% out.println(i); %>"><%out.println(i);%></option>
                <%}%>
            </select>
            <button class="btn btn-primary" type="submit">View</button>
        </form>
        <% if(request.getAttribute("verif")!= null){ %>
        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;">
        </div>  
        <% } %>
        <script src="./assets/js/canvasjs.min.js"></script>
        <script src="./assets/js/jquery-2.1.4.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
        <script src="js/function.js"></script> 
    </body>
</html>
