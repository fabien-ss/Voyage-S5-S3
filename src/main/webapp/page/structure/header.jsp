<%--
  Created by IntelliJ IDEA.
  User: fabien
  Date: 12/19/23
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="text-align: center;">
    <a class="navbar-brand" href="#">VOYAGE</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../voyage/NouveauVoyage.jsp">Voyage</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../activite/nouvelleActivite.jsp">Activité</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../bouquet/listeBouquet.jsp">Bouquets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../stock/EtatDeStock.jsp">Etat de stock</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../billet/acheter.jsp">Achat billet</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../poste/ajoutMainDoeuvre.jsp">Poste</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../voyage/margeBeneficiaire.jsp">Modifier marge</a>
            </li>

        </ul>
    </div>
</nav>

<div class="container">