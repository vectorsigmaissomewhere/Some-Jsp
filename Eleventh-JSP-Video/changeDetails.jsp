<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>
<%@ include file="changeDetailsHeader.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
<hr>
{width:70%;}</style>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
%>
<h3>Name: <%=rs.getString(1) %> </h3>
<hr>
 <h3>Email: <%=rs.getString(2) %> </h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(3) %> </h3>
 <hr>
<h3>Security Question: <%=rs.getString(4) %> </h3>
<hr>
      <br>
      <br>
      <br>
<%
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
