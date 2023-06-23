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
					<div class="panel-heading">Manage Doctor</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#doctorlist">Doctor
									List</a></li>
							<li role="presentation"><a href="#adddoctor">Add Doctor</a></li>
						</ul>

						<!----------------   Display Doctor Data List Start  --------------->

						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Doctor ID</td>
									<td>Doctor Name</td>
									<td>Department</td>
									<td>Phone No.</td>
									<td>Options</td>
								</tr>
								<%
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from doctor");
										while (rs.next()) {
								%>
								<form action="DeleteDoctor" method="post">
									<tr>
										<td><input type="text" name="docId"
											value="<%=rs.getInt(1)%>" class="form-control"></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(7)%></td>
										<td><%=rs.getString(6)%></td>
										<td><a href="editDoctor.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary"
											data-toggle="modal"> Edit
										</a> <input type="submit" class="btn btn-danger" value="Delete"
											class="glyphicon glyphicon-trash" aria-hidden="true">
										</td>
									</tr>
								</form>
								<%
									}
								%>
							</table>
						</div>
						<!----------------   Display Doctor Data List Ends  --------------->

						<!------ Doctor Edit Info Modal Start Here ---------->


						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">


									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Edit Doctor
											Information</h4>
									</div>

									<div class="modal-body">
										<div class="panel panel-default">
											<div class="panel-body">
												<form class="form-horizontal" action="editDoct.jsp"
													method="post">
													<div class="form-group">
														<label class="col-sm-2 control-label">Doctor Id:</label>
														<div class="col-sm-10">
															<input type="number" class="form-control" name="doctid"
																placeholder="Doctor ID" value="" readonly="readonly">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-2 control-label">Name</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" name="doctname"
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
														<label class="col-sm-2 control-label">Department</label>
														<div class="col-sm-10">

															<select class="form-control" name="dept">
																<option selected="selected">Depatrtment</option>

																<option>Nerology</option>

															</select>

														</div>
													</div>

													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
														<input type="submit" class="btn btn-primary"
															value="Update">
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!----------------   Modal ends here  --------------->


						<!----------------   Add Doctor Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="doctorProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="doctname"
													placeholder="Name" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." required="required">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Department</label>
											<div class="col-sm-10">
												<select class="form-control" name="dept">
													<option selected="selected">Select Department</option>

													<%
														Statement stmt = con.createStatement();
															ResultSet resultset = stmt.executeQuery("select dept_name from department");
															while (resultset.next()) {
													%>
													<option><%=resultset.getString(1)%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Add Doctor">
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
						<!----------------   Add Doctor Ends   --------------->
					</div>
					<!----------------   Panel body Ends   --------------->
				</div>
			</div>
		</div>
	</div>
	<script src="js1/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>