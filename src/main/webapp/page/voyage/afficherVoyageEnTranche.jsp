<%@ page import="com.example.voyage.prix.VPrixVoyage" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/9/24
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connect= ConnexionPgsql.dbConnect();
    String prixMin = request.getParameter("prixMin");
    String prixMax = request.getParameter("prixMax");
    VPrixVoyage[] listeVoyage;
    String error = "";
    try{
        listeVoyage = new VPrixVoyage().getFromBdById(connect, prixMin, prixMax);
    }
    catch (Exception e){
        listeVoyage = new VPrixVoyage[0];
        error = e.getMessage();
    }
    connect.close();
%>
<%@include file="../structure/header.jsp" %>
<div class="row">
    <table class="table table-striped">
        <tr>
            <th>Nom</th>
            <th>Prix</th>
        </tr>
        <% for (VPrixVoyage vPrixVoyage: listeVoyage) { %>
            <tr>
                <td><%=vPrixVoyage.getNom()%></td>
                <td><%=vPrixVoyage.getPrix()%></td>
            </tr>
        <% } %>

    </table>
</div>
<%@include file="../structure/footer.jsp" %>