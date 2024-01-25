<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>

<%
    String error = "";
    if(request.getParameter("nom") != null){
        Connection connect=ConnexionPgsql.dbConnect();
        Bouquet bouquet = new Bouquet(request.getParameter("nom"));
        try{
            bouquet.insertBouquet(connect);
        }
        catch (Exception e){
            error = e.getMessage();
        }
        connect.close();
    }
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="col-9 formulaire">
        <h1>Nouveau bouquet</h1>
        <form action="nouveauBouquet.jsp" method="post" class="form-control">
            <div class="form-group">
                <label class="col-form-label">Nom</label>
                <input type="text" name="nom" class="form-control">
            </div>
            <input type="submit" class="btn btn-primary mt-3">
        </form>
        <div class="alert">
            <%=error%>
        </div>
    </div>
<%@include file="../structure/footer.jsp" %>