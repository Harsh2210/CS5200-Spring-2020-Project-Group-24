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
<title>Adding Movie</title>
</head>
<body>

<% String movieName = request.getParameter("moviename");
	String movieTime = request.getParameter("movietime");
	String detail = request.getParameter("details");
	String genres = request.getParameter("genre");
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
	String insert="insert into movie (movie_name,movie_time,details,genre) values ('"+movieName+"','"+movieTime+"','"+detail+"','"+genres+"');";
	stmt.executeUpdate(insert);
	response.sendRedirect("movieregistered.html");

%>



</body>
</html>