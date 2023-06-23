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
					<li role="presentation"><a href="updatePatientProfile.jsp">Update
							Profile</a></li>
					<li role="presentation"><a href="viewAppointment.jsp">View
							Appointment</a></li>
					<li role="presentation"><a href="feedback.jsp">Feedback</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->

			<!-------   Content Area start  --------->
			<div class="col-md-10 maincontent">

				<!-----------  Content Menu Tab Start   ------------>
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Book An Appoinment</div>

					<!----------------   Panel Body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">


							<li role="presentation"><a href="#doctorlist">Doctor
									List</a></li>
							<li role="presentation"><a href="#adddoctor">Book An
									Appoinment</a></li>
						</ul>


						<!----------------   Display Department Data List ends   --------------->


						<!----------------   Modal ends here  --------------->




						<!----------------   Add Department Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="appointmentProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-4 control-label">Name</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="name"
													placeholder="Name">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Email</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="email"
													placeholder="Email...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Contact</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="contact"
													placeholder="Contact...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Age</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="age"
													placeholder="Age...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Day</label>
											<div class="col-sm-4">
												<input type="date" class="form-control" name="day"
													placeholder="Day...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Speciality</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="speciality"
													placeholder="Speciality...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Description</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="description"
													placeholder="Description...">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Doctor Id</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="id"
													placeholder="Doctor Id...">
											</div>
										</div>



										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-10">
												<button type="submit" class="btn btn-primary">Book
													Appointment</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!----------------   Add Department Ends   --------------->
						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Doctor ID</td>
									<td>Doctor Name</td>
									<td>Department</td>
									<td>Email</td>

								</tr>
								<%
									int docId = 0;
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from doctor");
										while (rs.next()) {
											docId = rs.getInt(1);
											session.setAttribute("docId", docId);
								%>

								<tr>
									<td><input type="text" name="did"
										value="<%=rs.getInt(1)%>" class="form-control"></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(3)%></td>
								</tr>

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