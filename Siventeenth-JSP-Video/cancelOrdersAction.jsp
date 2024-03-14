<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Order</title>
</head>
<body>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Cancel";
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>
</body>
</html>
