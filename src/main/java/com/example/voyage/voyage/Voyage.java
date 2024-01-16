package com.example.voyage.voyage;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.stock.EtatStock;
import generic.annotaion.Correspondance;
import generic.dao.Model;

import java.sql.Connection;

@Correspondance(nomTable = "voyage")
public class Voyage extends Model {
    @Correspondance(nomColonne = "idvoyage", primarykey = true)
    String idVoyage;
    @Correspondance(nomColonne = "nom")
    String nom;
    @Correspondance(nomColonne = "idbouquet")
    Integer idBouquet;
    @Correspondance(nomColonne = "idtypevoyage")
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
        this.setPrefixe("V");
        this.setLongPK(7);
        this.setSequence("seq_voyage");
        this.idVoyage = this.construirePK(c);
        this.nom = nom;
        this.setIdBouquet(idBouquet);
        this.idTypeVoyage = idTypeVoyage;
    }
    public Voyage(String nom, String idBouquet, Integer idTypeVoyage, Connection c) throws Exception {
        this.setPrefixe("V");
        this.setLongPK(7);
        this.setSequence("seq_voyage");
        this.idVoyage = this.construirePK(c);
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
