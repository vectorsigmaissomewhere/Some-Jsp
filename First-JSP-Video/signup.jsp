<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/signup-style.css">
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="signupAction.jsp" method="post">
      <input type="text" name="name" placeholder="Enter Name" required>
      <input type="email" name="email" placeholder="Enter Email" required>
      <input type="number" name="mobileNumber" placeholder="Enter Mobile number" required>
      <select name="securityQuestion" required>
      <option value="What was you first car?">What was your first car?</option>
      <option value="What is the name of your pet?">What is the name of your pet?</option>
      <option value="What elementary school did you attend?">What elementary school did you attend?</option>
      <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
      </select>
      <input type="text" name="answer" placeholder="Enter answer" required>
      <input type="password" name="password" placeholder="Enter Password" required>
      <input type="submit" value="signup">
      </form>
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whysign'>
  	<%
  	String msg=request.getParameter("msg");
  	if("valid".equals(msg)){
  	%>
  	    <h1>Successfully Registered</h1>
  	<%
  	} else if ("invalid".equals(msg)){
  	%>
  	    <h1>Something Went Wrong! Try Again!</h1>
  	<%
  	}
  	%>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>
