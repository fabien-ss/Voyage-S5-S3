<%@ page import="com.example.voyage.stock.EtatStock" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/11/24
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = ConnexionPgsql.dbConnect();
    EtatStock[] etatStocks = new EtatStock().getAll(connection);
    if(request.getParameter("ok")!=null){
        EtatStock etatStock = new EtatStock();
        etatStock.setNom(request.getParameter("nomactivite"));
        etatStocks = etatStock.getEtatStock(connection);
    }
    connection.close();
%>

<%@include file="../structure/header.jsp" %>
<h1>Etat de stock</h1>
<div class="row">
    <div class="col-4">
        <form action="EtatDeStock.jsp" class="form-control" method="post">
            <div class="form-group">
                <label class="col-form-label">Nom </label>
                <input type="text" name="nomactivite" class="form-control">
            </div>
            <input type="submit" class="btn btn-primary mt-3" name="ok">
        </form>
    </div>
    <div class="col-8">
        <table class="table table-bordered">
            <tr>
                <th>Nom</th>
                <th>Nombre</th>
                <th>Ajouter</th>
                <th>Option</th>
            </tr>
            <% for (EtatStock etat: etatStocks) { %>
                <tr>
                    <td><%=etat.getNom()%></td>
                    <td><%=etat.getQuantite()%></td>
                    <form action="../activite/traitement/traitementAjoutQuota.jsp" method="post">

                        <input type="hidden" name="idactivite" value="<%=etat.getIdActivite()%>">
                        <td>
                            <input type="number" name="nombre" class="form-control">
                        </td>
                        <td>
                        <input type="submit" name="ok" class="btn btn-primary mt-3">
                        </td>
                    </form>
                </tr>
            <% } %>
        </table>
    </div>
</div>
<style>
    th, td{
        width: 25%;
    }
</style>
<%@include file="../structure/footer.jsp" %>