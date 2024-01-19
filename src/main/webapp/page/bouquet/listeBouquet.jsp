
<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%
    Connection connect = ConnexionPgsql.dbConnect();
    Bouquet[] lsBouq = Bouquet.getAllBouquet(connect);
    connect.close();
%>
<%@include file="../structure/header.jsp" %>
<%@include file="Header.jsp"%>
    <h1>Liste des bouquets valide (1)</h1>
    <ul class="list-group mt-3">
        <% for(int i=0;i<lsBouq.length;i++){ %>
            <li class="list-group-item">
                <span style="float:left;">
                    <%=lsBouq[i].getNom()%>
                </span>
                
                <span style="float: right">
                    <a href="/Voyage-1.0-SNAPSHOT/page/bouquet/listeActiviteBouquet.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Voir les activités</a>
                    <a href="/Voyage-1.0-SNAPSHOT/page/activite/ajouterActivite.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Ajouter activités</a>
                </span>
            </li>
        <%}%>
    </ul>
<%@include file="../structure/footer.jsp"%>