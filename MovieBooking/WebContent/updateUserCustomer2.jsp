<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
</head>
<body>

	<% 
	String id = request.getParameter("id");
	String firstName = request.getParameter("first_name");
	String lastName = request.getParameter("last_name");
	String email = request.getParameter("email");
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone_number");
	String dob = request.getParameter("dob");
	java.sql.Date date=java.sql.Date.valueOf(dob);
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement statement = null;
	ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-spring2020-janyani.cdgopduo2pce.us-east-2.rds.amazonaws.com/MovieBooking";
   conn = DriverManager.getConnection(url,"Harsh2297","Devil2297");
   stmt=conn.createStatement();
    String update ="update users set first_name='"+firstName+"',last_name='"+lastName+"',user_name = '"+userName+"', password ='"+password+"',email='"+email+"',phone='"+phone+"', dob='"+dob+"' where id="+id;
    statement = conn.prepareStatement(update);
    int valid = statement.executeUpdate();
    if(valid > 0){
    	response.sendRedirect("ManageAllUserCustomer.jsp");
    }
    else{
    out.print("Error in update");
    }

%>


</body>
</html>