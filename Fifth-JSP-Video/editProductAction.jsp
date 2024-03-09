<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Edit Action</title>
</head>
<body> 
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    // Corrected the update query
    st.executeUpdate("UPDATE product SET name='" + name + "', category='" + category + "', price='" + price + "', active='" + active + "' WHERE id='" + id + "'");
    
    if (active.equals("No")) {
        // Delete from cart where product_id = id and address is NULL
        st.executeUpdate("DELETE FROM cart WHERE product_id='" + id + "' AND address IS NULL");
    }
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
} catch (Exception e) {
    e.printStackTrace(); // Print the stack trace to identify the error
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
</body>
</html>
