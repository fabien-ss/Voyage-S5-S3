<%@ page import="com.example.voyage.poste.employe.Experience" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="generic.kodro.A" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/23/24
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    Connection connection = ConnexionPgsql.dbConnect();
    if(request.getParameter("g") != null){
        new Experience().insetionparam(request.getParameter("parametra"), connection);
        connection.commit();
    }
    if(request.getParameter("new") != null){
        Experience experience = new Experience();
        experience.setNbAnneMin(Integer.valueOf(request.getParameter("min")));
        experience.setNbAnneeMax(Integer.valueOf(request.getParameter("max")));
        experience.setLabel(request.getParameter("label"));
        experience.setValeur(Integer.valueOf(request.getParameter("valeur")));
        A.insert(connection, experience);
        connection.commit();
    }

    List<Experience> experiences = A.select(connection, new Experience());
%>
<%@include file="../structure/header.jsp" %>
<ul>
    <%for (Experience e: experiences){%>
    <li><%=e.getIdExperience()%>|<%=e.getLabel()%></li>
    <%}%>
</ul>
<form action="parametre.jsp" method="post" class="max-w-sm mx-auto">
    <input type="text" name="parametra">
    <input type="submit" value="g" name="g">
</form>
<br>

<h2>Nouveau grade</h2>
    <form action="parametre.jsp" method="post" class="max-w-sm mx-auto">
        <div class="mb-5">
            <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Max</label>
        <input name="max" type="number" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        </div>
        <div class="mb-5">
        <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Min</label>
            <input name="min" type="number" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        </div>
        <div class="mb-5">
            <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Valeur</label>
            <input name="valeur" type="number" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        </div>
        <div class="mb-5">
            <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Label</label>
            <input type="text" name="label" id="large-input" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
        </div>
        <button type="submit" class="flex items-center justify-between" value="new" name="new">
            <p class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add to cart</p>
        </button>
    </form>
</body>
</html>
