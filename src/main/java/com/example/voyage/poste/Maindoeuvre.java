package com.example.voyage.poste;

import com.example.voyage.dbUtil.AssistantDb;
import com.example.voyage.stock.EtatStock;

import java.sql.Connection;

public class Maindoeuvre {
    Integer idMaindOuvre;
    String label;


    public Maindoeuvre[] getAll(Connection c) throws Exception {
        String sql = "select * from maindoeuvre";
        AssistantDb querier= new AssistantDb();
        Object[] valiny=querier.donneeJavaTable(c,sql,"com.example.voyage.poste.Maindoeuvre");
        Maindoeuvre[] toReturn=new Maindoeuvre[valiny.length];
        System.out.println(toReturn.length);
        for(int i=0;i<toReturn.length;i++){
            toReturn[i]=(Maindoeuvre)valiny[i];
        }
        return toReturn ;
    }
    public void insert(Connection c) throws Exception {
        String sql = "insert into maindoeuvre(label) values('"+this.label+"')";
        AssistantDb querier= new AssistantDb();
        querier.upDateDB(c, sql);
    }
    public Maindoeuvre(Integer idMaindOuvre, String label) {
        this.idMaindOuvre = idMaindOuvre;
        this.label = label;
    }

    public Maindoeuvre(){}
    public Integer getIdMaindOuvre() {
        return idMaindOuvre;
    }

    public void setIdMaindOuvre(Integer idMaindOuvre) {
        this.idMaindOuvre = idMaindOuvre;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
