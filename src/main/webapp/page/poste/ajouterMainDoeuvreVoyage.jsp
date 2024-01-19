<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="com.example.voyage.horaire.HoraireMainDoeuvre" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    Maindoeuvre[] maindoeuvres = new Maindoeuvre().getAll(connection);
    connection = ConnexionPgsql.dbConnect();
    List<Voyage> voyages =  new Voyage().selectAll(connection);
    connection = ConnexionPgsql.dbConnect();
    String message = null;
    if(request.getParameter("ok") != null){
        String idvoyage= request.getParameter("idvoyage");
        String idmaindoeuvre = request.getParameter("idmaindoeuvre");
        String prix = request.getParameter("prix");
        HoraireMainDoeuvre horaireMainDoeuvre = new HoraireMainDoeuvre();
        horaireMainDoeuvre.setHeure(Double.valueOf(prix));
        horaireMainDoeuvre.setIdMandoeuvre(Integer.valueOf(idmaindoeuvre));
        horaireMainDoeuvre.setIdVoyage(idvoyage);
        horaireMainDoeuvre.insert(connection);
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="container">
    <form action="ajouterMainDoeuvreVoyage.jsp" method="post">
        <label>Voyage</label>
        <select name="idvoyage">
            <%for (Voyage maindoeuvre: voyages) { %>
            <option value="<%=maindoeuvre.getIdVoyage()%>"><%=maindoeuvre.getNom()%></option>
            <% }%>
        </select>
        <label>Poste</label>
        <select name="idmaindoeuvre">
            <%for (Maindoeuvre maindoeuvre: maindoeuvres) { %>
                <option value="<%=maindoeuvre.getIdMaindOuvre()%>"><%=maindoeuvre.getLabel()%></option>
            <% }%>
        </select>
        <label>Horaire</label>
        <input type="number" name="prix">
        <input type="submit" value="ok" name="ok">
    </form>
</div>