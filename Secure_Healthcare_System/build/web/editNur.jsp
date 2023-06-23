<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.nurse.*"%>
<jsp:useBean id="obj" class="com.bean.Nurse" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = EditNurseInfo.update(obj);
	response.sendRedirect("nurse.jsp");
%>
