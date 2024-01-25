<%@ page import="com.example.voyage.poste.Maindoeuvre" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.poste.employe.Employe" %>
<%@ page import="generic.kodro.A" %><%
	Maindoeuvre[] maindoeuvres = new Maindoeuvre[1];
	String message = null;
	try{
		Connection connection = ConnexionPgsql.dbConnect();
		maindoeuvres = new Maindoeuvre().getAll(connection);
		if(request.getParameter("valider") != null){
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String date = request.getParameter("dateEmbauche");
			String poste = request.getParameter("ee");
			Employe employe = new Employe(nom, prenom, date, poste);
			A.insert(connection, employe);
			connection.commit();
		}
		connection.close();
	}catch (Exception e){
		message = e.getMessage();
	}

%>
<%@include file="../structure/header.jsp" %>
<div style="text-align: left;">
	<h1>Nouvel employe</h1>
	<form action='AjoutEmployer.jsp' method="POST">
		nom: <br><input type="text" name="nom"> <br>
		prenom:<br><input type="text" name="prenom"> <br>
		date d'embauche:<br><input type="datetime-local" name="dateEmbauche"> <br>
		idPost à assigner:<br><select name="ee"> <br>
		<%for (Maindoeuvre d: maindoeuvres){%>
			<option value=<%=d.getIdMaindOuvre()%>><%=d.getLabel()%></option>
		<%}%>
	</select>
		<input type="submit" value="valider" name="valider">
	</form>
</div>
<%=message%>
</body>
</html>