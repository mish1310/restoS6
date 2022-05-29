<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="statistique.*" %>
<%
    String[] date = new String[5];
    date[0] = "2020";
    date[1] = "2021";
    date[2] = "2022";
    date[3] = "2023";
    date[4] = "2024";

    int[] produit = new int[5];
    produit[0] = 9;
    produit[1] = 5;
    produit[2] = 3;
    produit[3] = 2;
    produit[4] = 4;

    Position p = new Position();
    List<Position> dataGraphe = new ArrayList();
    for (int i = 0; i < produit.length; i++) {

        dataGraphe.add(new Position(produit[i], date[i]));

    }
    for (int j = 0; j < dataGraphe.size(); j++) {
        // out.println(dataGraphe.get(j).getY());
    }
    String jsonStr = p.convertJson(dataGraphe);
    //out.println(jsonStr);
    /* <?php include('traitement.php');
    $data=getBatterie();
    $quantite=quantiteMax();
    //var_dump($data);
    //var_dump("quantite=".quantiteMax());

    $dataGraph=array();
    for($i=0;$i<count($data);$i++)
    {
       // var_dump($data[$i]['quantite']+1-1);
        //var_dump($data[$i]['voltage']*$data[$i]['amperage']);
        $quantite=$data[$i]['quantite']+1-1;
        $puissance=$data[$i]['voltage']*$data[$i]['amperage']+1-1;
        $dataGraphe=array("y"=>$quantite,"label"=>$puissance);
       
        $dataGraph[]=$dataGraphe;
       
        
    }
    //var_dump($dataGraph);
    //var_dump($dataGraph);
?>*/

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
        <link href="..\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
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
                        text: "Statistiques"
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
                <a class="navbar-brand" href="/restoS6/Accueil">Serveur</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="/restoS6/PageFormulaireInsertionCommande">Insertion de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page"
                               href="/restoS6/PageFormulaireInserionCommande">Modification de commande</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/restoS6/VueProduitNonLivre">Livraison de produit</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.jsp">Statistiques</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-danger" href="/restoS6/Deconnection">Deconnection</a>
                </div>
            </div>
        </nav>
        
        
            <a class="btn btn-dark" type="submit" href="/restoS6/fenStatVente">Vente Produit</a>
            <a class="btn btn-dark" type="submit" href="/restoS6/fenStatAchat">Achat Produit</a>
        
        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
        

        <script src="../assets/js/canvasjs.min.js"></script>
        <script src="../assets/js/jquery-2.1.4.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
        <script src="./assets/js/function.js"></script>
    </body>
</html>
