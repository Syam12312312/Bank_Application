<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*" errorPage="Exception.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<style>
		body {
        background-image: url('https://cdn.wallpapersafari.com/26/10/lV9LYT.jpg');
        background-size: cover;
        font-family: Arial, sans-serif;
        color: black;
        padding: 20px;
        text-align: center;
    }

    h1 {
        margin-top: 0;
        color:white;
        color: black;
    }

    table {
    margin: 0 auto;
    
    width: 90%;
    background-color: rgba(550, 550,550, 0.5);
    padding: 20px;
    border-radius: 10px;
}
th, td {
	padding: 10px;
	}

		th {
		background-color: #333;
		color: #fff;
		}

		
		a {
		color: black;
		text-decoration: none;
		background-color: rgba(200, 200, 200, 0.5);
		padding: 8px 16px;
		border-radius: 5px;
		transition: background-color 0.3s, transform 0.3s;
		}

		a:hover {
		background-color: grey;
		 color: #ffcc00;
		transform: scale(1.1);
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

    input[type="submit"] {
        width: auto;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    
		};
</style>
</head>
<body>
	<h1>Customers List</h1>
	

	<table border='1'>
		<tr><th>First_name</th><th>Second_Name</th><th>Street</th><th>Address</th><th>State</th><th>Email</th><th>Phone</th><th>Edit</th><th>Delete</th></tr>
	<%
	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
	    PreparedStatement ps = con.prepareStatement("select * from BankApplication");
	    ResultSet rs = ps.executeQuery();

	   while (rs.next()) { %>
	    <tr>
	        <td><% out.print(rs.getString(1)); %></td>
	        <td><% out.print(rs.getString(2)); %></td>
	        <td><% out.print(rs.getString(3)); %></td>
	        <td><% out.print(rs.getString(4)); %></td>
	        <td><% out.print(rs.getString(5)); %></td>
	        <td><% out.print(rs.getString(6)); %></td>
	        <td><% out.print(rs.getString(7)); %></td>
	        <td><a href="Update.jsp?Phone=<% out.print(rs.getString(7)); %>"<i class="material-icons">&#xe150;</i></a></td>
	        <td><a href="Delete.jsp?Phone=<% out.print(rs.getString(7)); %>" <i class="material-icons" style="font-size:28px;color:red">remove_circle_outline</i></a></td>
	    </tr>
	<% } %>


	    </table><br>

	   </body>
	    </html>
	  <a href='Index.html'>Add New Customer</a>
	  <%
	    out.close();
	    con.close();
	} catch (Exception ae) {
	    ae.printStackTrace();
	}
	%>

</body>
</html>