<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Ticket</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String userName = request.getParameter("userName");
	String moviename = request.getParameter("moviename");
	String movietime = request.getParameter("movietime");
	String seats = request.getParameter("ticket_type");
	String seat_no = request.getParameter("seat_no");
	String section = request.getParameter("section");
	
	Connection conn = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
	conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
	stmt=conn.createStatement();
	
	String update="Update tickets set user_name='"+userName+"',ticket_type='"+seats+"',seat_no='"+seat_no+"',section = '"+section+"', movie_name ='"+moviename+"', movie_time='"+movietime+"' where id="+id;
	statement = conn.prepareStatement(update);
	int valid = statement.executeUpdate();
	if(valid > 0){
		response.sendRedirect("ManageAllTickets.jsp");
	}
	else{
		out.print("Error in update");
	}

%>

</body>
</html>