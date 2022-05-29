<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href=".\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <title>Commandes non payés</title>
    </head>
    <body>
        <h1>Selection de la date de verification</h1>
        <form method="post" action="VueCommandeNonPaye">
            <div class="form-group row">
                <div class="form-group row col-md-6"></div>
                <div class="form-group row col-md-5">
                    <label for="date" > Date de verification : </label>
                    <input id="date" name="date" type="date" />
                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-6"></div>
                <div class="form-group row col-md-6">
                    <input type="submit" value="Executer la requête" />
                </div>
            </div>
        </form>
    </body>
</html>
