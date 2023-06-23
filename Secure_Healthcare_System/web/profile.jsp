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

				<!----------------   Menu Tab   --------------->
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Manage Profile</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<%
							Connection con = ConnectionProvider.getCon();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select * from user where name='" + session.getAttribute("uname") + "' ");
							while (rs.next()) {
						%>
						<form class="form-horizontal" action="UpdateUserDao" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name"
										value="<%=rs.getString(2)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" name="email"
										value="<%=rs.getString(3)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="address"
										value="<%=rs.getString(4)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="phone"
										value="<%=rs.getString(5)%>">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-primary"
										value="Update Profile">
								</div>
							</div>
						</form>
						<%
							}
						%>
					</div>

					<!----------------   Panel body Ends   --------------->
				</div>

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Change Password</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<%
							ResultSet rs1 = st.executeQuery("select * from user where name='" + session.getAttribute("uname") + "'");
							if (rs1.next()) {
						%>
						<form class="form-horizontal" action="UpdateUserPassword" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password"
										value="<%=rs1.getString(6) %>">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">New Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="newpwd"
										placeholder="Enter New Password">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Confirm New
									Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="conpwd"
										placeholder="Confirm New Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary">Update
										Password</button>
								</div>
							</div>
						</form>
						<%
							}
						%>
					</div>
					<!----------------   Panel body Ends   --------------->
				</div>
			</div>

		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
	<%
			}else{
				response.sendRedirect("index.jsp");
			}
	%>
</body>
</html>