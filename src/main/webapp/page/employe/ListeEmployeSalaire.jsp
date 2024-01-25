<%@ page import="com.example.voyage.poste.employe.SalaireEmploye" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/23/24
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connect = ConnexionPgsql.dbConnect();
    SalaireEmploye[] lsBouq = new SalaireEmploye().getSalaireEmp(connect);
    connect.close();
%>
<%@include file="../structure/header.jsp" %>

<table>
    <tr >
        <th>Nom</th>
        <th>Asa</th>
        <th>Salaire</th>
        <th>Grade</th>
    </tr>
    <%for (SalaireEmploye salaireEmploye : lsBouq){%>
        <tr>
            <td><%=salaireEmploye.getNom()%></td>
            <td><%=salaireEmploye.getTravail()%></td>
            <td><%=salaireEmploye.getSalaire()%></td>
            <td><%=salaireEmploye.getLabel()%></td>
        </tr>
    <%}%>
</table>