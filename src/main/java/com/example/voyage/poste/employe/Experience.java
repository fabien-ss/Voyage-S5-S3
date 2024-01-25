package com.example.voyage.poste.employe;

import generic.annotation.C;
import generic.annotation.P;
import generic.kodro.A;

import java.sql.Connection;

@C(t = "experience")
@P(p = "", l = 0, s = "experience_idexperience_seq")
public class Experience {
    @C(c= "idexperience")
    Integer idExperience;
    @C(c="nbanneemax")
    Integer nbAnneeMax;
    @C(c="nbanneemin")
    Integer nbAnneMin;
    @C(c = "multiplicationsalaire")
    Integer valeur;
    @C(c= "label")
    String label;

    public void setValeur(Integer valeur) {
        this.valeur = valeur;
    }

    public Integer getValeur() {
        return valeur;
    }

    public void setNbAnneeMax(Integer nbAnneeMax) {
        this.nbAnneeMax = nbAnneeMax;
    }

    public void setNbAnneMin(Integer nbAnneMin) {
        this.nbAnneMin = nbAnneMin;
    }

    public Integer getNbAnneeMax() {
        return nbAnneeMax;
    }

    public Integer getNbAnneMin() {
        return nbAnneMin;
    }

    public void insetionparam(String param, Connection c) throws Exception {
        String[] ps = param.split(";");
        for (String p: ps){
            String[] t = p.split("=");

            Experience toUpDate = new Experience();

            toUpDate.setIdExperience(Integer.valueOf(t[0]));
            Experience experience = new Experience();
            experience.setNbAnneeMax(Integer.valueOf(t[2]));
            experience.setNbAnneMin(Integer.valueOf(t[1]));

            A.update(c, toUpDate, experience);

        }
    }

    public Experience(){}

    public Experience(Integer nbAnnee, String label) {
        this.nbAnneMin = nbAnnee;
        this.label = label;
    }

    public Integer getIdExperience() {
        return idExperience;
    }

    public void setIdExperience(Integer idExperience) {
        this.idExperience = idExperience;
    }


    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
