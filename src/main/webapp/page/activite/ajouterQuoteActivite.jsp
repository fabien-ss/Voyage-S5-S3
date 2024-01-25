<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="com.example.voyage.stock.EntreeStock" %>
<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/11/24
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    Activite[] activites = Activite.getAllActivities(connection);
    String error = null;
    if(request.getParameter("ok") != null){
        try{
            EntreeStock entreeStock = new EntreeStock(request.getParameter("idactivite"),
                    request.getParameter("nombre"));
            entreeStock.Insert(connection);
        }
        catch (Exception e){
            error = e.getMessage();
        }
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="col-9 formulaire">
        <h1>Ajouter Nouveau activité</h1>
        <form action="ajouterQuoteActivite.jsp" method="post" class="form-control">
            <div class="form-group">
                <label class="col-form-label">Activité</label>
                <select name="idactivite" class="form-select">
                    <% for (Activite act: activites) { %>
                        <option value=<%=act.getIdActivite()%>><%=act.getNom()%></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label class="col-form-label">Nombre de surf</label>
                <input type="number" name="nombre" class="form-control">
            </div>
            <input type="submit" name="ok" class="btn btn-primary mt-3">
        </form>
        <%if(error!=null){%>
            <div class="alert"><%=error%></div>
        <%}%>
    </div>
<%@include file="../structure/footer.jsp" %>