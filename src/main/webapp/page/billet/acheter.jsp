<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.NombreVoyageActivite" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/11/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    List<Voyage> voyages =  new Voyage().selectAll(connection);
    String message = null;
    if(request.getParameter("ok") != null){
        try{
            new NombreVoyageActivite().insererSortieStock(connection,request.getParameter("idVoyage"),request.getParameter("nombre"));
        }
        catch (Exception e){
            message = e.getMessage();
        }
    }
%>
<%@include file="../structure/header.jsp" %>
    <div class="row">
        <h1>Réserver billet</h1>
        <form method="post" class="form-control mt-3" action="acheter.jsp">
            <div class="col-6">
                <label style="" class="col-form-label">Voyage</label>
                <% for (Voyage voyage: voyages) { %>
                <div class="form-group">
                    <label><%=voyage.getNom()%></label>
                    <input type="radio" name="idVoyage" value="<%=voyage.getIdVoyage()%>" class="control--radio">
                </div>
                <% } %>
            </div>
            <div class="form-group col-6">
                <label class="col-form-label">Nombre de billet</label>
                <input type="number" name="nombre" class="form-control">
                <input type="submit" class="btn btn-primary mt-3" name="ok">
            </div>

        </form>
        <% if(message != null) { %>
        <div class="alert danger">
            <h1><%=message%></h1>
        </div>
        <% } %>
    </div>
<%@include file="../structure/footer.jsp" %>