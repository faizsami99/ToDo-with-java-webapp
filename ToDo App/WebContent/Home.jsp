<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.database.info.MyDataBase" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo App</title>
<link rel="stylesheet" href="./css/home.css">
</head>
<body>
	<%
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);
	if(session.getAttribute("email") == null){
			response.sendRedirect("logMeIn.jsp");
		}
	%>
	<div id="mylinks">
		<a class="links" href="addNewTarget.jsp">+ new</a>
		<a class="links" href="Logout">logout</a>
	</div>
	<div id="container">
		<div id="heading">
			<p>S.no</p>
			<p>Target<p>
		</div>
		<% 
			try{
				Connection con = MyDataBase.myData();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from " + session.getAttribute("email").toString().split("@")[0] +" order by id");
				while(rs.next()){
					%>
						<div id="items">
							<p><%=rs.getString(1)%></p>
							<p><%=rs.getString(2) %></p>
							<a href="editTarget.jsp?id=<%=rs.getString(1)%>">Edit</a>
							<a href="DeleteTarget?k=<%=rs.getString(1)%>">Delete</a>
						</div>
						
					<%
			}
			}
			catch(Exception e){
				System.out.println("Hello something went wrong"+e);
			}
		%>
</div>
</body>
</html>