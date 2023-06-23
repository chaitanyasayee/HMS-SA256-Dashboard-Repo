<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="com.bean.Patient"%>
<%@ page import="com.patient.*"%>
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
					
					<li role="presentation"><a href="updatePatientProfile.jsp">Update Profile</a></li>
					<li role="presentation"><a href="ViewPatientReportDetails.jsp">View Report Files</a></li>
                                        <li role="presentation"><a href="ViewPatientFileRequest.jsp">View File Request</a></li>
					<li role="presentation"><a href="feedback.jsp">Feedback</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Edit Patient Information</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#adddoctor">Click Here to Edit
									Patient Information</a></li>
						</ul>



						<!----------------   Display Patient Data List Ends  --------------->
						<%
								Connection con = ConnectionProvider.getCon();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from patient where patient_name='" + session.getAttribute("uname") + "'");
								while (rs.next()) {
						%>
						<!----------------   Add Patient Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="UpdatePatientInfo"
										method="post">
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="patient_id"
													value="<%=rs.getInt(1)%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="patientname"
													placeholder="Name" value="<%=rs.getString(2)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" value="<%=rs.getString(3)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" value="<%=rs.getString(4)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" value="<%=rs.getString(5)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." value="<%=rs.getString(6)%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Sex</label>
											<div class="col-sm-2">
												<select class="form-control" name="sex"
													value="<%=rs.getString(7)%>">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Age</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="age"
													placeholder="Age" value="<%=rs.getInt(9)%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Blood Group</label>
											<div class="col-sm-2">
												<select class="form-control" name="bgroup"
													value="<%=rs.getString(10)%>">
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
													value="Update Patient Info">
											</div>
										</div>
									</form>
									<%
										}
									%>

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
			response.sendRedirect("patientLogin.jsp");
		}
	%>
</body>
</html>