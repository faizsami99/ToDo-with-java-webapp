<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="stylesheet" href="./css/signup.css">
</head>
<body>
<div id="container">
<h2 id="heading">Let's Do it!!...</h2>
	<form action="SignUp" method="post">
		<input type="text" name="name" placeholder="Enter Name">
		<input type="number" name="mobileNumber" placeholder="Enter Mobile Number">
		<input type="email" name="email" placeholder="Enter Email">
		<input type="password" name="password" placeholder="Enter Password">
		<input type="submit" value="signup" id="submitButtom">
	</form>
</div>
	<script type="text/javascript" src="./js/showPassword.js"></script>
</body>
</html>