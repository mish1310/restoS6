<%-- 
    Document   : login
    Created on : 12 avr. 2022, 09:13:37
    Author     : Manda
--%>

<%@page import="modele.Profil"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<Profil> listeProfil = (List<Profil>) request.getAttribute("listeProfil"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Page de connection</title>
    </head>
    <body>
        <div class="col-12 text-center" style="margin-top: 10vh;"> 
            <h1><b>Login</b></h1> 
        </div>
        <div class="form-group row">
            <div class="form-group col-md-4"></div>
            <div class="form-group col-md-4">
                <form method="post" action="Login"> 
                    <br>
                    <label for="idProfil"><b>Selection de profil</b></label>
                    <select id="idProfil" class="form-control" name="idProfil">
                        <% for (int i = 0; i < listeProfil.size(); i++) {%>
                        <option value="<%=listeProfil.get(i).getIdProfil()%>"> <%=listeProfil.get(i).getNomProfil()%> </option>
                        <% }%>
                    </select>
                    <br> 
                    <label for="motDePasse"><b>Mot de passe</b></label>
                    <input type="password" id="motDePasse" class="form-control" name="motDePasse">
                    <br> 
                    <% if (request.getAttribute("erreurMdp") != null) { %>
                    <div class="alert alert-danger" >
                        Mot de passe erroné
                    </div>
                    <% }%>
                    <br> 
                    <button type="submit" class="btn btn-primary form-control" value="1" name="rechercheVal">Connection</button>
                </form>
            </div>
            <div class="form-group col-md-10"> </div>
        </div>
    </body>
</html>
