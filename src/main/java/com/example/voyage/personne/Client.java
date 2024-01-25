package com.example.voyage.personne;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.voyage.ActiBouq;

public class Client{

    int idClient;
    String nom;
    String prenom;
    java.sql.Date dateInsrciption;

    public Client(){}
    public Client(Integer idClient, String nom, String prenom, Date dateInsrciption) {
        this.idClient = idClient;
        this.nom = nom;
        this.prenom = prenom;
        this.dateInsrciption = dateInsrciption;
    }

    public static Client[] getAll(Connection connect)throws Exception{
        String sql="select * from client";
        AssistantDb querier= new AssistantDb();
        Object[] lsBouqBrut=querier.donneeJavaTable(connect, sql,"com.example.voyage.personne.Client");
        Client[] toReturn=new Client[lsBouqBrut.length];
        for(int i=0;i<lsBouqBrut.length;i++){
            toReturn[i]=(Client) lsBouqBrut[i];
        }
        return toReturn;
    }

    public static void insertAchatAndDetails(Connection connect ,String idClient,String idVoyage,String nbHomme,String nbFemme,String nbBillet)throws  Exception{
/*
        if ((new Integer(nbHomme)).intValue()+new Integer(nbFemme).intValue()!=new Integer(nbBillet).intValue()) {
            throw new Exception("erreur de valeur");
        }*/
        String sql1="insert into achat(idClient,nombre,dateVente,idVoyage) "
                + "values("+idClient+","+nbBillet+",now(),'"+idVoyage+"')";
        System.out.println(sql1);
        AssistantDb querier =new AssistantDb();
        querier.upDateDB(connect, sql1);
        int lastAchat=getLastAchat(connect);

        int nombreHomme = Integer.valueOf(nbHomme);

        for (int i = 0; i <Integer.valueOf(nbBillet); i++) {
            int genre=0;
            String temporaire = "";
            if(i<nombreHomme){
                temporaire="insert into detailsAchat(idAchat,genre) "+
                        "values("+lastAchat+","+1+")";
            }else {
                temporaire="insert into detailsAchat(idAchat,genre) "+
                        "values("+lastAchat+","+genre+")";
            }
            querier.upDateDB(connect, temporaire);
        }
    }

    public static void insert(Connection c, String a, String b) throws Exception {
        String sql = "insert into client (nom, prenom, dateinscription) values('"+a+"','"+b+"', now())";
        new AssistantDb().upDateDB(c,sql);
    }

    public static int getLastAchat(Connection connect)throws Exception{
        String sql="select max(idachat) from achat";
        Vector ans=(new AssistantDb()).traitementDonnees(connect, sql);
        return ((Integer)(((Object[])(ans.elementAt(0)))[0])).intValue();

    }

    public  void insertClient(Connection connect) throws Exception {
        String sql="insert into client(nom,prenom,dateInscription) values('"+this.nom+"',"+"'"+this.prenom+"','now()')";
        (new AssistantDb()).upDateDB(connect,sql);
    }

    public Client(String nom ,String prenom){
        this.nom=nom;
        this.prenom=prenom;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }





}