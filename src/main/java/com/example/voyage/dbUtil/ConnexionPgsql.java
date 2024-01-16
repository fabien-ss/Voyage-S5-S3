package com.example.voyage.dbUtil;

import java.sql.*;

public class ConnexionPgsql{
	public static Connection dbConnect()
	{
		Connection conn = null;
		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost:5432/voyage";
			String user = "your_username";
			String mdp = "your_password";
			Connection con = DriverManager.getConnection(url, user, mdp);
			conn = con;
			conn.setAutoCommit(false);
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e);
		}
		return conn;
	}
}