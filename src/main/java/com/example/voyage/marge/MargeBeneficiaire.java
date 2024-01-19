package com.example.voyage.marge;

import com.example.voyage.dbUtil.AssistantDb;

import java.sql.Timestamp;

public class MargeBeneficiaire {
    String idVoyage;
    Double pourcentage;
    Timestamp dateMarge;

    static public MargeBeneficiaire getALlMarge(java.sql.Connection connect,String idtravel) throws Exception
    {
        String sql="select * from margeBeneficiaire where idVoyage="+idtravel;
        AssistantDb querier=new AssistantDb();
        Object[] result=querier.donneeJavaTable(connect, sql,"com.example.voyage.marge.MargeBeneficiaire");
        return (MargeBeneficiaire) result[0];
    }


    public void insert(java.sql.Connection c) throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql1 = "delete from margebeneficiaire where idvoyage='"+this.idVoyage+"'";
        String sql = "insert into margebeneficiaire (idvoyage, pourcentage, datemarge) values('"+this.idVoyage+"','"+this.pourcentage+"',now())";
        querier.upDateDB(c, sql1);
        querier.upDateDB(c, sql);
    }

    public MargeBeneficiaire(){}
    public MargeBeneficiaire(String idVoyage, Double pourcentage, Timestamp dateMarge) {
        this.idVoyage = idVoyage;
        this.pourcentage = pourcentage;
        this.dateMarge = dateMarge;
    }

    public String getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }

    public Double getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(Double pourcentage) {
        this.pourcentage = pourcentage;
    }

    public Timestamp getDateMarge() {
        return dateMarge;
    }

    public void setDateMarge(Timestamp dateMarge) {
        this.dateMarge = dateMarge;
    }
}
