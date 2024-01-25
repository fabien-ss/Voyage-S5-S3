<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.personne.Client" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/25/24
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("ok") != null){
        Connection connect = ConnexionPgsql.dbConnect();
        Client.insert(connect, request.getParameter("nom"), request.getParameter("prenom"));
        connect.commit();
        connect.close();
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="NouveauClient.jsp" method="post">
    <input type="text" name="nom">
    <input type="text" name="prenom">
    <input type="submit" name="ok" value="ok">
</form>

</body>
</html>
