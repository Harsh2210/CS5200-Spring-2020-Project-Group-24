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
<title>Update Manager</title>
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

<h1>Manager information</h1>
<table border="1">
<tr>
	<th>id</th>
	<th>First name</th>
	<th>Last name</th>
	<th>User name</th>
	<th>Password</th>
	<th>Email</th>
	<th>Phone Number</th>
	<th>Date of Birth</th>
	<th>Update</th>
	<th>Delete</th>
	
</tr>

<%
try{

String query ="select * from manager";
rs = stmt.executeQuery(query);
while(rs.next()){
%>
<tr>

	<td><%=rs.getString("id") %></td>
	<td><%=rs.getString("first_name") %></td>
	<td><%=rs.getString("last_name") %></td>
	<td><%=rs.getString("user_name") %></td>
	<td><%=rs.getString("password") %></td>
	<td><%=rs.getString("email") %></td>
	<td><%=rs.getString("phone") %></td>
	<td><%=rs.getString("dob") %></td>
    
    <td><button class="button button5" onclick="window.location.href = 'updateManager1.jsp?id=<%=rs.getString("id")%>'" value="Add" id="addToTable;">update</button></td>
    <td><button class="button button5" onclick="window.location.href = 'deleteManager1.jsp?id=<%=rs.getString("id")%>'" value="Add" id="addToTable;">delete</button></td>
    
</tr>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</table>

	
	<button class="button button5" onclick="window.location.href='admin.html'">Back</button> <br>

</body>
</html>