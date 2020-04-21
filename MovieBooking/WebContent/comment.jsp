<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import=" java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creating User</title>
</head>
<body>

<% 
	String userName = request.getParameter("username");
	String comments = request.getParameter("comments");
	String query="";
	String users="";
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
   
   query="select user_name from users;";
	rs=stmt.executeQuery(query);
	while (rs.next()){
	users=rs.getString("user_name");
	}
	if(userName.equals(users)){
	String insert="insert into comments (user_name,comments) values ('"+userName+"','"+comments+"');";
	stmt.executeUpdate(insert);
	response.sendRedirect("about.jsp");
	}else{response.sendRedirect("invalid.html");}

%>



</body>
</html>