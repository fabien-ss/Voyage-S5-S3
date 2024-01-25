/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.voyage.voyage;

import java.sql.*;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.dbUtil.Historique;
import generic.annotation.C;
import generic.annotation.P;

@C(t = "activite")
@P(l = 5, s= "seq_activite", p = "AC")
public class Activite {

    @C(c = "idactivite", pk = true)
    Integer idActivite;
    @C(c = "nom")
    String nom;
    @C(c = "prix_unitaire")
    Double prix;

    public Activite[] getActiviteByIdBouquet(Connection c, String idBouquet) throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql="select * from activite where idactivite not in (select idactivite from assocbouqact where idbouquet='"+idBouquet+"')";
        System.out.println(sql);
        Object[] valiny=querier.donneeJavaTable(c,sql,"com.example.voyage.voyage.Activite");
        Activite[] toReturn=new Activite[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(Activite)valiny[i];
        }
        return toReturn ;
    }
    public static Activite[] getMissingActivities(Connection connect, String idBouquet)throws Exception
    {
        AssistantDb querier= new AssistantDb();
        String sql="select * from activite where idactivite not in (select idactivite from assocbouqact where idbouquet='"+idBouquet+"')";
        System.out.println(sql);
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.voyage.Activite");
        Activite[] toReturn=new Activite[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(Activite)valiny[i];
        }
        return toReturn ;
    }

    public static Activite[] getAllActivities(Connection connect)throws Exception
    {
        AssistantDb querier= new AssistantDb();
        String sql="select * from activite";
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.voyage.Activite");
        Activite[] toReturn=new Activite[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
             toReturn[i]=(Activite)valiny[i];
        }
        return toReturn ;
    }

    public void updateActivite(Connection connect) throws Exception {
        String udpatesql = "update activite set prix_unitaire = '"+this.prix+"' where idactivite='"+this.idActivite+"'";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(connect, udpatesql);
        Historique historique = new Historique(this.idActivite+"", Double.valueOf(this.prix));
        historique.Insert(connect);
    }
    public void insertActivite(Connection connect )throws Exception  {
        String sql="insert into Activite(nom,prix_unitaire) values('"+this.nom+"',"+this.prix+")";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(connect, sql);
    }

    public Activite(Integer idActivite, String nom, Double prix) throws Exception {
        this.setNom(nom);
        this.setIdActivite(idActivite.toString());
        this.setPrix(prix);
    }

    public Activite(String nom, String prix) throws Exception {
        this.setNom(nom);
        this.setPrix(prix);
    }


    public void setPrix(double prix) throws Exception {
        if(prix < 0) throw new Exception("Prix invalide");
        this.prix = prix;
    }
    public void setPrix(String prix) throws Exception {
        this.setPrix(Double.valueOf(prix));
    }
    public double getPrix() {
        return prix;
    }

    public Activite(){}
    public Activite(String nom, Connection c) throws Exception {
        setNom(nom);
    }

    public int getIdActivite() {
        return idActivite;
    }

    public void setIdActivite(int idActivite) {
        this.idActivite = idActivite;
    }
    public void setIdActivite(String idActivite) {
        this.setIdActivite(Integer.valueOf(idActivite));
    }
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setIdActivite(Integer idActivite) {
        this.idActivite = idActivite;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }
}
