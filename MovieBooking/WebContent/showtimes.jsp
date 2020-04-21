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
<title>Movies</title>
 <link rel="stylesheet" href="commonBody.css">
  <link rel="stylesheet" href="login.css">
<style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted grey;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 200px;
  background-color: black;
  box-shadow: 0 5px 35px 0px rgba(0,0,0,.1);
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 102%;
  
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}


</style>

</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a class="active" href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a href="login.html">LOG IN</a></li>
    	<li><a  href="reviews.jsp">REVIEWS</a></li>
		<li><a href="about.jsp">ABOUT US</a></li>
    
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

<h1>Now Showing</h1>
<!--
<table border="1">
<tr>

	<th>Movie Name</th>
	<th>Details</th>
    <th>Genre</th>
   
</tr>

-->

<form style="width:200px;font-family:'Courier New', Courier, monospace;text-align:left;position:relative;left:0%;" action="search.jsp" method="GET">
<label style="color:white;font-family:'Courier New', Courier, monospace;">Search By Name</label> <input type="text" name="Name">
    <input class="button button5" type ="submit" value="Search"></form>

<div style="border:2px solid white;position:relative;left:41%;padding:5px;width:250px;text-align:left">
<%
try{

String query ="select * from movie";
rs = stmt.executeQuery(query);
while(rs.next()){
%>
<!--
<tr>

	<td><%=rs.getString("movie_name") %></td>
	<td><%=rs.getString("details") %></td>
	<td><%=rs.getString("genre") %></td>
    
</tr>
-->

<div class="tooltip" style="color:white;font-family:'Courier New', Courier, monospace;"><%=rs.getString("movie_name") %> -->

<span class="tooltiptext">
	Movie Info: <%=rs.getString("details") %><br>
	Genre: <%=rs.getString("genre") %>
</span>
</div>

<br>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
<br><br>
<!--  </table>	-->
<div class="ticketImage">
      <img src="ticket.png" alt="Snow" style="width:10%; border-radius:45%;position:relative;left:5%;">
</div>

<br><div style="position:relative;left:43%"><form action="login.html">
    <button class="button button5" type="submit">Book Tickets!</button>
	</form></div>
<br><br>

</body>
</html>