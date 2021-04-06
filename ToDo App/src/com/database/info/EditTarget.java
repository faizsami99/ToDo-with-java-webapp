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


@WebServlet("/EditTarget")
public class EditTarget extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String newEntry = request.getParameter("newEntry");
		HttpSession session = request.getSession();
		String query = "update " +  session.getAttribute("email").toString().split("@")[0] + " set work=? where id=?";
		try {
			Connection con = MyDataBase.myData();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, newEntry);
			ps.setInt(2, id);
			ps.executeUpdate();
			response.sendRedirect("Home.jsp");
		}
		catch (Exception e) {
			System.out.println("Something went Wrong " + e);
		}
	}

}
