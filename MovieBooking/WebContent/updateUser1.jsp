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
<title>Update User</title>
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
   	String query ="select * from users where id="+id;
   	rs = stmt.executeQuery(query);
   while(rs.next()){
%>
<div class="loginContainer1">
<form action="updateUser2.jsp" method="post">

<h1> Update information </h1>

	<input type="hidden" name="id" value="<%=rs.getString("id") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">First name</label> 
	<input type="text" name="first_name" value="<%=rs.getString("first_name") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Last name</label>
	<input type="text" name="last_name" value="<%=rs.getString("last_name") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">User name</label> 
	<input type="text" name="username" value="<%=rs.getString("user_name") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Password</label>
	<input type="text" name="password" value="<%=rs.getString("password") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Email Id</label>
	<input class="box" type="email" name="email" value="<%=rs.getString("email") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Phone number</label>
	<input type="text" name="phone_number" value="<%=rs.getString("phone") %>">
	<br>
	<label style="color:white;font-family:'Courier New', Courier, monospace;">Date of Birth</label>
	<input type="text" name="dob" value="<%=rs.getDate("dob") %>">
	<br>
	<br>
    
<br><br>
<button class="button button5" type="submit" id="submitDetails" name="submitDetails"> Submit </button><br>
</form>
</div>
<%
}
%>
</body>
</html>