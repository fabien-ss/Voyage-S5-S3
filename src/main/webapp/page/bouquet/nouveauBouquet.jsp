<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>

<%
    String error = "";
    if(request.getParameter("nom") != null){
        Connection connect=ConnexionPgsql.dbConnect();
        Bouquet bouquet = new Bouquet(request.getParameter("nom"));
        try{
            bouquet.insertBouquet(connect);
        }
        catch (Exception e){
            error = e.getMessage();
        }
        connect.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%@include file="../structure/header.jsp" %>
    <div class="row">
        <h1>Nouveau bouquet</h1>
        <form action="nouveauBouquet.jsp" method="post" class="form-control">
            <div class="form-group">
                <label class="col-form-label">Nom</label>
                <input type="text" name="nom" class="form-control">
            </div>
            <input type="submit" class="btn btn-primary">
        </form>
        <div class="alert">
            <%=error%>
        </div>
    </div>

<%@include file="../structure/footer.jsp" %>