<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.marge.MargeBeneficiaire" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/16/24
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    Maindoeuvre[] maindoeuvres = new Maindoeuvre().getAll(connection);
    List<Voyage> voyages =  new Voyage().selectAll(connection);
    connection = ConnexionPgsql.dbConnect();
    if(request.getParameter("ok") != null){
        MargeBeneficiaire margeBeneficiaire = new MargeBeneficiaire();
        margeBeneficiaire.setPourcentage(Double.valueOf(request.getParameter("prix")));
        margeBeneficiaire.setIdVoyage(request.getParameter("idvoyage"));
        margeBeneficiaire.insert(connection);
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="row">
    <form action="margeBeneficiaire.jsp" method="post">
        <label>Voyage</label>
        <select name="idvoyage">
            <%for (Voyage maindoeuvre: voyages) { %>
            <option value="<%=maindoeuvre.getIdVoyage()%>"><%=maindoeuvre.getNom()%></option>
            <% }%>
        </select>
        <label>Prix</label>
        <input type="number" name="prix">
        <input type="submit" name="ok" value="ok">
    </form>
</div>