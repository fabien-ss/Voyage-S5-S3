<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.marge.MargeBeneficiaire" %>
<%@ page import="generic.kodro.A" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/16/24
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    Maindoeuvre[] maindoeuvres = new Maindoeuvre().getAll(connection);
    List<Voyage> voyages =  A.select(connection, new Voyage());
    connection = ConnexionPgsql.dbConnect();
    if(request.getParameter("ok") != null){
        MargeBeneficiaire margeBeneficiaire = new MargeBeneficiaire();
        margeBeneficiaire.setPourcentage(Double.valueOf(request.getParameter("prix")));
        margeBeneficiaire.setIdVoyage(request.getParameter("idvoyage"));
        margeBeneficiaire.insert(connection);
    }
    connection.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
<div class="col-9 formulaire">
    <form action="margeBeneficiaire.jsp" method="post" class="max-w-sm mx-auto">
        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Voyage</label>
        <select name="idvoyage" id="countries" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
            <%for (Voyage maindoeuvre: voyages) { %>
            <option value="<%=maindoeuvre.getIdVoyage()%>"><%=maindoeuvre.getNom()%></option>
            <% }%>
        </select>
        <div class="mb-5">
            <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Prix</label>
            <input type="number" name="prix" id="large-input" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        </div>
        <button type="submit" class="flex items-center justify-between" value="ok" name="ok">
            <p class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add to cart</p>
        </button>
    </form>
</div>