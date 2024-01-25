<%@ page import="java.util.List" %>
<%@ page import="com.example.voyage.poste.employe.Employe" %>
<%@ page import="generic.kodro.A" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %><%
  String error = null;
  List<Employe> listEmploye = new ArrayList<>();
  try{
    Connection connect= ConnexionPgsql.dbConnect();
    if(request.getParameter("ok") != null){
      String idEmploye = request.getParameter("idEmploye");
      Employe employe = new Employe();
      employe.modifierDateEmbauche(connect, idEmploye, request.getParameter("dateEmbauche"));
      connect.commit();
    }
    listEmploye = A.select(connect, new Employe());
    error = listEmploye.size() + "";
  }
  catch (Exception e){
    error = e.getMessage();
  }
%>

<%@include file="../structure/header.jsp" %>


      <h1><%=error%></h1>
      <table class="table table-bordered">
        <tr>
          <th>Nom</th>
          <th>Prenom</th>
        </tr>
        <% for (Employe emp: listEmploye) { %>
        <tr>
          <td><%=emp.getNom()%></td>
          <td><%=emp.getPrenom()%></td>
          <td>
            <form action="listeEmploye.jsp" method="post">
              <input type="hidden" name="idEmploye" value="<%=emp.getIdEmploye()%>">
              <input type="datetime-local" value="<%=emp.getDateEmbauche()%>" name="dateEmbauche">
            </td>
            <td>
              <button type="submit" class="flex items-center justify-between" value="ok" name="ok">
                <p class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add to cart</p>
              </button>
            </form>
          </td>
        </tr>
        <% } %>
<style>
</style>
<%@include file="../structure/footer.jsp" %>