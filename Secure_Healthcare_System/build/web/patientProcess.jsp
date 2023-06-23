<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.patient.*"%>
<jsp:useBean id="obj" class="com.bean.Patient" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = AddPatient.register(obj);
	response.sendRedirect("patients.jsp");
%>
