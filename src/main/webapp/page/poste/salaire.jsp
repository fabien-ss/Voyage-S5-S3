<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="com.example.voyage.poste.PrixMainDoeuvre" %>
<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/16/24
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    Maindoeuvre[] maindoeuvres = new Maindoeuvre().getAll(connection);
    if(request.getParameter("ok") != null){
        String idmain = request.getParameter("idmaindoeuvre");
        String prix = request.getParameter("prix");
        PrixMainDoeuvre prixMainDoeuvre =new PrixMainDoeuvre();
        prixMainDoeuvre.setIdMainDoeuvre(Integer.valueOf(idmain));
        prixMainDoeuvre.setPrix(Double.valueOf(prix));
        prixMainDoeuvre.insert(connection);
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="col-9 formulaire">
    <form action="salaire.jsp" method="post" class="form-control mt-5">
        <label class="col-form-label">Poste</label>
        <select name="idmaindoeuvre" class="form-select">
            <%for (Maindoeuvre maindoeuvre: maindoeuvres) { %>
                <option value="<%=maindoeuvre.getIdMaindOuvre()%>"><%=maindoeuvre.getLabel()%></option>
            <% }%>
        </select>
        <label class="col-form-label">Salaire</label>
        <input type="number" name="prix" class="form-control">
        <input type="submit" value="ok" name="ok" class="btn btn-primary mt-3">
    </form>
</div>
