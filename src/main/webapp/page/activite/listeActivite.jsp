<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/13/24
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    List<Activite> activites = new Activite().selectAll(connection);
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<div class="row">
    <h1>List de nos activités</h1>
    <table class="table table-active">
        <tr>
            <th>Nom bouquet</th>
            <th>Nom Activité</th>
        </tr>
        <% for(int i = 0; i < activites.size(); i++){  %>
        <tr>
            <td></td>
            <td>
                <%=activites.get(i).getNom() %>
                <a href="updatePrix.jsp?idActivite=<%=activites.get(i).getIdActivite()%>">
                    modifier prix
                </a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
<%@include file="../structure/footer.jsp" %>