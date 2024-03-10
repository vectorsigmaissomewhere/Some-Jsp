<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>
<!-- Increment and decrement the product stock in myCart -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inDecQuantity</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(rs.next()){
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}
	else if(quantity !=1 && incdec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
