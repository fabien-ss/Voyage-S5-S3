<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 12/19/23
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.ActiBouq" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="com.example.voyage.voyage.NombreVoyageActivite" %>
<%
    HttpSession session1 = request.getSession();
    Voyage voyage = (Voyage) session1.getAttribute("voyage");
    Connection connect=ConnexionPgsql.dbConnect();
    ActiBouq actiBouq = new ActiBouq();
    actiBouq.setIdBouquet(voyage.getIdBouquet());
    ActiBouq[] activiteBouquet = actiBouq.getActiBouqById(connect);

    if(request.getParameter("varierok") != null){
        String[] nombre = request.getParameterValues("nombre[]");
        String[] idActivite = request.getParameterValues("idActivite[]");
        voyage.insert(connect);
        NombreVoyageActivite.insertLsData(idActivite, nombre, voyage.getIdVoyage());
        response.sendRedirect("NouveauVoyage.jsp");
    }
    connect.close();
%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container">
        <div class="row">
            <div class="co-6">
                <form action="VarierNombreActivite.jsp" method="post">
                    <table class="table">
                        <tr>
                            <th>Nom activite</th>
                            <th>Nombre</th>
                        </tr>
                        <% for (ActiBouq a: activiteBouquet) { %>
                            <tr>
                                <td><%=a.getNomActivite()%></td>
                                <td>
                                    <input type="number" name="nombre[]">
                                    <input type="hidden" name="idActivite[]" value="<%=a.getIdBouquet()%>">
                                </td>
                            </tr>
                        <% } %>
                    </table>
                    <input type="submit" name="varierok" value="Valider">
                </form>
            </div>
        </div>
    </div>
</body>
</html>