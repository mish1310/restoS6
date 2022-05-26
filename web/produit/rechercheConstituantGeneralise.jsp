<%-- 
    Document   : rechercheConstituantGeneralise
    Created on : 5 avr. 2022, 07:59:30
    Author     : Manda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suivi d'utilisation d'ingredients</title>
    </head>
    <body>
        <h1>Formulaire de suivi d'utilisation d'ingredients entre 2 dates</h1>
         <div class="form-group row">
            <div class="form-group col-md-4"></div>
            <div class="form-group col-md-4">
                <form method="POST" action="ConstituantPlatsGeneralise">
                    <label for="date1">Date debut : </label>
                    <input type="date" id="date1" name="date1" />
                    <br>
                    <label for="date2"><b>Date fin :</b></label>
                    <input type="date" id="date2" name="date2" />
                    <button type="submit" class="btn btn-primary">Executer la requête</button>
                </form>
            </div>
        </div>
    </body>
</html>
