package com.example.voyage.voyage;

import com.example.voyage.dbUtil.ConnexionPgsql;
import generic.annotation.C;
import generic.dao.Model;
import generic.kodro.A;

import java.sql.Connection;
import java.util.List;

@C(t = "typevoyage")
public class TypeVoyage {
    @C(c = "idtypevoyage")
    String idType;
    @C
    String nom;

    public static void main(String[] args) throws Exception {
        Connection c = ConnexionPgsql.dbConnect();
        System.out.println(c);
        List<TypeVoyage> typeVoyageList = A.select(c, new TypeVoyage());
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
