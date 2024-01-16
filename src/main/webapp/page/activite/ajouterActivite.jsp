<%@page import="java.sql.*"%>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="com.example.voyage.voyage.ActiBouq" %>

<%
    String error = "";
    Activite[] activites = new Activite[0];
    Connection connect = null;
    String idBouquet = null;
    Bouquet bouquet = null;
    try{
        connect = ConnexionPgsql.dbConnect();
        idBouquet = request.getParameter("idBouquet");
        bouquet = Bouquet.getBouquetById(connect, idBouquet);
        activites = Activite.getMissingActivities(connect, idBouquet);
        if(request.getParameter("id") != null){
            String id = request.getParameter("id");
            String idb = request.getParameter("idBouquet");
            try{
                ActiBouq actiBouq = new ActiBouq(idb, id);
                actiBouq.ajouterActiBouq(connect);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }catch (Exception e){
        error = e.getMessage();
    }
    connect.close();
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
    <div>
        <h1>Ajouter activité à<%bouquet.getNom();%></h1>
        <form method="post" action="ajouterActivite.jsp">
            <input type="hidden" name="idBouquet" value="<%=bouquet.getIdBouquet()%>">
            <select name="id">
                <% for(int i = 0; i < activites.length; i++){ %>
                    <option value="<%=activites[i].getIdActivite()%>"><%=activites[i].getNom()%></option>
                <% } %>
            </select>
            <input type="submit">
        </form>
        <%if(error!=null){ %>
            <div class="alert-danger">
                <h2><%=error%></h2>
            </div>
        <%}%>

    </div>
</body>
</html>