<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Movies</title>
</head>
<body>

	<% 
	String id = request.getParameter("id");
	String movieName = request.getParameter("moviename");
	String movieTime = request.getParameter("movietime");
	String details = request.getParameter("details");
	String genre = request.getParameter("genre");
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
    String update ="update movie set movie_name='"+movieName+"',movie_time='"+movieTime+"',details = '"+details+"', genre ='"+genre+"' where id="+id;
    statement = conn.prepareStatement(update);
    int valid = statement.executeUpdate();
    if(valid > 0){
    	response.sendRedirect("ManageAllMovies.jsp");
    }
    else{
    out.print("Error in update");
    }

%>


</body>
</html>