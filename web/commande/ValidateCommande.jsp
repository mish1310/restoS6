<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.3-2.1-dist\css\bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <br>

        <form method="post" action="validate.jsp">
            <div class="form-group row">

                <div class="form-group row col-md-2">

                </div>
        
                <div class="form-group row col-md-4">
                    <h1>Validation Commandes</h1>
                   
                    <h5> Numero table:</h5>
                </div>
            </div>
            <div class="form-group row">
                <div class="form-group row col-md-2">

                </div>

                <div class="form-group row col-md-10">
                    <table class="table table-striped table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Nom</th>
                                <th scope="col">Categorie</th>
                                <th scope="col">Quantite</th>
                                <th scope="col">Prix</th>
                                <th scope="col"></th>
                               
                            </tr>
                        </thead>
                        <tbody>

                          

                            <tr>

                                <th scope="row">
                                  
                                </th>
                                <td>
                                   

                                </td>
                                <td>

                                  
                                </td>
                                
                                <td><button type="submit" class="btn btn-danger" value="1"
                                            name="refuser">Refuser</button></td>
                                    
                            </tr>

                         
                        </tbody>
                    </table>
                  
                </div>
            </div>
        </form>
        <div class="form-group row">
            <div class="form-group row col-md-2">

            </div>
            <div class="form-group row col-md-6">

            
                     <form method="post" action="commandeFaite">
                        <button class="btn btn-primary">Commande</button>
                    </form>
            </div>
        </div>
    </body>
</html>
