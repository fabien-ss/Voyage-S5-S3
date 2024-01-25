<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.Activite" %>
<%
    String error = null;
    if(request.getParameter("nom") != null){
        try{
            Connection c = ConnexionPgsql.dbConnect();
            String nom = request.getParameter("nom");
            String prixUnitaire = request.getParameter("prix_unitaire");
            Activite activite = new Activite(nom, prixUnitaire);
            activite.insertActivite(c);
            c.close();
        }
        catch (Exception e){
            error = e.getMessage();
        }
    }
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="col-9 formulaire">
        <h1>Nouvelle activité</h1>
        <form method="post" class="form-control" action="nouvelleActivite.jsp">
            <div class="form-group">
                <label class="col-form-label">Nom</label>
                <input type="text" name="nom" class="form-control">
            </div>
            <div class="form-group">
                <label class="col-form-label">Nombre</label>
                <input type="number" name="prix_unitaire" class="form-control">
            </div>
            <input type="submit" class="btn btn-primary mt-3">
        </form>
        <%if(error!=null){%>
            <div class="alert"><%=error%></div>
        <%}%>
    </div>
<%@include file="../structure/footer.jsp" %>