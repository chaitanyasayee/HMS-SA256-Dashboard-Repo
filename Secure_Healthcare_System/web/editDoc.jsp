<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.doctor.*"%>
<jsp:useBean id="obj" class="com.bean.Doctor" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = EditDoctorInfo.update(obj);
	response.sendRedirect("doctor.jsp");
%>
