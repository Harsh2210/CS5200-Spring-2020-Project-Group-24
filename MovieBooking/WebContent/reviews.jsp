<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reviews</title>
 <link rel="stylesheet" href="commonBody.css">
   <link rel="stylesheet" href="login.css">
</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a href="login.html">LOG IN</a></li>
    	<li><a class="active" href="reviews.jsp">REVIEWS</a></li>
		<li><a  href="about.jsp">ABOUT US</a></li>
    
	</ul>

<%
	String id = request.getParameter("id");
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
	conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
	stmt=conn.createStatement();
	
%>

<h1>Movie Ratings</h1>
<%
try{

String query ="select * from movie";
rs = stmt.executeQuery(query);
while(rs.next()){
%>

<a class="button button5" href="https://api.themoviedb.org/3/search/movie?api_key=8e8bf274a8fd3009e117f71c1d884259&language=en-US&query=<%=rs.getString("movie_name") %>&page=1&include_adult=false"><%=rs.getString("movie_name") %></a>
<br>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</body>
</html>