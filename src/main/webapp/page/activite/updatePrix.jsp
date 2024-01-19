<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Activite" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/9/24
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idactivite  = request.getParameter("idActivite");
    if(request.getParameter("ok")!=null){
        Connection connection = ConnexionPgsql.dbConnect();
        Activite activite = new Activite();
        activite.setIdActivite(idactivite);
        activite.setPrix(request.getParameter("prix"));
        activite.updateActivite(connection);
        connection.close();;
    }
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>

<form class="form-control" action="updatePrix.jsp" method="post">
    <input type="number" name="prix" class="form-control">
    <input type="hidden" value="<%=idactivite%>" name="idActivite" class="form-control">
    <input type="submit" name="ok" class="btn btn-primary">
</form>
</body>
</html>
