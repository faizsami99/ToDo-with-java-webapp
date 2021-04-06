package com.database.info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteTarget extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("k"));
		HttpSession session = request.getSession();
		String sql = "delete from " +  session.getAttribute("email").toString().split("@")[0] + " where id=?";
		try {
			Connection con = MyDataBase.myData();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			response.sendRedirect("Home.jsp");
		}
		catch(Exception e) {
			System.out.println("Something wento Wrong " + e);
		}
	}

}
