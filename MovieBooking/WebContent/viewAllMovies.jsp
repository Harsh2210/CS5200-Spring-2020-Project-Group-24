<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Movies</title>
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

<h1>List of Movies</h1>
<table border="1">
<tr>

	<th>id</th>
	<th>Movie Name</th>
	<th>Details</th>
    <th>Genre</th>
   
</tr>

<%
	try{
		String sql ="select * from movie";
		rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("movie_name") %></td>
		<td><%=rs.getString("details") %></td>
	    <td><%=rs.getString("genre")%></td>
	    
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