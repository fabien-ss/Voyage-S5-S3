<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="generic.kodro.A" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/13/24
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = null;
    List<Activite> activites = new ArrayList<>();
    try{
        Connection connection = ConnexionPgsql.dbConnect();
        activites = A.select(connection, new Activite());
        connection.close();
    }catch (Exception e){
        error = e.toString();
    }

%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <h1>List de nos activités</h1>
    <table>
        <tr>
            <th>Nom</th>
            <th>Prix actuel</th>
            <th>Action</th>
        </tr>
        <% for(int i = 0; i < activites.size(); i++){  %>
        <tr >
            <td><%=activites.get(i).getNom() %></td>
            <td><%=activites.get(i).getPrix()%></td>
            <td>
            <a href="updatePrix.jsp?idA<ctivite=<%=activites.get(i).getIdActivite()%>">Modifier prix</a>
            </td>
        </tr>
        <% } %>
    </table>
    <%if(error != null) { %>
        <div class="alert-danger">
            Erreur: <%=error%>
        </div>
    <% } %>
<%@include file="../structure/footer.jsp" %>