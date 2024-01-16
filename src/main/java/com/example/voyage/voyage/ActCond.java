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

public class ActCond {

    String nomVoyage;
    Integer idBouquet;
    String nomTypeVoyage;

    public static ActCond[] getFromBdById(String idActivite)throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql= "select voyage.nom as nomVoyage,voyage.idBouquet,typeVoyage.nom as nomTypeVoyage  \n" +
                    "from Nombre_activite_voyage,typeVoyage,voyage \n" +
                    "where  Nombre_activite_voyage.idVoyage=voyage.idVoyage \n" +
                    "and    voyage.idTypeVoyage=typeVoyage.idTypeVoyage \n" +
                     "and Nombre_activite_voyage.idActivite="+idActivite+" group by nomVoyage, idBouquet, nomTypeVoyage";
        Connection connect=ConnexionPgsql.dbConnect();
        Object[] valiny=querier.donneeJavaTable(connect, sql,"com.example.voyage.voyage.ActCond");
        ActCond[] toReturn=new  ActCond[valiny.length];
        for (int i = 0; i <valiny.length; i++) {
            toReturn[i]=(ActCond)valiny[i];
        }
        return toReturn;
    }  
    
    public ActCond(String nomVoyage,Integer idBouquet,String nomTypeVoyage){
        setIdBouquet(idBouquet);
        setNomTypeVoyage(nomTypeVoyage);
        setNomVoyage(nomVoyage);
    }
    
    
    public String getNomVoyage() {
        return nomVoyage;
    }

    public void setNomVoyage(String nomVoyage) {
        this.nomVoyage = nomVoyage;
    }

    public Integer getIdBouquet() {
        return idBouquet;
    }

    public void setIdBouquet(Integer idBouquet) {
        this.idBouquet = idBouquet;
    }

    public String getNomTypeVoyage() {
        return nomTypeVoyage;
    }

    public void setNomTypeVoyage(String nomTypeVoyage) {
        this.nomTypeVoyage = nomTypeVoyage;
    }

   
    
}
