package com.example.voyage.voyage;

import com.example.voyage.dbUtil.ConnexionPgsql;
import generic.annotaion.Correspondance;
import generic.dao.Model;

import java.sql.Connection;
import java.util.List;

@Correspondance(nomTable = "typevoyage")
public class TypeVoyage extends Model {
    @Correspondance(nomColonne = "idtypevoyage")
    String idType;
    @Correspondance
    String nom;

    public static void main(String[] args) throws Exception {
        Connection c = ConnexionPgsql.dbConnect();
        System.out.println(c);
        List<TypeVoyage> typeVoyageList = new TypeVoyage().select(c);
        for (TypeVoyage t: typeVoyageList) {
            System.out.println(t.nom);
        }
    }
    public TypeVoyage(){

    }
    public TypeVoyage(String idType, String nom) {
        this.idType = idType;
        this.nom = nom;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
