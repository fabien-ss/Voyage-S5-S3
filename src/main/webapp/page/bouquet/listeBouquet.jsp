
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
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <h1>Liste des bouquets valide (1)</h1>
        <ul  class="max-w-md space-y-1 text-gray-500 list-disc list-inside dark:text-gray-400">
            <% for(int i=0;i<lsBouq.length;i++){ %>
                <li>
                    <%=lsBouq[i].getNom()%>
                    <ol  class="ps-5 mt-2 space-y-1 list-decimal list-inside">
                        <li>
                            <a href="./listeActiviteBouquet.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Voir les activités</a>
                        </li>
                        <li>
                            <a href="../activite/ajouterActivite.jsp?idBouquet=<%=lsBouq[i].getIdBouquet()%>">Ajouter activités</a>
                        </li>
                    </ol>
                </li>
            <%}%>
        </ul>

</div>

<%@include file="../structure/footer.jsp"%>