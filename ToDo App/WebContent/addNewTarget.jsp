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
		int id = 1;
		String sql = "select max(id) from " + domainName;
		try{
			Connection con = MyDataBase.myData();		
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				id = rs.getInt(1);
				id++;
			}
			
		}
		catch(Exception e){
			System.out.println("Something went Wrong");
		}
	%>
	<div id="container">
	<h2 id="heading">Add Something in your list!!</h2>
	<form action="AddNewTarget" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="text" name="newEntry" placeholder="Enter new Entry">
		<input type="submit" value="add" id="submitButtom">
	</form>
	</div>
	
</body>
</html>