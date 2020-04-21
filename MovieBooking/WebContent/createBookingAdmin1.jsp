<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book a Ticket</title>
</head>
<body>

<% 
	String userName = request.getParameter("userName");
	String moviename = request.getParameter("moviename");
	String movietime = request.getParameter("movietime");
	String type = request.getParameter("ticket_type");
	String seat_no = request.getParameter("seat_no");
	String section = request.getParameter("section");
	
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
	conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
	stmt=conn.createStatement();
	String insert="insert into tickets (user_name, ticket_type,seat_no, section, movie_name, movie_time) values ('"+userName+"','"+type+"','"+seat_no+"','"+section+"','"+moviename+"','"+movietime+"');";
	stmt.executeUpdate(insert);
    response.sendRedirect("ticketBooked.html");
	
%>

<br><br>

</body>
</html>