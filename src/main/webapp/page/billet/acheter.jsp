<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.NombreVoyageActivite" %>
<%@ page import="java.util.Vector" %>
<%@ page import="generic.kodro.A" %>
<%@ page import="com.example.voyage.personne.Client" %>
<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/11/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    List<Voyage> voyages =  A.select(connection, new Voyage());
    String message = null;
    //pConnection connect ,String idClient,String idVoyage,String nbHomme,String nbFemme,String nbBillet)throws  Exception{
    Client[] clients = Client.getAll(connection);
    if(request.getParameter("ok") != null){
        try{
            String nombreFemme = request.getParameter("femme");
            String nombreHomme = request.getParameter("homme");
            String idClient = request.getParameter("idClient");
            new NombreVoyageActivite().insererSortieStock(connection,request.getParameter("idVoyage"),request.getParameter("nombre"));
            Client.insertAchatAndDetails(connection, idClient, request.getParameter("idVoyage"), nombreHomme, nombreFemme, request.getParameter("nombre"));
        }
        catch (Exception e){
            message = e.toString();
        }
    }
   // connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="col-9 formulaire">
        <h1>Réserver billet</h1>
        <form method="post" class="form-control mt-3" action="acheter.jsp">

            <div class="col-6">
                <label style="" class="col-form-label">Voyage</label>
                <select name="idClient"  size="5" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <% for (Client c: clients) { %>
                    <option  value="<%=c.getIdClient()%>" ><%=c.getNom()%></option>
                    <% } %>
                </select>
            </div>

            <div class="col-6">
                <label style="" class="col-form-label">Voyage</label>
                <select id="countries" name="idVoyage" id="years" size="5" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <% for (Voyage voyage: voyages) { %>
                    <option  value="<%=voyage.getIdVoyage()%>" ><%=voyage.getNom()%></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group col-6">
                <label class="col-form-label">Nombre de billet</label>
                <input type="number" name="nombre" class="form-control">
            </div>

            <div class="form-group col-6">
                <label class="col-form-label">Femme</label>
                <input type="number" name="femme" class="form-control">
            </div>

            <div class="form-group col-6">
                <label class="col-form-label">Homme</label>
                <input type="number" name="homme" class="form-control">
            </div>

            <input type="submit" class="btn btn-primary mt-3" name="ok">

        </form>
        <% if(message != null) { %>
            <div class="alert danger">
                <h1><%=message%></h1>
            </div>
        <% } %>
    </div>
<%@include file="../structure/footer.jsp" %>