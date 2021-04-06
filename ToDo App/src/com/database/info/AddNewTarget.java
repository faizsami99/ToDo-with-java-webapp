package com.database.info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddNewTarget")
public class AddNewTarget extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String newEntry = request.getParameter("newEntry");
		HttpSession session = request.getSession();
		String domainName = session.getAttribute("email").toString().split("@")[0];
		String query = "insert into " + domainName + "(id, work) values (?,?)";
		System.out.println(query);
		try {
			Connection con = MyDataBase.myData();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, newEntry);
			ps.executeUpdate();
			response.sendRedirect("Home.jsp");
			
		}
		catch(Exception e) {
			System.out.println("Something went Wrong " + e);
		}
		
	}

}
