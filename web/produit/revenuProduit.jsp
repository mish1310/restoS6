<%@page import="java.util.List"%>
<%@page import="modele.Produit"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="\assets\bootstrap\css\bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>

    <body>
        <h1>Detail(s) constituant</h1>
        
        Cout de fabrication = <%=request.getAttribute("prixFabrication")%>
        <br>
        Prix de vente = <%=request.getAttribute("prixUnitaire")%>
        <br>
        Benefice = <%=request.getAttribute("prixRevient")%>
        <br>

        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <th scope="col">Contituants</th>

                </tr>
            </thead>
            <tbody>
                <% List<Produit> listeConstituantProduit = (List<Produit>)request.getAttribute("listeConstituantProduit"); %>
                <% for (int i = 0; i < listeConstituantProduit.size(); i++) {%>
                    <tr>
                        <th scope="row">
                            <% out.println(listeConstituantProduit.get(i).getIntitule());%>
                        </th>
                    </tr>
                    <%}%>
            </tbody>
        </table>

    </body>

</html>