package com.database.info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email  = request.getParameter("email");
		String password = request.getParameter("password");
		String query = "select * from user_info where email='" + email + "' and password='" + password + "'" ;
		HttpSession session = request.getSession();
		int z = 0;
		try {
			Connection con = MyDataBase.myData();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				z = 1;
				session.setAttribute("email", email);
				response.sendRedirect("Home.jsp");
			}
			if(z==0) {
				response.sendRedirect("logMeIn.jsp?k=notFound");
			}
		}
		catch (Exception e) {
				response.sendRedirect("logMeIn.jsp?k=invalid");
		}
	}

}
