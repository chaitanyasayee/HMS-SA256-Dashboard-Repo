<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.browser.Database.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>Browser | Login</title>
<link rel="stylesheet" href="css/register.css">
</head>
<body>
<%
//String email = session.getAttribute("email").toString();
//String password = session.getAttribute("password").toString();
String emailch = " ";
String passwordch = " ";
Connection con;
con = DatabaseConnection.createConnection();
try{
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from register");
	while(rs.next()){
		emailch = rs.getString("email");
		passwordch = rs.getString("password");
	}
	
}catch(Exception e){
	e.printStackTrace();
}

%>
<div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="BrowserLoginServlet" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">E-Mail:</label><br>
                                <input type="text" name="email" id="username" value="<%=emailch %>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" value="<%=passwordch %>" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
                                <a href="#" class="text-info"></a>
                            </div>
                            <div id="register-link" class="text-right">
                            	<br>
                                <a href="BrowserRegister.jsp" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>