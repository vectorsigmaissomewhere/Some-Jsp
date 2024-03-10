<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>
<!-- Removing the product from the cart -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove From Cart</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");	
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
