package com.example.voyage.poste.employe;

import generic.annotation.C;
import generic.annotation.P;
import generic.kodro.A;

import java.sql.Connection;
import java.sql.Timestamp;

@C(t = "employe")
@P(p = "", l=0, s = "employe_idemp_seq")
public class Employe {
    @C(c = "idEmp")
    Integer idEmploye;
    @C(c = "nom")
    String nom;
    @C(c = "prenom")
    String prenom;
    @C(c = "dateEmbauche")
    Timestamp dateEmbauche;
    @C(c = "dateResiliation")
    Timestamp dateResiliation;
    @C(c = "idmaindoeuvre")
    String idMaindOuvre;

    public void setDateResiliation(Timestamp dateResiliation) {
        this.dateResiliation = dateResiliation;
    }

    public void modifierDateEmbauche(Connection c, String idEmpTarget, String nouvelleDate) throws Exception {
        this.setIdEmploye(idEmpTarget);
        Employe newEmp = new Employe();
        newEmp.setDateEmbauche(nouvelleDate);
        A.update(c, this, newEmp);
    }
    public Employe(){}
    public Employe(String nom, String prenom, Timestamp dateEmbauche, String idMaindOuvre) {
        this.setNom(nom);
        this.setPrenom(prenom);
        this.setDateEmbauche(dateEmbauche);
        this.setIdMaindOuvre(idMaindOuvre);
    }
    public Employe(String nom, String prenom, String dateEmbauche, String idMaindOuvre) {
        this.setNom(nom);
        this.setPrenom(prenom);
        this.setDateEmbauche(dateEmbauche);
        this.setIdMaindOuvre(idMaindOuvre);
    }


    public void setIdEmploye(String idEmploye){
        this.setIdEmploye(Integer.valueOf(idEmploye));
    }
    public Integer getIdEmploye() {
        return idEmploye;
    }

    public void setIdEmploye(Integer idEmploye) {
        this.idEmploye = idEmploye;
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

    public Timestamp getDateEmbauche() {
        return dateEmbauche;
    }

    public void setDateEmbauche(String dateEmbauche) {
        System.out.println("date "+dateEmbauche);
        dateEmbauche = dateEmbauche.replace("T", " ").concat(":00");
        System.out.println("final "+dateEmbauche);
        this.setDateEmbauche(Timestamp.valueOf(dateEmbauche));
    }

    public void setDateEmbauche(Timestamp dateEmbauche) {
        this.dateEmbauche = dateEmbauche;
    }

    public String getIdMaindOuvre() {
        return idMaindOuvre;
    }

    public void setIdMaindOuvre(String idMaindOuvre) {
        this.idMaindOuvre = idMaindOuvre;
    }
}
