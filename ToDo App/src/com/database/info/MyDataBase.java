package com.database.info;
import java.sql.*;

public class MyDataBase {
	public static Connection myData() throws Exception {
	    String url = "jdbc:postgresql://localhost:5432/todo";
	    String uname = "postgres";
	    String password = "faizsami@007";

	    Class.forName("org.postgresql.Driver");

	    Connection con = DriverManager.getConnection(url, uname, password);
	    return con;
	}
}
