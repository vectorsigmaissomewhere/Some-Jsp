<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Users Table</title>
</head>
<body>
<%
Connection con = null;
Statement st = null;

try {
    // Establishing database connection
    con = ConnectionProvider.getCon();
    st = con.createStatement();

    // Creating table query
    String q1 = "CREATE TABLE IF NOT EXISTS users ("
                + "name VARCHAR(100),"
                + "email VARCHAR(100) primary key,"
                + "mobileNumber BIGINT,"
                + "securityQuestion VARCHAR(200),"
                + "answer VARCHAR(200),"
                + "password VARCHAR(100),"
                + "address VARCHAR(500),"
                + "city VARCHAR(100),"
                + "state VARCHAR(100),"
                + "country VARCHAR(100))";

    // Executing the query to create the table
    st.executeUpdate(q1);
    out.println("Table created successfully.");
} catch (SQLException e) {
    // Handle database errors
    out.println("Error occurred while creating the table: " + e.getMessage());
} catch (Exception e) {
    // Handle other types of errors
    out.println("Error occurred: " + e.getMessage());
} finally {
    // Closing resources in finally block to ensure proper cleanup
    try {
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        out.println("Error occurred while closing resources: " + e.getMessage());
    }
}
%>
</body>
</html>
