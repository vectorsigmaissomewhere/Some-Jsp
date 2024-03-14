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
    
    // Creating table to add product
    String q2 = "CREATE TABLE IF NOT EXISTS product ("
            + "id INT,"
            + "name VARCHAR(500),"
            + "category VARCHAR(200),"
            + "price int,"
            + "active varchar(10))";
    String q3 = "CREATE TABLE IF NOT EXISTS cart ("
            + "email varchar(100),"
            + "product_id int,"
            + "quantity int,"
            + "price int,"
            + "total int,"
            + "address varchar(500),"
            + "city varchar(100),"
            + "state varchar(100),"
            + "country varchar(100),"
            + "mobileNumber bigint,"
            + "orderDate varchar(100),"
            + "deliveryDate varchar(100),"
            + "paymentMethod varchar(100),"
            + "transactionId varchar(100),"
            + "status varchar(10))";
    
    String q4 = "CREATE TABLE IF NOT EXISTS message("
            + "id INT AUTO_INCREMENT,"
            + "email VARCHAR(100),"
            + "subject VARCHAR(200),"
            + "body VARCHAR(1000),"
            + "PRIMARY KEY(id))";


    // Executing the query to create the table
    //st.executeUpdate(q1);
    //st.executeUpdate(q2);
    //st.executeUpdate(q3);
    st.executeUpdate(q4);
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
