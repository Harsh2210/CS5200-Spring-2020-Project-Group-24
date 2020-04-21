<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title> <link rel="stylesheet" href="commonBody.css">
  <link rel="stylesheet" href="login.css">
 
 <style>

.commentbox{
	width: 200px;
  border: 2px solid white;
  padding: 5px;
  margin: 5px;
}

.innerbox{
	border:2px;
	width:150px;
	color: black;
	
}
</style>

</head>
<body>

	<ul class="Navbar">
	
		<li><a  href="Home.html">HOME</a></li>
		<li><a href="showtimes.jsp">NOW SHOWING</a></li>
		<li><a href="login.html">LOG IN</a></li>
    	<li><a  href="reviews.jsp">REVIEWS</a></li>
		<li><a class="active" href="about.jsp">ABOUT US</a></li>
    
	</ul>


<h1>About Us!</h1>

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

<div class="container">
      <img src="img2.png" alt="Snow" style="width:100%;">
</div>

<span style="color:white;font-family:'Courier New', Courier, monospace;position:relative;left:10px;">Comments Section</span> 
<div class="commentbox" >
<%
	try{
		String sql ="select * from comments";
		rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
<div class="innerbox">
	<span style="color:white;font-family:'Courier New', Courier, monospace;"><u>User name</u>: <%=rs.getString("user_name") %></span><br>
	<span style="color:white;font-family:'Courier New', Courier, monospace;"><u>Comment</u>:  <%=rs.getString("comments") %></span>
</div><hr>
<%
	}
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
</div>
<button class="button button5" onclick="window.location.href='comment.html'" type="submit" id="SignupButton">Add Comment</button>

</body>
</html>