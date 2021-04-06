<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.database.info.MyDataBase" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/addNewTarget.css">
</head>
<body>
		<% 
		if(session.getAttribute("email") == null){
			response.sendRedirect("logMeIn.jsp");
		}
			String domainName = session.getAttribute("email").toString().split("@")[0];
			int id = Integer.parseInt(request.getParameter("id"));
			String sql = "select * from " + domainName + " where id='" + id +"'";
			try{
				Connection con = MyDataBase.myData();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				rs.next();
				System.out.println(rs.getString(2));
			%>
			<div id="container">
				<h2 id="heading">Edit Your Target!!..</h2>
				<form action="EditTarget" method="post">
					<input type="hidden" name="id" value="<%=id%>">
					<input  type="text" name="newEntry" placeholder="ReEnter you Entry">
					<input type="submit" value="submit" id="submitButtom">
				</form>
			</div>
			<%
			}
			catch(Exception e){
				System.out.println("something went wrong "+ e);
			}
		%>
</body>
</html>