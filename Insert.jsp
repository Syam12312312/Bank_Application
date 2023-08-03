<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	response.setContentType("text/html");
	String Fname=request.getParameter("Fname");
	String Sname=request.getParameter("Sname");
	String Street=request.getParameter("Street");
	String Address=request.getParameter("Address");
	String email=request.getParameter("Email");
	String Phone=request.getParameter("Phone");
	String State=request.getParameter("State");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
		PreparedStatement ps=con.prepareStatement("insert into BankApplication values (?,?,?,?,?,?,?)");
		ps.setString(1,Fname);
		ps.setString(2,Sname);
		ps.setString(3,Street);
		ps.setString(4,Address);
		ps.setString(5,State);
		ps.setString(6,email);
		ps.setString(7,Phone);
		ps.executeUpdate();
		%>
		<%out.print("Records saved successfully!");%>
		<%
		request.getRequestDispatcher("Index.html").include(request, response);
		con.close();
	}catch(Exception ex){ex.printStackTrace();}
	%>

</body>
</html>