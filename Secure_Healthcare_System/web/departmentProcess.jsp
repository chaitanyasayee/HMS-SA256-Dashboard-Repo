<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.department.*"%>
<jsp:useBean id="obj" class="com.bean.Department" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = AddDepartment.register(obj);
	response.sendRedirect("department.jsp");
%>

