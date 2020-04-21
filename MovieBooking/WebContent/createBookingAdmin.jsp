<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book a Ticket</title>
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
<h1>Select Seats </h1><br>

<div style="position: relative;left:5%">
      <img src="seats.png" alt="Snow" style="width:30%;height:30%; border-radius:5%">
</div>

<div class="loginContainer1">
<form action="createBookingAdmin1.jsp" method="post">
	<label>First name</label>
	<input class="box" type="text" name="firstname" id="firstname" placeholder="First Name" required /><br> <br> <br>

	<label>Last name</label>
    <input class="box" type="text" name="lastname" id="lastname" placeholder="Last Name" required /><br> <br> <br>
                 
    <label>User name</label>
    <input class="box" type="text" name="userName" id="userName" placeholder="Username" required /><br> <br> <br>

	<label>Email</label>
    <input class="box" type="email" name="email" id="email" placeholder="E-Mail " required /><br>  <br> <br>
                              
	<label>Contact Number</label>
    <input class="box" type="text" name="phone" id="phone" placeholder="Phone Number " required/><br> <br> <br>

	<label>Movie Name</label>
    <select class="box" id="moviename" name="moviename">
<%
	try{
		String sql ="select * from movie";
		rs = stmt.executeQuery(sql);
	while(rs.next()){
%>

 	<option value="<%=rs.getString("movie_name") %>" selected><%=rs.getString("movie_name") %></option>            
<%
	}}catch (Exception e) {
		e.printStackTrace();
		}
%>
	</select><br> <br> <br>
	
	<label>Movie Time</label>
    <select class="box" id="movietime" name="movietime">
<%
	try{
		String select ="select * from movie";
		rs = stmt.executeQuery(select);
	while(rs.next()){
%>

 	<option value="<%=rs.getString("movie_time") %>" selected><%=rs.getString("movie_time") %></option>            
<%
	}}catch (Exception e) {
		e.printStackTrace();
		}finally{
	conn.close();} 
%>
	</select><br> <br> <br>
	<label>Ticket Type</label>
	<select class="box" name = "ticket_type" id="ticket_type">
                     <option value="Standard"> Standard </option>
                     <option value="Gold"> Gold </option>
                     <option value="Platinum"> Platinum </option>
	</select><br> <br> <br>
	<!--  <label>Number of Tickets</label>
    <select class="box" name = "seats" id="seats">
                     <option value="0"> 0 </option>
                     <option value="1"> 1 </option>
                     <option value="2"> 2 </option>
                     <option value="3"> 3 </option>
                     <option value="4"> 4 </option>
                     <option value="5"> 5 </option>
                     <option value="6"> 6 </option>
                     <option value="7"> 7 </option>
    </select><br> <br> <br>
	-->
	<label>Section</label>
   	 <select class="box" name = "section" id="section">
                     <option value="a"> a </option>
                     <option value="b"> b </option>
                     <option value="c"> c </option>
                     <option value="d"> d </option>
                     <option value="e"> e </option>
                     <option value="f"> f </option>
                     <option value="g"> g </option>
                     <option value="h"> h </option>
                     <option value="i"> i </option>
                     <option value="j"> j </option>
      </select><br> <br> <br>
	
	<label >Seat Number</label>
    <select class="box" name = "seat_no" id="seat_no">
                     <option value="0"> 0 </option>
                     <option value="1"> 1 </option>
                     <option value="2"> 2 </option>
                     <option value="3"> 3 </option>
                     <option value="4"> 4 </option>
                     <option value="5"> 5 </option>
                     <option value="6"> 6 </option>
                     <option value="7"> 7 </option>
                     <option value="8"> 8 </option>
                     <option value="9"> 9 </option>
                     <option value="10"> 10 </option>
                     <option value="11"> 11 </option>
                     <option value="12"> 12 </option>
                     <option value="13"> 13 </option>
                     <option value="14"> 14 </option>
                     <option value="15"> 15 </option>
                     <option value="16"> 16 </option>
                     <option value="17"> 17 </option>
   	 </select><br> <br> <br>
   	 

	<button class="button button5" type="submit" id="submitDetails" name="submitDetails"> Book </button><br> <br> <br>

</form>
</div>
</body>
</html>