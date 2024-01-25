<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="com.example.voyage.horaire.HoraireMainDoeuvre" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="generic.kodro.A" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Voyage> voyages = new ArrayList<>();
    Maindoeuvre[] maindoeuvres = new Maindoeuvre[1];
    String message = null;
    try{
        Connection connection = ConnexionPgsql.dbConnect();
        maindoeuvres = new Maindoeuvre().getAll(connection);
        connection = ConnexionPgsql.dbConnect();
        voyages =  A.select(connection, new Voyage());
        connection = ConnexionPgsql.dbConnect();

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
    }catch (Exception e){
        message = e.getMessage();
    }

%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="col-9 formulaire">
    <form action="ajouterMainDoeuvreVoyage.jsp" method="post" class="form-control mt-5">
        <label class="col-form-label">Voyage</label>
        <select name="idvoyage" class="form-select">
            <%for (Voyage maindoeuvre: voyages) { %>
                <option class="" value="<%=maindoeuvre.getIdVoyage()%>"><%=maindoeuvre.getNom()%></option>
            <% }%>
        </select>
        <label class="col-form-label">Poste</label>
        <select name="idmaindoeuvre" class="form-select">
            <%for (Maindoeuvre maindoeuvre: maindoeuvres) { %>
                <option value="<%=maindoeuvre.getIdMaindOuvre()%>"><%=maindoeuvre.getLabel()%></option>
            <% }%>
        </select>
        <label class="col-form-label">Horaire</label>
        <input type="number" name="prix" class="form-control">
        <input type="submit" value="ok" name="ok" class="btn btn-primary mt-3">
    </form>
    <%if(message!=null){%>
    <div class="alert-danger"><%=message%></div>
    <%}%>
</div>