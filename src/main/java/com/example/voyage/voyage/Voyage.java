package com.example.voyage.voyage;

import com.example.voyage.dbUtil.AssistantDb;
import generic.annotation.C;
import generic.annotation.P;

import java.sql.Connection;

@P(p="V", l=5, s="seq_voyage")
@C(t = "voyage")
public class Voyage {
    @C(c = "idvoyage", pk = true)
    String idVoyage;
    @C(c= "nom")
    String nom;
    @C(c = "idbouquet")
    Integer idBouquet;
    @C(c = "idtypevoyage")
    String idTypeVoyage;

    public Voyage(){

    }

    public Bouquet getBouquet(Connection connection) throws Exception {
        Bouquet bouquet1 = Bouquet.getBouquetById(connection, this.idBouquet.toString());
        bouquet1.listActivite = bouquet1.getListActivite(connection);
        return bouquet1;
    }

    public Voyage(String idVoyage, String nom, Integer idBouquet, String idTypeVoyage) {
        this.setIdVoyage(idVoyage);
        this.setNom(nom);
        this.setIdBouquet(idBouquet.toString());
        this.setIdTypeVoyage(idTypeVoyage);
    }

    public Voyage(String nom, String idBouquet, String idTypeVoyage, Connection c) throws Exception {

        this.nom = nom;
        this.setIdBouquet(idBouquet);
        this.idTypeVoyage = idTypeVoyage;
    }
    public Voyage(String nom, String idBouquet, Integer idTypeVoyage, Connection c) throws Exception {
        this.nom = nom;
        this.setIdBouquet(idBouquet);

        this.idTypeVoyage = idTypeVoyage.toString();
    }

    public void setIdBouquet(Integer idBouquet) {
        this.idBouquet = idBouquet;
    }

    public Voyage[] getAll(Connection connect) throws Exception {
        AssistantDb querier= new AssistantDb();
        String sql="select * from voyage";
        Object[] valiny=querier.donneeJavaTable(connect,sql,"com.example.voyage.voyage.Voyage");
        Voyage[] toReturn=new Voyage[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(Voyage) valiny[i];
        }
        return toReturn ;
    }
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getIdBouquet() {
        return idBouquet;
    }

    public void setIdBouquet(String idBouquet) {
        this.setIdBouquet(Integer.valueOf(idBouquet));
    }

    public String getIdTypeVoyage() {
        return idTypeVoyage;
    }

    public void setIdTypeVoyage(String idTypeVoyage) {
        this.idTypeVoyage = idTypeVoyage;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }

    public String getIdVoyage() {
        return idVoyage;
    }

}
