package com.example.voyage.stock;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.dbUtil.Historique;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Vector;

public class EntreeStock extends Stock{
    Timestamp date;
    public void Insert(Connection connect) throws Exception {
        String sql="insert into entree_stock(idactivite,quantite) values('"+this.idActivite+"',"+this.quantite+")";
        //
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(connect, sql);
    }
    public EntreeStock(){

    }
    public EntreeStock(Integer idActivite, Double quantite, Timestamp date) throws Exception {
        this.setIdActivite(idActivite);
        this.setQuantite(quantite);
        this.setDate(date);
    }

    public EntreeStock(String idActivite, String quantite) throws Exception {
        this.setIdActivite(idActivite);
        this.setQuantite(quantite);
        this.setDate(date);
    }

    public Integer getIdActivite() {
        return idActivite;
    }

    public void setIdActivite(Integer idActivite) {
        this.idActivite = idActivite;
    }

    public void setIdActivite(String idActivite) {
       this.setIdActivite(Integer.valueOf(idActivite));
    }

    public Double getQuantite() {
        return quantite;
    }

    public void setQuantite(Double quantite) throws Exception{
        if(quantite <= 0) throw new Exception("Quantite invalide "+quantite);
        this.quantite = quantite;
    }

    public void setQuantite(String quantites) throws Exception{
        Double quantite = Double.valueOf(quantites);
        if(quantite <= 0) throw new Exception("Quantite invalide "+quantite);
        this.setQuantite(quantite);
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
