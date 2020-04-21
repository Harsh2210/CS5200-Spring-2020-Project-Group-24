<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Tickets</title>
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

<h1>Tickets</h1>
<table border="1">
<tr>
	<th>id</th>
	<th>User name</th>
	<!-- <th>Number of Tickets</th>-->
	<th>Ticket Type</th>
    <th>Seat number</th>
    <th>Section</th>
    <th>Movie Name</th>
    <th>Showtime</th>
   
</tr>

<%
	try{
		String sql ="select * from tickets";
		rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("user_name") %></td>
		<!--  <td><%=rs.getString("no_of_tickets") %></td>-->
		<td><%=rs.getString("ticket_type")%></td>
	    <td><%=rs.getString("seat_no")%></td>
	    <td><%=rs.getString("section")%></td>
	    <td><%=rs.getString("movie_name") %></td>
		<td><%=rs.getString("movie_time") %></td>
	    
	</tr>
<%
	}
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
%>

</table>


</body>
</html>