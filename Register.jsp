<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
            background-image: url("https://cdn.wallpapersafari.com/26/10/lV9LYT.jpg");
            background-size: cover;
            font-family: Arial, sans-serif;
            color: black;
            padding: 20px;
            text-align: center;
        }
</style>
<body>
	<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
		PreparedStatement ps=con.prepareStatement("insert into login values(?,?)");
		ps.setString(1,(request.getParameter("mail")));
		ps.setString(2,(request.getParameter("password")));
		ps.executeUpdate();		
		con.close();
		ps.close();
	

	}
	catch(Exception ae) {
		ae.printStackTrace();
		
	}
	response.sendRedirect("login.html");
	%>
	
	
</body>
</html>