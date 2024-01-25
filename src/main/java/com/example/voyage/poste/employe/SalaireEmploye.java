package com.example.voyage.poste.employe;

import com.example.voyage.dbUtil.AssistantDb;

import java.util.*;
import java.sql.*;

public class SalaireEmploye
{
    int idEmp;
    String nom;
    String travail;
    double salaire;

    String label;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public SalaireEmploye[] getSalaireEmp(Connection connect)throws Exception{
        String sql="select * from v_salaire_employe";
        AssistantDb querier=new AssistantDb();
        Object[] ans = querier.donneeJavaTable(connect, sql, "com.example.voyage.poste.employe.SalaireEmploye");
        SalaireEmploye[] valiny= new SalaireEmploye[ans.length];
        for (int i = 0; i < ans.length; i++) {
            valiny[i]=(SalaireEmploye)ans[i];
        }
        return valiny;
    }
    public SalaireEmploye(){}

    //java.lang.Integer,java.lang.String,java.lang.String,java.lang.Double
    public SalaireEmploye(Integer idEmp,String nom,String travail,  Double salaire,String label)
    {
        setIdEmp(idEmp.intValue());
        setNom(nom);
        setTravail(travail);
        setSalaire(salaire.doubleValue());
        setLabel(label);
    }

    public SalaireEmploye(Integer idEmp,String nom,String travail, Double salaire)
    {
        setIdEmp(idEmp.intValue());
        setNom(nom);
        setTravail(travail);
        setSalaire(salaire.doubleValue());
    }

    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTravail() {
        return travail;
    }

    public void setTravail(String travail) {
        this.travail = travail;
    }

    public double getSalaire() {
        return salaire;
    }

    public void setSalaire(double salaire) {
        this.salaire = salaire;
    }
}