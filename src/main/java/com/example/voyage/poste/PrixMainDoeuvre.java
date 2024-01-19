package com.example.voyage.poste;

import com.example.voyage.dbUtil.AssistantDb;

import java.sql.Connection;
import java.sql.Timestamp;

public class PrixMainDoeuvre {
    Integer idPrix;
    Double prix;
    Timestamp date_prix;
    Integer idMainDoeuvre;

    public void insert(java.sql.Connection c) throws Exception {
        String sql = "insert into prixmaindoeuvre (idmaindoeuvre, prix, dateprix) values('"+this.idMainDoeuvre+"','"+this.prix+"',now())";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(c, sql);
    }
    public Integer getIdMainDoeuvre() {
        return idMainDoeuvre;
    }

    public void setIdMainDoeuvre(Integer idMainDoeuvre) {
        this.idMainDoeuvre = idMainDoeuvre;
    }

    public PrixMainDoeuvre(){}
    public PrixMainDoeuvre(Integer idPrix, Double prix, Timestamp date, Integer idMainDoeuvre) {
        this.idPrix = idPrix;
        this.prix = prix;
        this.date_prix = date;
        this.idMainDoeuvre = idMainDoeuvre;
    }

    public Integer getIdPrix() {
        return idPrix;
    }

    public void setIdPrix(Integer idPrix) {
        this.idPrix = idPrix;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Timestamp getDate_prix() {
        return date_prix;
    }

    public void setDate_prix(Timestamp date_prix) {
        this.date_prix = date_prix;
    }
}
