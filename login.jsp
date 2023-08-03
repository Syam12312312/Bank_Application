<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    String loginmail1 = request.getParameter("mail");
    String loginpassword1 = request.getParameter("password");
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
        ps = con.prepareStatement("SELECT * FROM login WHERE username = ? AND password = ?");
        ps.setString(1, loginmail1);
        ps.setString(2, loginpassword1);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            response.sendRedirect("Index.html");
        } else {
            // If login fails, show a link to go back to the login page.
           
           response.sendRedirect("login.html");
            
                  	
        }
    } catch (Exception ae) {
        ae.printStackTrace();
    } finally {
        // Close the resources in the reverse order of their opening.
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

</body>
</html>
