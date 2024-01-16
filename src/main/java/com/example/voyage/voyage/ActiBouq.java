/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.voyage.voyage;

import java.sql.*;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.dbUtil.ConnexionPgsql;
import generic.annotaion.Correspondance;
import generic.dao.Model;
import com.example.voyage.*;


@Correspondance(nomTable = "v_bouquetActivite")
public class ActiBouq extends Model {

    @Correspondance(nomColonne = "idActivite")
    int idActivite;
    @Correspondance(nomColonne = "idBouquet")
    int idBouquet;
    @Correspondance(nomColonne = "nomBouquet")
    String nomBouquet;
    @Correspondance(nomColonne = "nomActivite")
    String nomActivite;

    public ActiBouq(String idb, String id) {
        this.setIdBouquet(Integer.parseInt(idb));
        this.setIdActivite(Integer.parseInt(id));
    }

    public ActiBouq() {

    }

    public void ajouterActiBouq(Connection connect) throws Exception {
        //this.insert(connect);
        String sql="insert into  AssocBouqAct(idBouquet,idActivite) values("+this.idBouquet+","+ this.idActivite+")";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(connect, sql);
    }
    
    public ActiBouq[] getActiBouqById(Connection connect)throws Exception{
        String sql="select * from v_bouquetActivite where idBouquet="+this.idBouquet;
        AssistantDb querier= new AssistantDb();
        Object[] lsBouqBrut=querier.donneeJavaTable(connect, sql,"com.example.voyage.voyage.ActiBouq");
        ActiBouq[] toReturn=new ActiBouq[lsBouqBrut.length];
        for(int i=0;i<lsBouqBrut.length;i++){
            System.out.println(((ActiBouq)lsBouqBrut[i]).getIdActivite());
            toReturn[i]=(ActiBouq) lsBouqBrut[i];
        }
        return toReturn;
    }
    
    public ActiBouq(Integer idBouquet,Integer idActivite,String nomBouquet,String nomActivite) throws Exception {
        setIdBouquet(idBouquet.intValue());
        setIdActivite(idActivite.intValue());
        setNomBouquet(nomBouquet);
        setNomActivite(nomActivite);
    }

    public int getIdBouquet() {
        return idBouquet;
    }

    public void setIdBouquet(int idBouquet) {
        this.idBouquet = idBouquet;
    }

    public int getIdActivite() {
        return idActivite;
    }

    public void setIdActivite(int idActivite) {
        this.idActivite = idActivite;
    }

    public String getNomBouquet() {
        return nomBouquet;
    }

    public void setNomBouquet(String nomBouquet) throws Exception {
        if(nomBouquet == null || nomBouquet =="") throw new Exception("Non bouquet doit être un nom valide");
        this.nomBouquet = nomBouquet;
    }

    public String getNomActivite() {
        return nomActivite;
    }

    public void setNomActivite(String nomActivite) {
        this.nomActivite = nomActivite;
    }

    public void setIdBouquet(String idBouquet) throws Exception {
        try{
            this.setIdBouquet(Integer.valueOf(idBouquet));
        }
        catch (Exception e){
            throw new Exception("Impossible de convertir la valeur");
        }
    }
}
