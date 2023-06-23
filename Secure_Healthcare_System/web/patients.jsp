<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="com.bean.Patient"%>
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
				<h2>
					Soft Computing Technique for Block Chain Enabled 
Secure Healthcare System
					</h3>
			</div>

			<div class="col-md-2 ">
				<ul class="nav nav-pills ">
					<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><%=session.getAttribute("uname")%> <span
							class="caret"></span></a>
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
					<li role="presentation"><a href="department.jsp">Department</a></li>
					<li role="presentation"><a href="doctor.jsp">Doctors</a></li>
					<li role="presentation"><a href="patients.jsp">Patients</a></li>
					<li role="presentation"><a href="nurse.jsp">Lab Assistant</a></li>
					<li role="presentation"><a href="viewFeedback.jsp">View Feedback</a></li>
					<li role="presentation"><a href="profile.jsp">Profile</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Manage Patient</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#doctorlist">Patient
									List</a></li>
							<li role="presentation"><a href="#adddoctor">Add Patient</a></li>
						</ul>


						<!----------------   Display Patients Data List Start  --------------->
						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Id</td>
									<td>Patient Name</td>
									<td>Age</td>
									<td>Sex</td>
									<td>Blood Grp</td>
									<td>Options</td>

								</tr>
								<%
									Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from patient");
										while (rs.next()) {
								%>
								<form action="DeletePatient" method="post">
								<tr>
									<td><input type="text" name="pid" value="<%=rs.getInt(1)%>" class="form-control"></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(9)%></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getString(10)%></td>
									<td><a href="editPatients.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary">Edit</a>
										<input type="submit" class="btn btn-danger" value="Delete"
											class="glyphicon glyphicon-trash" aria-hidden="true">
									</td>
								</tr>
								</form>

								<%
									}
								%>
							</table>
						</div>
						<!----------------   Display Patient Data List Ends  --------------->

						<!----------------   Add Patient Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="patientProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="patientname"
													placeholder="Name">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No.">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Sex</label>
											<div class="col-sm-2">
												<select class="form-control" name="sex">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Birth Date</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" name="bdate"
													placeholder="Birth date">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Age</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="age"
													placeholder="Age">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Blood Group</label>
											<div class="col-sm-2">
												<select class="form-control" name="bgroup">
													<option>A<sup>+</sup></option>
													<option>A<sup>-</sup></option>
													<option>B<sup>+</sup></option>
													<option>B<sup>-</sup></option>
													<option>AB<sup>+</sup></option>
													<option>AB<sup>-</sup></option>
													<option>O<sup>+</sup></option>
													<option>O<sup>-</sup></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Add
													Patient">
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
						<!----------------   Add Patients Ends   --------------->
					</div>
					<!----------------   Panel body Ends   --------------->
				</div>
			</div>
		</div>
	</div>




	<script src="js/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>