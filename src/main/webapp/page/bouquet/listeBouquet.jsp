
<%@ page import="com.example.voyage.voyage.Bouquet" %>
<%@ page import="com.example.voyage.dbUtil.ConnexionPgsql" %>
<%@ page import="java.sql.Connection" %>
<%
    Connection connect = ConnexionPgsql.dbConnect();
    Bouquet[] lsBouq = Bouquet.getAllBouquet(connect);
    connect.close();
%>
<%@include file="../structure/header.jsp"%>
    <h1>Liste des bouquets</h1>
    <ul class="list-group mt-3">
        <% for(int i=0;i<lsBouq.length;i++){ %>
            <li class="list-group-item">
                <span style="float:left;">
                    <%=lsBouq[i].getNom()%>
                </span>
                
                <span style="float: right">
                    <a href="/Voyage_war_exploded/page/bouquet/listeActiviteBouquet.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Voir les activités</a>
                    <a href="/Voyage_war_exploded/page/activite/ajouterActivite.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Ajouter activités</a>
                </span>
            </li>
        <%}%>
    </ul>
<%@include file="../structure/footer.jsp"%>