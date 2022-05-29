function canvasGraphe(dataGraph)
{
  window.onload = async function () {
            // var quantiteMax = <% //json_encode($quantite)%>;
    
    //var listeBatterie=<% //System.out.println(json_encode($data));%>;
    var getValueIndiceY=0;
    console.log(dataGraph);
    var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
    title: {
            text: "Statistique"
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
        dataPoints:dataGraph
        
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
    var idBatterie=0;
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
            mousemove: function(e) {
                getPosition(e);
                    if (mouseDown) {
                    clearTimeout(timerId);
                    timerId = setTimeout(function () {
                       if (selected != null) {
                        chart.data[0].dataPoints[selected].y = yValue;
                        //console.log("move"+chart.data[0].dataPoints[selected].y);
                        chart.render();
                    }   
                    }, 0);
                    }
                    else {
                                searchDataPoint();
                                if (changeCursor) {
                                            chart.data[0].set("cursor", "n-resize");
                        } else {
                                                    chart.data[0].set("cursor", "default");
                                }
                                }
                                },
                mouseup: function(e)//update a value y
                                                {
                if (selected != null) {
                                    chart.data[0].dataPoints[selected].y = yValue;
                                    console.log("y" + getValueIndiceY);
                                    console.log("up" + chart.data[0].dataPoints[selected].y);
                                    if (getValueIndiceY > chart.data[0].dataPoints[selected].y)
                                    {
                                        for (var i = 0; i < getValueIndiceY - chart.data[0].dataPoints[selected].y; i++)
                                        {
                                                console.log("delete in batterie and insert into batteriedelete");
                                }
                                    }
                                    else if(getValueIndiceY< chart.data[0].dataPoints[selected].y){
                                                for (var j = 0; j < -getValueIndiceY + chart.data[0].dataPoints[selected].y; j++)
                                                {
                                                    console.log("insert into batterie");
                                            updateQuantite = -getValueIndiceY + chart.data[0].dataPoints[selected].y;
                                            console.log("idBatterie" + idBatterie.idBatterie);
                                            setTimeout(async function () {
                                                window.location.href = '<?php echo "traitementInsert.php?idBatterie="?>' + idBatterie.idBatterie + '&quantite=' + updateQuantite;
                                                }, 20);
                                                }
                                                }
                                                chart.render();
                                                mouseDown = false;
                                                }
                                                }
                                                });

                                                    }
}