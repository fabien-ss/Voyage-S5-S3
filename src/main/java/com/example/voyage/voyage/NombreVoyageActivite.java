/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.voyage.voyage;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.dbUtil.ConnexionPgsql;
import com.example.voyage.stock.*;

import java.sql.Connection;

public class NombreVoyageActivite {
    String idVoyage;
    Integer idActivite;
    Integer nombre;


    public void insererSortieStock(Connection connect,String idVoyage,String nbVoyages)throws Exception{
        boolean mine = false;

        int nbVoyage = Integer.valueOf(nbVoyages);
        NombreVoyageActivite[] depense = getNbActiviteWithForNbVoyage(connect,idVoyage,nbVoyage);
        EtatStock[] ressource=(new EtatStock()).getAll(connect);
        for (int i=0;i < depense.length;i++ ) {
            for (int j=0;j<ressource.length ;j++ ) {
                System.out.println((depense[i].idActivite.intValue()==ressource[j].getIdActivite()) + "ds");
                if (depense[i].idActivite.intValue()==ressource[j].getIdActivite()) {
                    if (depense[i].nombre.intValue()>ressource[j].getQuantite()) {
                        int tsyampy = depense[i].nombre.intValue()-ressource[j].getQuantite().intValue();
                        throw new Exception("pas assez de "+ressource[j].getNom()+ " "+tsyampy);
                    }
                }
            }
        }
        inserezSortie(connect,depense);
      //  if(mine) connect.close();
    }


    public void inserezSortie(Connection connect,NombreVoyageActivite[] sortie) throws Exception {
        AssistantDb querier=new AssistantDb();
        for (int i=0;i<sortie.length ;i++ ) {
            String sql="insert into sortie_stock(idActivite,quantite) values("+sortie[i].idActivite.toString()+","+ sortie[i].nombre.toString()+")";
            System.out.println(sql);
            querier.upDateDB(connect,sql);
        }
    }



    public NombreVoyageActivite[]  getNbActiviteWithForNbVoyage(Connection connect,String idVoyage,int nbVoyage)throws Exception{
        NombreVoyageActivite[] lsNbActiviteVoyage=getNbActiviteFor(connect,idVoyage);
        for (int i=0;i<lsNbActiviteVoyage.length ;i++ ) {
            System.out.println("nombre "+Integer.valueOf(lsNbActiviteVoyage[i].nombre.intValue()));
            System.out.println("id activite "+Integer.valueOf(lsNbActiviteVoyage[i].idActivite.intValue()));
            System.out.println("nombre voyage "+nbVoyage);
            lsNbActiviteVoyage[i].setNombre(  Integer.valueOf(lsNbActiviteVoyage[i].nombre.intValue()*nbVoyage));
            System.out.println(lsNbActiviteVoyage[i].getNombre());
        }
        return lsNbActiviteVoyage;
    }
    public NombreVoyageActivite[] getNbActiviteFor(Connection connect,String idVoyage)throws Exception
    {
        String sql="select idVoyage,idActivite,nombre from  v_activite_pan where idVoyage='"+idVoyage+"'";
        AssistantDb querier= new AssistantDb();
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.voyage.NombreVoyageActivite");
        NombreVoyageActivite[] answer=new NombreVoyageActivite[valiny.length];
        for (int i=0;i<valiny.length ;i++ )
        {
            answer[i]=(NombreVoyageActivite)valiny[i];
        }
        return answer;
    }
    public static void insertLsData(String[] idActivite,String[] nombre,String idVoyage)throws Exception{
        System.out.println(idActivite.length + "taille");
        for (int i = 0; i <idActivite.length; i++) {
            System.out.println("Activite id");
            System.out.println(idActivite[i]);
            NombreVoyageActivite.insertIntoTabCorrespondance(idActivite[i], nombre[i], idVoyage);
        }
    }
    public static void insertIntoTabCorrespondance(String idActivite,String nombre,String idVoyage)throws Exception{
        String sql="insert into  Nombre_activite_voyage values('"+idVoyage+"','"+idActivite+"','"+nombre+"')";
        AssistantDb querier= new AssistantDb();
        System.out.println(sql);
        Connection connect=ConnexionPgsql.dbConnect();
        querier.upDateDB(connect, sql);
        connect.commit();
        connect.close();
    }

    public NombreVoyageActivite(){}
    public NombreVoyageActivite(String idVoyage,Integer idActivite,Integer nombre){
        setIdActivite(idActivite);
        setIdVoyage(idVoyage);
        setNombre(nombre);
    }

    public String getIdVoyage() {
        return idVoyage;
    }

    public Integer getIdActivite() {
        return idActivite;
    }

    public Integer getNombre() {
        return nombre;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }

    public void setIdActivite(Integer idActivite) {
        this.idActivite = idActivite;
    }

    public void setNombre(Integer nombre) {
        this.nombre = nombre;
    }



}