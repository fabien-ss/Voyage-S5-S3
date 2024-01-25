<%@page import="java.sql.*"%>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="com.example.voyage.voyage.ActiBouq" %>

<%
    String error = "";
    Activite[] activites = new Activite[0];
    Connection connect = null;
    String idBouquet;
    Bouquet bouquet = null;
    try{
        connect = ConnexionPgsql.dbConnect();
        idBouquet = request.getParameter("idBouquet");
        bouquet = Bouquet.getBouquetById(connect, idBouquet);
        activites = Activite.getMissingActivities(connect, idBouquet);
        if(request.getParameter("id") != null){
            String id = request.getParameter("id");
            String idb = request.getParameter("idBouquet");
            ActiBouq actiBouq = new ActiBouq(idb, id);
            actiBouq.ajouterActiBouq(connect);
        }
    }catch (Exception e){
        error = e.getMessage();
    }
    connect.close();
%>

<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Maj Ajouter activité à<%bouquet.getNom();%></h5>
        <form method="post" action="ajouterActivite.jsp" class="max-w-sm mx-auto">
            <input type="hidden" name="idBouquet" value="<%=bouquet.getIdBouquet()%>">
            <select name="id" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                <% for(int i = 0; i < activites.length; i++){ %>
                    <option value="<%=activites[i].getIdActivite()%>"><%=activites[i].getNom()%></option>
                <% } %>
            </select>
            <br>
            <input type="submit" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
        </form>
        <%if(error!=null){ %>
            <div class="alert-danger">
                <h2><%=error%></h2>
            </div>
        <%}%>
    </div>

