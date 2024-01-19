package com.example.voyage.horaire;

import com.example.voyage.dbUtil.AssistantDb;
import com.sun.jdi.connect.spi.Connection;

public class HoraireMainDoeuvre {
    Integer idMandoeuvre;
    Double heure;

    String idVoyage;

    public void insert(java.sql.Connection c) throws Exception {
        String sql = "insert into horairemaindoeuvre values('"+this.idMandoeuvre+"','"+this.heure+"','"+this.idVoyage+"')";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(c, sql);
    }

    public HoraireMainDoeuvre(){

    }
    public HoraireMainDoeuvre(Integer idMandoeuvre, Double heure, String idVoyage) {
        this.idMandoeuvre = idMandoeuvre;
        this.heure = heure;
        this.idVoyage = idVoyage;
    }

    public Integer getIdMandoeuvre() {
        return idMandoeuvre;
    }

    public void setIdMandoeuvre(Integer idMandoeuvre) {
        this.idMandoeuvre = idMandoeuvre;
    }

    public Double getHeure() {
        return heure;
    }

    public void setHeure(Double heure) {
        this.heure = heure;
    }

    public String getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }
}
