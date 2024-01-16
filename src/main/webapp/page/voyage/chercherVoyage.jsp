
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%
	Connection connect=ConnexionPgsql.dbConnect();
	Activite[] lsAct=Activite.getAllActivities(connect);
	connect.close();
%>
<%@include file="../structure/header.jsp" %>

	<div class="row">
	<h1>Rechercher voyage par activite</h1>
        <form action="afficherVoyage.jsp" method="post" class="form-control  mt-3">
        	<select name="idActivite" class="form-select  mt-3">
				<%
					for (int i=0;i<lsAct.length ;i++ ) {
						out.println("<option value='"+lsAct[i].getIdActivite()+"'>"+lsAct[i].getNom()+"</option>");
					}
				%>	        		
        	</select>
        <input type="submit" class="btn btn-primary mt-3">
		</form>
	</div>

	<div class="row">
		<h1>Rechercher voyage par prix</h1>
		<form action="afficherVoyageEnTranche.jsp" method="post" class="form-control">
			<div class="form-group" style="display: inline">
				<input type="number" name="prixMin" class="form-control-sm">
				<input type="number" name="prixMax" class="form-control">
			</div>
			<input type="submit" class="btn btn-primary mt-3">
		</form>
	</div>
<%@include file="../structure/footer.jsp" %>
