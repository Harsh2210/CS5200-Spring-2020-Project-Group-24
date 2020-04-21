<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Movies</title>
 <link rel="stylesheet" href="commonBody.css">
 <link rel="stylesheet" href="login.css">
</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a class="active" href="login.html">LOG IN</a></li>
    	<li><a  href="reviews.jsp">REVIEWS</a></li>
		<li><a href="about.jsp">ABOUT US</a></li>
    
	</ul>

<% 
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	
   	String id = request.getParameter("id");
   	Class.forName("com.mysql.jdbc.Driver");
   	String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   	conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   	stmt=conn.createStatement();
   	String query ="select * from movie where id="+id;
   	rs = stmt.executeQuery(query);
   while(rs.next()){
%>
<div class="loginContainer1">
<form action="updateMovies2.jsp" method="post">

<h1> Update information </h1>

	<input type="hidden" name="id" value="<%=rs.getString("id") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Movie Name</label> 
	<input type="text" name="moviename" value="<%=rs.getString("movie_name") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Showtime</label>
	<input type="text" name="movietime" value="<%=rs.getString("movie_time") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Details</label> 
	<input type="text" name="details" value="<%=rs.getString("details") %>">
	<br>
	 <label style="color:white;font-family:'Courier New', Courier, monospace;">Genre</label>
	<input type="text" name="genre" value="<%=rs.getString("genre") %>">
	<br>
	<br>
    
<br><br>
<button class="button button5" type="submit" id="submitDetails" name="submitDetails"> Update </button><br>
</form>
 </div>
<%
}
%>

</body>
</html>