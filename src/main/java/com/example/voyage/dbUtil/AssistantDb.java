/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.voyage.dbUtil;

import generic.annotaion.Correspondance;
import generic.dao.Model;

import java.sql.*;
import java.util.*;
import java.lang.reflect.*;
import java.math.*;

public class AssistantDb{
    public Vector<String> getEntete(String request,Connection connexion)throws Exception
	{
		Vector<String> entete=new Vector<String>();
		ResultSet ans=realisationRequette(connexion,request);
		while(ans.next()){
			entete.add(ans.getString("COLUMN_NAME"));
		}
		return entete;

	}
	public Statement preparationEspaceMemoire(Connection connexion) throws Exception {
		return connexion.createStatement();
	}

	public ResultSet realisationRequette(Connection connexion, String sql) throws Exception {
		Statement st = this.preparationEspaceMemoire(connexion);
		ResultSet re = st.executeQuery(sql);
		return re;
	}

	public  int upDateDB(Connection connexion, String sql) throws Exception {
		try
		{
			Statement st = (new AssistantDb()).preparationEspaceMemoire(connexion);
			int re = st.executeUpdate(sql);
			connexion.commit();
			//connexion.close();
			return re;
		}
		catch(Exception e)
		{
			throw e;
		}
	}

	public  Vector traitementDonnees(Connection connexion, String sql) throws Exception {
		ResultSet resultat = this.realisationRequette(connexion, sql);
		ResultSetMetaData formatTableau = resultat.getMetaData();
		int nbColonne = formatTableau.getColumnCount();
		Vector valiny = new Vector();
		while (resultat.next()) {
			Object[] temporaire = new Object[nbColonne];
			int counter = 0;
			for (int i = 1; i <= nbColonne; i++) {

				if (resultat.getObject(i) != null) {
					if (resultat.getObject(i) instanceof BigDecimal) {
						temporaire[counter] = ((BigDecimal) resultat.getObject(i)).doubleValue();
					}
					else{
						temporaire[counter] = resultat.getObject(i);
					}
				} else {
					temporaire[counter] = 0.0;
				}
				counter++;
			}
			valiny.add(temporaire);
		}
		return valiny;

	}

	Class[] getParameterTypeFrom(Object[] ligne) {
		Class[] ans = new Class[ligne.length];
		if (ligne.length!=0)
		{
			for (int i = 0; i < ans.length; i++) {
			ans[i] = ligne[i].getClass();
			}
		
		}
		return ans;
	}

	public Object[] createTabInstanceOf(String className, Vector donnee) throws Exception {
		Object[] valiny = new Object[donnee.size()];
		if (donnee.size() != 0) {
			Class[] parameterType = this.getParameterTypeFrom((Object[]) donnee.elementAt(0));
			Class instanceClass = Class.forName(className);

			Constructor neededConstructor = instanceClass.getConstructor(parameterType);
			for (int i = 0; i < donnee.size(); i++) {
				valiny[i] = neededConstructor.newInstance((Object[]) donnee.elementAt(i));
			}

		}
		return valiny;
	}

	public  Object[] donneeJavaTable(Connection connexion, String sql, String className) throws Exception {
		Vector donnee = this.traitementDonnees(connexion, sql);
		Object[] ans = createTabInstanceOf(className, donnee);
		return ans;
	}
}
