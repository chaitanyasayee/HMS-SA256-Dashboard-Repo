<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
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
				<!----------------   Menu Tab Start   --------------->
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Manage Nurse</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#doctorlist">Lab Assistant List</a></li>
							<li role="presentation"><a href="#adddoctor">Add Lab Assistant</a></li>
						</ul>

						<!----------------   Display Nurse Data List Start  --------------->

						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Lab Assistant ID</td>
									<td>Lab Assistant Name</td>
									<td>Email</td>
									<td>Address</td>
									<td>Phone No.</td>
									<td>Options</td>
								</tr>
								<%
									Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from nurse");
										while (rs.next()) {
								%>
								<form action="DeleteNurse" method="post">
								<tr>
									<td><input type="text" name="nid"
										value="<%=rs.getInt(1)%>" class="form-control"></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><a href="editNurse.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary" data-toggle="modal"> Edit
									</a>&nbsp;<input type="submit" value="Delete" class="btn btn-danger"
										class="glyphicon glyphicon-trash" aria-hidden="true">
									</td>
								</tr>
								</form>
								<%
									}
								%>

							</table>
						</div>
						<!----------------   Display Nurse Data List Ends  --------------->

						<!----------------   Add Nurse Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="nurseProcess.jsp"
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="name"
													placeholder="Name">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="Email" class="form-control" name="email"
													placeholder="Email">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="password"
													placeholder="Password">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="address"
													placeholder="Address">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phone"
													placeholder="Phone No.">
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-primary">Add
													Lab Assistant</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!----------------   Add Nurse Ends   --------------->
					</div>
					<!----------------   Panel body Ends   --------------->
				</div>
				<!----------------   Menu Tab Ends   --------------->
			</div>
			<!---- Content Ares Ends  -------->
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
</body>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>
</html>