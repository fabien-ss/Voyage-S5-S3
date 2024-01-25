package com.example.voyage.voyage;

import generic.annotation.C;

import java.util.List;

@C(t="v_distribution_homme_femme")
public class VDistributionFemmeHomme {
    @C(c = "idvoyage")
    String idVoyage;
    @C(c = "nom")
    String nom;
    @C(c = "genre")
    Integer genre;
    @C(c = "nombre")
    Integer nombre;

    public static String[] distribution(List<VDistributionFemmeHomme> distributionFemmeHommes){
        String[] retour = new String[2];
        String pourcenage = "";
        String sexe = "";
        // ["#1C64F2", "#9061F9"]
        if(distributionFemmeHommes.size() == 0){
            retour[0] = "[70, 0]";
            retour[1] = "['Femme', 'Homme']";
            return retour;
        }
        for (VDistributionFemmeHomme v : distributionFemmeHommes){
            pourcenage += v.getDispertion(distributionFemmeHommes) + ",";
            sexe += "'" + v.getGenreString() + "',";
        }
/*        pourcenage = pourcenage.substring(0, -1);
        sexe = sexe.substring(0, -1);
*/
        retour[0] = "[" + pourcenage + "]";
        retour[1] = "[" + sexe + "]";
        System.out.println(retour[0]);
        System.out.println(retour[1]);
        return retour;
    }

    public Integer getNombreTotal(List<VDistributionFemmeHomme> nombre){
        Integer retour = 0;
        for (VDistributionFemmeHomme v : nombre){
            retour += v.getNombre();
        }
        return retour;
    }

    public Float getDispertion(List<VDistributionFemmeHomme> liste){
        Float nombre = Float.valueOf(getNombreTotal(liste));
        return Float.valueOf(this.nombre / nombre) * 100;
    }

    public VDistributionFemmeHomme() {
    }

    public String getIdVoyage() {
        return idVoyage;
    }

    public void setIdVoyage(String idVoyage) {
        this.idVoyage = idVoyage;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getGenre() {
        return genre;
    }

    public String getGenreString() {
        if(this.genre == 1){ return "Homme"; }
        return "Femme";
    }

    public void setGenre(Integer genre) {
        this.genre = genre;
    }

    public Integer getNombre() {
        return nombre;
    }

    public void setNombre(Integer nombre) {
        this.nombre = nombre;
    }
}
