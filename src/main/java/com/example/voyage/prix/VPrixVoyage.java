package com.example.voyage.prix;

import com.example.voyage.dbUtil.AssistantDb;
import java.sql.Connection;

public class VPrixVoyage {
    Double prix;
    String idVoyage;
    String nom;
    public VPrixVoyage[] getFromBdById(Connection connect, String min, String max) throws Exception {
        double prixMin = Double.valueOf(min);
        double prixMax = Double.valueOf(max);
        AssistantDb querier= new AssistantDb();
        String sql= "select * from v_prix_voyage where prix <= '"+prixMax+"' and prix >= '" +prixMin+"' order by prix" ;
        System.out.println(sql);
        Object[] valiny=querier.donneeJavaTable(connect, sql,"com.example.voyage.prix.VPrixVoyage");
        System.out.println(valiny.length + " staille");
        VPrixVoyage[] toReturn=new  VPrixVoyage[valiny.length];
        for (int i = 0; i <valiny.length; i++) {
            toReturn[i]=(VPrixVoyage) valiny[i];
        }
        return toReturn;
    }

    public VPrixVoyage(){}

    public VPrixVoyage(Double prix, String idVoyage, String nom) {
        this.setPrix(prix);
        this.setIdVoyage(idVoyage);
        this.setNom(nom);
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public String getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }
}
