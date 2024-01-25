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
<%@include file="Header.jsp"%>

<div class="col-9">
    <div class="row mt-5">
        <div class="col-4">
            <div class="formulaire">
                <form action="EtatDeStock.jsp" class="form-control" method="post">
                    <div class="form-group">
                        <label class="col-form-label">Nom </label>
                        <input type="text" name="nomactivite" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary mt-3" name="ok">
                </form>
            </div>
            <div>
                <form action="EtatDeStock.jsp" class="form-control" method="post">
                    <div class="form-group">
                        <label class="col-form-label">Max </label>
                        <input type="number" name="nomactivite" class="form-control">
                        <label class="col-form-label">Min </label>
                        <input type="number" name="nomactivite" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary mt-3" name="ok">
                </form>
            </div>
        </div>
        <div class="col-8">
            <table class="table table-bordered">
                <tr>
                    <th>Nom</th>
                    <th>Nombre</th>
                </tr>
                <% for (EtatStock etat: etatStocks) { %>
                    <tr>
                        <td><%=etat.getNom()%></td>
                        <td><%=etat.getQuantite()%></td>
                    </tr>
                <% } %>
            </table>
        </div>
    </div>
</div>
<style>
    th, td{
        width: 50%;
    }
</style>
<%@include file="../structure/footer.jsp" %>