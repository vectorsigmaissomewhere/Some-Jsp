<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change security question</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String securityQuestion=request.getParameter("securityQuestion");
String newAnswer=request.getParameter("newAnswer");
String password=request.getParameter("password");
int check=0;
try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
    while(rs.next()){
        check=1;
        st.executeUpdate("update users set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"' where email='"+email+"'");
        response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
    }
    if(check==0){
        response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
    }
}catch(Exception e){
    out.println(e);
}
%>
</body>
</html>
