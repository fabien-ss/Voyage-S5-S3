<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 12/19/23
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.voyage.Voyage" %>
<%
    Connection connect = ConnexionPgsql.dbConnect();
    Bouquet[] lsBouq=Bouquet.getAllBouquet(connect);
    if(request.getParameter("ok") != null){
        HttpSession session1 = request.getSession();
        Voyage voyage = new Voyage(request.getParameter("nom"), request.getParameter("idBouquet"), request.getParameter("idTypeVoyage"), connect);
        session1.setAttribute("voyage", voyage);
        response.sendRedirect("VarierNombreActivite.jsp");
    }
    connect.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="col-9 formulaire">
        <form class="form-control mt-3" action="NouveauVoyage.jsp" method="post">
            <h2>Creation d'un nouveau voyage (1)</h2>
            <label>Bouquet</label>
            <select class="form-control" name="idBouquet">
                <% for (Bouquet b: lsBouq) { %>
                    <option value="<%=b.getIdBouquet()%>"><%=b.getNom()%></option>
                <% } %>
            </select>
            <label>Nom voyage</label>
            <input class="form-control" type="text" name="nom">
            <label>Type voyage</label>
            <select class="form-select" name="idTypeVoyage">
                <option value="1">Long</option>
                <option value="2">Court</option>
            </select>
            <input class="btn btn-primary mt-3" type="submit" name="ok" value="ok">
        </form>
    </div>
<%@include file="../structure/footer.jsp" %>
