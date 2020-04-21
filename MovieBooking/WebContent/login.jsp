<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>

<%
	String userId = request.getParameter("loginname");
	String Password = request.getParameter("loginpassword");
	session.setAttribute("SessionUserName",userId);
	session.setAttribute("SessionPassword",Password);
	
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	ResultSetMetaData rsmd ;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
	conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
	stmt=conn.createStatement();
	String query ="";
	String pass_word = "";
	String type = request.getParameter("user");
	
	if(type.equals("Admin")){
		
		query="select password from admin where user_name='"+userId+"';";
		resultSet=stmt.executeQuery(query);
		while (resultSet.next()){
		pass_word=resultSet.getString("password");
		}
		if(Password.equals(pass_word)){
		    response.sendRedirect("admin.html");
		 }
		
	}
	
	else if(type.equals("Customer")){
		
		query = "select password from users where user_name='"+userId+"';";
		resultSet=stmt.executeQuery(query);
		while (resultSet.next()){
		pass_word=resultSet.getString("password");
		}
		if(Password.equals(pass_word)){
		    response.sendRedirect("customer.html");
		 }else{
			 response.sendRedirect("invalid.html");
		 }
	
	}
	
	else if(type.equals("Manager")){
		
		query = "select password from manager where user_name='"+userId+"';";
		resultSet=stmt.executeQuery(query);
		while (resultSet.next()){
		pass_word=resultSet.getString("password");
		}
		if(Password.equals(pass_word)){
		    response.sendRedirect("manager.html");
		 }
	
	}else{
		response.sendRedirect("invalid.html");
	}

%>



</body>
</html>