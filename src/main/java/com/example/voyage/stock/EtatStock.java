package com.example.voyage.stock;


import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.voyage.NombreVoyageActivite;

import java.sql.Connection;

public class EtatStock extends Stock
{
    String nom;


    public int getIdActivite() {
        return idActivite;
    }

    public void setIdActivite(int idActivite) {
        this.idActivite = idActivite;
    }

    public Double getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = (double) quantite;
    }

    public EtatStock[] getAllByActivities(Connection connect, NombreVoyageActivite[] nombreVoyageActivites) throws Exception {
        String value = "";
        for (NombreVoyageActivite nb : nombreVoyageActivites){
            value += "'"+nb.getIdActivite()+"',";
        }
        value = value.substring(0, value.length()-1);
        AssistantDb querier= new AssistantDb();
        String sql="select * from v_etat_stock where idactivite in ("+value+")";
        sql = "select v_etat_stock.* from activite left join v_etat_stock on v_etat_stock.idactivite = activite.idactivite";
        System.out.println(sql);
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.stock.EtatStock");
        EtatStock[] toReturn=new EtatStock[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(EtatStock)valiny[i];
        }
        return toReturn ;
    }
    public EtatStock[] getAll(Connection connect) throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql="select activite.idactivite, coalesce(v_etat_stock.quantite, 0), activite.nom from activite left join v_etat_stock on v_etat_stock.idactivite = activite.idactivite";
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.stock.EtatStock");
        EtatStock[] toReturn=new EtatStock[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(EtatStock)valiny[i];
        }
        return toReturn ;
    }
    public EtatStock[] getEtatStock(Connection connect) throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql="select * from v_final_etat_stock where nom like '%"+this.nom.toLowerCase()+"%'";
        sql = "select activite.idactivite, coalesce(v_etat_stock.quantite, 0) quantite, activite.nom nom from activite  left join v_etat_stock on v_etat_stock.idactivite = activite.idactivite where  lower(activite.nom) like '%"+this.nom.toLowerCase()+"%'";
        System.out.println(sql);
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.stock.EtatStock");
        EtatStock[] toReturn=new EtatStock[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(EtatStock)valiny[i];
        }
        return toReturn ;
    }
    public EtatStock(){

    }
    public EtatStock(Integer idActivite,Long quantite, String nom)
    {
        setIdActivite(idActivite.intValue());
        setQuantite(quantite.intValue());
        this.setNom(nom);
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }
}