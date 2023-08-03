<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*"  errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%	
		
		String Fname=request.getParameter("FName");
		
		String Sname=request.getParameter("SName");
		String Street=request.getParameter("Street");
		String Address=request.getParameter("Address");
		String State=request.getParameter("State");
		String Email=request.getParameter("Email");
		String Phone=request.getParameter("Phone");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
		PreparedStatement ps=con.prepareStatement("update BankApplication set FIRST_NAME=?,SECOND_NAME=?,STREET=?,ADDRESS=?,STATE=?,EMAIL=?,PHONE=? where PHONE=?");
		ps.setString(1,Fname);
		ps.setString(2,Sname);
		ps.setString(3,Street);
		ps.setString(4,Address);
		ps.setString(5,State);
		ps.setString(6,Email);
		ps.setString(7,Phone);
		ps.setString(8,Phone);
		ps.executeUpdate();
		response.sendRedirect("View.jsp");
		ps.close();
		
		}
		catch(Exception ae) {
			ae.printStackTrace();
		
		} %>

</body>
</html>