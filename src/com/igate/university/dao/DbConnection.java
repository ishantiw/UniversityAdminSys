package com.igate.university.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	public Connection getConnection() {
		Connection con=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			
		}
		try {
			con=DriverManager.getConnection("jdbc:oracle:thin:@192.168.104.157:1522:orcl","trg276","training276");
			}
		catch (SQLException e) 
		{
			e.printStackTrace();
			
		}
		return con;
	}
	
	
}
