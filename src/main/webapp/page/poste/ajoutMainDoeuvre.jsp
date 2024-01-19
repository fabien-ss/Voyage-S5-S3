<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/16/24
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    String message = null;
    String error = null;
    if(request.getParameter("ok") != null){
        try{
            Maindoeuvre maindoeuvre = new Maindoeuvre();
            maindoeuvre.setLabel(request.getParameter("nom"));
            maindoeuvre.insert(connection);
        }
        catch (Exception e){
            error = e.getMessage();
        }
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="container">
    <form action="ajoutMainDoeuvre.jsp" method="post">
        <label>Nom du poste</label>
        <input type="text" name="nom">
        <input type="submit" value="ok" name="ok">
        <%  if(error != null){ %>
        <div class="alert-danger"><%=error%></div>
        <% }%>
    </form>
</div>

