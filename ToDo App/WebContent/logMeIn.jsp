<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.database.info.MyDataBase" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/loginPage.css">
</head>
<body>
<%
	String errors = request.getParameter("k");
	if("notFound".equals(errors)){
%>
	<p class="warning">user Not Found please Signup first</p>
	<%
		}
	if("invalid".equals(errors)){
	%>
	<p class="warning">Something went Wrong please try again later</p>
	<% 
	}
	%>
	<div id="container"> 
	<h2 id="heading">ToDo App</h2>
	<form action="Login" method="post">
		<input type="email" name="email" placeholder="Enter Email">
		<input type="password" name="password" placeholder="Enter Password" id="pleaseShowMe">
		<div id="passwordshow">
		show password<input type="checkbox" id="mypassword">
		</div>
		<input type="submit" value="login" id="submitButtom">
	</form>
	<a href="signup.jsp">signup</a>
	</div>
	<script>
	let cheakBox = document.getElementById("mypassword");
	let mypassword = document.getElementById("pleaseShowMe");

	cheakBox.addEventListener('click', showMyPassword);

	function showMyPassword() {
	  if (mypassword.type == "password") {
	    	mypassword.type = "text";
	  } 
	  else {
	    	mypassword.type = "password";
	  }
	}
	</script>
</body>
</html>