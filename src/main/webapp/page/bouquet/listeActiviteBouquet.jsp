<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="com.example.voyage.voyage.ActiBouq" %>
<%@ page import="java.sql.Connection" %>
<%
    if(request.getParameter("idBouquet") == null) response.sendRedirect("./listeBouquet.jsp");
    String error = null;
    ActiBouq[] activiteBouquet = new ActiBouq[0];
    try{
        Connection connect=ConnexionPgsql.dbConnect();
        ActiBouq actiBouq = new ActiBouq();
        actiBouq.setIdBouquet(request.getParameter("idBouquet"));
        activiteBouquet = actiBouq.getActiBouqById(connect);
        connect.close();
    }
    catch (Exception e){
        error = e.getMessage();
    }
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <div class="row">
        <table class="table">
            <tr>
                <th>Nom bouquet</th>
                <th>Nom Activité</th>
            </tr>
            <% for(int i = 0; i < activiteBouquet.length; i++){  %>
                <tr>
                    <td>
                        <%=activiteBouquet[i].getNomActivite() %>
                        <a href="../activite/updatePrix.jsp?idActivite=<%=activiteBouquet[i].getIdActivite()%>">
                            modifier prix
                        </a>
                    </td>
                </tr>    
            <% } %>
        </table>
        <%if(error != null){%>
            <div class="alert-danger">
                <h2><%=error%>/h2>
            </div>
        <% } %>
    </div>
<%@include file="../structure/footer.jsp" %>