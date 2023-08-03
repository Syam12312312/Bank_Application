<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" import="java.util.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style>
        body {
            background-image: url("https://cdn.wallpapersafari.com/26/10/lV9LYT.jpg");
            background-size: cover;
            font-family: Arial, sans-serif;
            color: black;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin-top: 0;
            color: black;
        }

        table {
            margin: 0 auto;
            max-width: 400px;
            width: 100%;
            background-color: rgba(150, 150, 150, 0.5);
            padding: 20px;
            border-radius: 10px;
        }

        input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="number"],
    select {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        
    }

        input[type='submit'],
        a {
            width: auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

</head>
<body>
		
	
	<%
	
	out.println("<h1>Update Customer Details</h1>");

	String sid = request.getParameter("Phone");
	

	ArrayList<String> ar = new ArrayList<>();

	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");

	    PreparedStatement ps1 = con.prepareStatement("select * from BankApplication where Phone=?");
	    ps1.setString(1, sid);
	    ResultSet rs = ps1.executeQuery();

	    while (rs.next()) {
	        ar.add(rs.getString(1));
	        ar.add(rs.getString(2));
	        ar.add(rs.getString(3));
	        ar.add(rs.getString(4));
	        ar.add(rs.getString(5));
	        ar.add(rs.getString(6));
	        ar.add(rs.getString(7));
	    }
	%>
	    
	   
	
	 <form action="Update2.jsp">
    <table>
        <tr><td>First_Name</td><td><input type="text" name="FName" value="<% out.print(ar.get(0)); %>" style="border-radius:30px"/></td></tr>
        <tr><td>Second_Name</td><td><input type="text" name="SName" value="<% out.print(ar.get(1)); %>"style="border-radius:30px"/></td></tr>
        <tr><td>Street</td><td><input type="text" name="Street" value="<% out.print(ar.get(2)); %>"style="border-radius:30px"/></td></tr>
        <tr><td>Address</td><td><input type="text" name="Address" value="<% out.print(ar.get(3)); %>"style="border-radius:30px"/></td></tr>
        <tr>
            <td>State</td>
            <td>
                <select name="State" style="border-radius:30px">
                <option>--SELECT--</option>
                    <option>AP</option>
                    <option>TELANGANA</option>
                    <option>DELHI</option>
                    <option>MADHYA PRADESH</option>
                    <option>GUJARAT</option>
                    <option>OTHER</option>
                </select>
            </td>
        </tr>
        <tr><td>Email</td><td><input type="email" name="Email" value="<% out.print(ar.get(5)); %>"style="border-radius:30px"/></td></tr>
        <tr><td>Phone</td><td><input type="number" name="Phone" value="<% out.print(ar.get(6)); %>"style="border-radius:30px"/></td></tr>
        <tr>
            <td colspan="2"><input type="submit" value="Edit &amp; Save"/></td>
            <td colspan="2"><a href="View.jsp">Back</a></td>
        </tr>
    </table>
</form>

<%
    con.close();
    ps1.close();
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
>
	 
</body>

</html>