<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.appointment.*"%>
<jsp:useBean id="obj" class="com.bean.Appointment" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = BookAppointment.register(obj);
	response.sendRedirect("afterPatientLogin.jsp");
%>
