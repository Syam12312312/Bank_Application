<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String sid=request.getParameter("Phone");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
		PreparedStatement ps=con.prepareStatement("delete from BankApplication where Phone=?");
		ps.setString(1, sid);
		ps.executeUpdate();
		
		
		response.sendRedirect("View.jsp");

	}
	catch(Exception ae) {
		ae.printStackTrace();
	} %>
</body>
</html>