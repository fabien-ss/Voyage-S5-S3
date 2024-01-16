<%@ page import="com.example.voyage.voyage.ActCond" %>
<%
	ActCond[] lsVoyage = new ActCond[0];
	try{
		String idActivite=request.getParameter("idActivite");
		lsVoyage=ActCond.getFromBdById(idActivite);
	}
	catch (Exception e){
		out.println(e);
	}

%>
<div class="container">
	<div class="row">
		<h1>Liste des voyages </h1>
		<table class="table">
			<tr>
				<th>nomVoyage</th>
				<th>Type</th>
			</tr>
			<%
				for (int i=0;i<lsVoyage.length ;i++ ) {
					out.println("<tr><td>"+lsVoyage[i].getNomVoyage() +"</td>");
					out.println("<td>"+lsVoyage[i].getNomTypeVoyage() +"</td></tr>");
				}
			%>
		</table>
	</div>
</diV>

</body>
</html>
