<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browser | Home</title>
<style>
.box {
  text-align: center;
  margin: 550px;
  margin-top: 100px;
  margin-bottom: 35px;
  background-color: #ffffff;
  border: 1px solid black;
  opacity: 0.6;
  height: 250px;
  width: 250px;
  border-radius:8px;

}

.box .select {
	border-radius:8px;
	height: 35px;
	width: 205px;
	text-align: center;
	font-size: 15px;
}

.head{
color:#17a2b8; 
text-align: center;
font-size: 25px; 
margin-top: 100px;
margin-bottom: -55px;
}
.box .btn {
	border-radius:8px;
	height: 45px;
	width: 120px;
	text-align: center;
	font-size: 15px;
	margin-top: 35px;
	
}

</style>
</head>
<body style="background-color: black;">
<div class="head">
<h1>sicher</h1>
</div>

<div class="box">
<form action="DefaultBrowserServlet" method="post">
<h2 style="color:">Set Default Search Engine</h2>
<select value="default" name="sicher" class="select">
<option>---Choose Search Engine---</option>
<option value="sicher">Fault Tolerant and Data</option>
</select>
<input type="submit" class="btn" value="Set Default">
</form>
</div>
</body>
</html>