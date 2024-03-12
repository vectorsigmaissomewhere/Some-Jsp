<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="UTF-8">
<title>change password</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>

<%
if("done".equals(msg)){
%>
<h3 class="alert">Password change successfully!</h3>
<%} %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>

<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldPassword" placeholder="Enter Old Password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newPassword" placeholder="Enter New Password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmPassword" placeholder="Enter Confirm Password" required>
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
  <%
 if("wrong".equals(msg)){
	 %>
	 <button class="button" type="button">Try Again<i class='far fa-arrow-alt-circle-right'></i></button>
	 <%} %>

  <%
 if("notMatch".equals(msg)){
	 %>
	 <button class="button" type="button">Try Again<i class='far fa-arrow-alt-circle-right'></i></button>
	 <%} %>
</body> 
</html>
