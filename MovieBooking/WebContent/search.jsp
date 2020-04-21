<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Search</title>
 <link rel="stylesheet" href="commonBody.css">
  <link rel="stylesheet" href="login.css">
</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a class="active" href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a href="login.html">LOG IN</a></li>
    	<li><a  href="reviews.jsp">REVIEWS</a></li>
		<li><a href="about.jsp">ABOUT US</a></li>
    
	</ul>
<table border="1">
<tr>

	<th>Movie Name</th>
	<th>Details</th>
    <th>Genre</th>
   
</tr>
<% 
	String id = request.getParameter("id");
	String movieName = request.getParameter("Name");

	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
   
   try{
		String sql ="select * from movie where movie_name="+'"'+movieName+'"';
		rs = stmt.executeQuery(sql);
	if(rs.next()){
   
%>

	<tr>
		<td><%=rs.getString("movie_name") %></td>
		<td><%=rs.getString("details") %></td>
	    <td><%=rs.getString("genre")%></td>
	    
	</tr>
<%
	}else{%>
		<h1>Movie Not Found!</h1>
	<%}
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
%>

<div class="ticketImage">
      <img src="ticket.png" alt="Snow" style="width:10%; border-radius:45%;position:relative;left:5%;">
</div>

<br><div style="position:relative;left:43%"><form action="login.html">
    <button class="button button5" type="submit">Book Tickets!</button>
	</form></div>
<br><br>


</body>
</html>