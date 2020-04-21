<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import=" java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creating Manager</title>
</head>
<body>

<% String firstName = request.getParameter("firstname");
	String lastName = request.getParameter("lastname");
	String email = request.getParameter("email");
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String dob = request.getParameter("dob");
	java.sql.Date date=java.sql.Date.valueOf(dob);
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
	String insert="insert into manager (first_name,last_name,user_name,password,email,phone,dob) values ('"+firstName+"','"+lastName+"','"+userName+"','"+password+"','"+email+"','"+phone+"','"+date+"');";
	stmt.executeUpdate(insert);
	response.sendRedirect("ManagerSignupsuccess.html");

%>



</body>
</html>