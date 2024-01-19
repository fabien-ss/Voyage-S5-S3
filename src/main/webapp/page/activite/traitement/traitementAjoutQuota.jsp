<%@ page import="com.example.voyage.stock.EntreeStock" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %><%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 1/13/24
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("ok") != null) {
        try {
            Connection connection = ConnexionPgsql.dbConnect();
            EntreeStock entreeStock = new EntreeStock(request.getParameter("idactivite"),
                    request.getParameter("nombre"));
            entreeStock.Insert(connection);
            connection.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
    response.sendRedirect("../../stock/EtatDeStock.jsp");
%>
