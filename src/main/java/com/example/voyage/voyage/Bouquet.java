/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.voyage.voyage;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.dbUtil.ConnexionPgsql;
import generic.annotaion.Correspondance;
import generic.dao.Model;

import java.sql.*;
import java.util.List;

@Correspondance(nomTable = "bouquet")
public class Bouquet extends Model {
    @Correspondance(nomColonne = "idbouquet")
    int idBouquet;
    @Correspondance(nomColonne = "nom")
    String nom;

    ActiBouq[] listActivite;

    public ActiBouq[] getListActivite(Connection connection) throws Exception {
        ActiBouq actiBouq = new ActiBouq();
        actiBouq.setIdBouquet(this.idBouquet);
        return actiBouq.getActiBouqById(connection);
    }

    public void insertBouquet(Connection Connect) throws Exception {
        String sql="insert into Bouquet(nom) values('"+this.nom+"')";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(Connect, sql);
    } 
    public static Bouquet getBouquetById(Connection connect,String idBouq)throws Exception
    {
        int idBouquet=Integer.valueOf(idBouq);
        Bouquet[] lsBouquet=Bouquet.getAllBouquet(connect);
        for(int i=0;i<lsBouquet.length;i++){
            if(lsBouquet[i].getIdBouquet()==idBouquet){
                return lsBouquet[i];
            }
        }
        throw new Exception("tsy mahita ");
    }
    public static Bouquet[] getAllBouquet(Connection connect)throws Exception 
    {
        AssistantDb querier= new AssistantDb();
        String sql="select * from bouquet";
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.voyage.Bouquet");
        Bouquet[] toReturn=new Bouquet[valiny.length];
        for(int i=0;i<toReturn.length;i++){
             toReturn[i]=(Bouquet)valiny[i];
             System.out.println(toReturn[i].getNom());
        }
        return toReturn ;
    }
    public Bouquet(Integer idBouquet,String nom) throws Exception {
        setIdBouquet(idBouquet.intValue());
        setNom(nom);
    }

    public Bouquet(String nom) {
        this.nom = nom;
    }

    public int getIdBouquet() {
        return idBouquet;
    }

    public void setIdBouquet(int idBouquet) {
        this.idBouquet = idBouquet;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws Exception {
        if(nom.equals(null) | nom.equals("")) throw new Exception("Invalide nom");
        this.nom = nom;
    }
            
}
