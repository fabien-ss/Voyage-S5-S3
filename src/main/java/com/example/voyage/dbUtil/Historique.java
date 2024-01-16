package com.example.voyage.dbUtil;

import java.sql.Connection;
import java.sql.Timestamp;

public class Historique {
    Integer idHistorique;
    Integer idActivite;
    Timestamp dateHistorique;
    Double prix;

    public void Insert(Connection connect) throws Exception {
        String sql = "insert into historique (idactivite, prix) values('"+this.idActivite+"','"+this.prix+"')";
        System.out.println(sql);
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(connect, sql);
    }

    public Historique(Integer idHistorique, Integer idActivite,Timestamp dateHistorique, Double prix) {
        this.idHistorique = idHistorique;
        this.idActivite = idActivite;
        this.setPrix(prix);
        this.setDateHistorique(dateHistorique);
    }

    public Historique(String idActivite, Double prix) {
        this.setIdActivite(Integer.valueOf(idActivite));
        this.setPrix(prix);
    }
    public Integer getIdHistorique() {
        return idHistorique;
    }

    public void setIdHistorique(Integer idHistorique) {
        this.idHistorique = idHistorique;
    }

    public Integer getIdActivite() {
        return idActivite;
    }

    public void setIdActivite(Integer idActivite) {
        this.idActivite = idActivite;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public void setDateHistorique(Timestamp dateHistorique) {
        this.dateHistorique = dateHistorique;
    }

    public Timestamp getDateHistorique() {
        return dateHistorique;
    }

    public  Historique(){

    }
}
