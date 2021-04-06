package com.database.info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String mobileNumber = request.getParameter("mobileNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String query = "insert into user_info (name, mobileNumber, email, password) values (?,?,?,?)";
		
		try {
			Connection con = MyDataBase.myData();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, mobileNumber);
			pst.setString(3, email);
			pst.setString(4, password);
			if(CreateTable.createTable(email)) {
				pst.executeUpdate();
				response.sendRedirect("logMeIn.jsp");
			}
			else {
				System.out.println("Something went Wrong");
			}
		}
		catch(Exception e) {
			System.out.println("Something went Wrong " + e);
			
		}
		
	}

}
