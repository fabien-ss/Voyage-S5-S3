
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%
	Connection connect=ConnexionPgsql.dbConnect();
	Activite[] lsAct=Activite.getAllActivities(connect);
	connect.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>

	<form action="afficherVoyage.jsp" method="post" class="max-w-sm mx-auto">
		<div class="mb-5">
			<label for="years" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Activité</label>
			<select name="idActivite" id="countries" id="years" size="5" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
				<%
					for (int i=0;i<lsAct.length ;i++ ) {
						out.println("<option value='"+lsAct[i].getIdActivite()+"'>"+lsAct[i].getNom()+"</option>");
					}
				%>
			</select>
		</div>
		<button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Rechercher</button>
	</form>

	<h1>Marge</h1>
	<form action="afficherVoyageEnTranche.jsp" method="post" class="max-w-sm mx-auto">
		<div class="mb-5">
			<label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Min price</label>
			<input type="number" name="prixMin"  class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
		</div>
		<div class="mb-5">
			<label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Max price</label>
			<input type="number" name="prixMax"  class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
		</div>
		<button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Rechercher</button>
	</form>

<%@include file="../structure/footer.jsp" %>
