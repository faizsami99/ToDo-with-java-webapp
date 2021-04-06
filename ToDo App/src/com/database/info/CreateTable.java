package com.database.info;

import java.sql.*;

public class CreateTable {
	public static boolean createTable(String email) {
		String domainName = email.split("@")[0];
		String query = "create table " + domainName + "(id int primary key, work char(100))";
		try {
			Connection con = MyDataBase.myData();
			Statement st = con.createStatement();
			st.execute(query);
		}
		catch(Exception e) {
			return false;
		}
		return true;
	}
}
