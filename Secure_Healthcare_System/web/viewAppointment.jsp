<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="com.bean.Appointment"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images1/logo.png" rel="icon" />
<title>Soft Computing Technique for Block Chain Enabled 
Secure Healthcare System</title>
<!-- Bootstrap -->
<link href="css1/bootstrap.min.css" rel="stylesheet">
<link href="css1/style.css" rel="stylesheet">
<script src="js1/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#doctorlist').show();
		$('.doctor li:first-child a').addClass('active');
		$('.doctor li a').click(function(e) {

			var tabDiv = this.hash;
			$('.doctor li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});

	});
</script>
</head>
<body>
	<div class="container-fluid">

		<!--- Header Start -------->
		<div class="row header">

			<div class="col-md-10">
				<h2>Soft Computing Technique for Block Chain Enabled 
Secure Healthcare System</h2>
			</div>

			<div class="col-md-2 ">
				<ul class="nav nav-pills ">
					<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> <%
 	out.print((String) session.getAttribute("uname"));
 %> <span class="caret"></span>
					</a>
						<ul class="dropdown-menu ">

							<li><a href="profile.jsp">Change Profile</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.jsp">Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		<!--- Header Ends --------->
		<%
			if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		%>

		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<a href="#"><h1>Dashboard</h1></a>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="afterPatientLogin.jsp">Book
							An Appointment</a></li>
					<li role="presentation"><a href="updatePatientProfile.jsp">Update Profile</a></li>
					<li role="presentation"><a href="viewAppointment.jsp">View Appointment</a></li>
					<li role="presentation"><a href="feedback.jsp">Feedback</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->

			<!-------   Content Area start  --------->
			<div class="col-md-10 maincontent">

				<!-----------  Content Menu Tab Start   ------------>
				<div class="panel panel-default contentinside">
					<div class="panel-heading">View Appoinment</div>

					<!----------------   Panel Body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">


							<li role="presentation"><a href="#doctorlist">View
									Appoinment</a></li>
						</ul>
						<!----------------   Add Department Ends   --------------->
						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>ApId</td>
									<td>Name</td>
									<td>Email</td>
									<td>Contact</td>
									<td>Age</td>
									<td>Day</td>
									<td>Speciality</td>
									<td>Description</td>
									<td>Doctor Id</td>
									<td>Action</td>
								</tr>
								<%
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from appointment");
										while (rs.next()) {
								%>
								<form action="CancelAppointment" method="post">
								<tr>
									<td><input type="text" name="apid" value="<%=rs.getInt(1)%>" class="form-control"></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getInt(9)%></td>
									<td><input type="submit" class="btn btn-danger" value="Delete"
											class="glyphicon glyphicon-trash" aria-hidden="true"></td>
								</tr>
								</form>
								<%
									}
								%>

							</table>
						</div>
					</div>
					<!----------------   Panel Body Ends   --------------->
				</div>
				<!-----------  Content Menu Tab Ends   ------------>
			</div>
			<!-------   Content Area Ends  --------->
		</div>
		<script src="js/bootstrap.min.js"></script>
		<%
			} else {
				response.sendRedirect("patientLogin.jsp");
			}
		%>
	
</body>
</html>