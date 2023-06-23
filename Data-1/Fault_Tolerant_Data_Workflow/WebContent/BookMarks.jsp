<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.browser.Database.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Marks</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
String domain = request.getParameter("domain");
String filename = request.getParameter("filename");


session.setAttribute("filename", filename);

System.out.println(domain+" "+filename);

int ans = 0;
Connection con;
con = DatabaseConnection.createConnection();
try{
	PreparedStatement ps = con.prepareStatement("insert into bookmarks values (?,?,?)");
	ps.setString(1, domain);
	ps.setString(2, filename);
	ps.setString(3, email);
	ans = ps.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
if(ans == 1){
	response.sendRedirect("SearchEngine.jsp");
}else{
	response.sendRedirect("Error.jsp");
}
%>
</body>
</html>