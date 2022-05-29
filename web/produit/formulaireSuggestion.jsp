<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>insertion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="form-group row">
            <div class="form-group col-md-12">
                
                
                <form method="post" action="SuggestionPrixVente"> 
                    <h1><b>Regle de gestion</b></h1>
                    <br>

                   
                        
                    <label for="montantSup"><b>Prix max</b></label>
                    <input type="number" name="montantSup" value="-1" placeholder="price max">
                    
                    <label for="montantInf"><b>Prix min</b></label>
                    <input type="number" name="montantInf" value="-1" placeholder="price min">
                    
                    <label for="pourcentageSuggestion"><b>Pourcentage</b></label>
                    <input type="number" name="pourcentageSuggestion" placeholder="%">
                    <button class="btn btn-success" value="#" name="idCommande">Inserer</button>
                </form>
                <br>
                <br>
               


            </div>

            <div class="form-group col-md-10">

                <br>

              
            </div>

        </div>
    </body>
</html>
