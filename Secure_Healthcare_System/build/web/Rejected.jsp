<%-- 
    Document   : Approved
    Created on : Nov 16, 2021, 2:45:00 PM
    Author     : THILIPAN
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="com.connection.ConnectionProvider"%>
;
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
          
              int FileID=Integer.parseInt(request.getParameter("FileID"));
          int status=0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update filerequest set RequestStatus=? where ID=?");
			ps.setString(1,"Rejected");
		
			ps.setInt(2, FileID);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
                       response.sendRedirect("ViewPatientFileRequest.jsp");
        
        
        %>
    </body>
</html>
