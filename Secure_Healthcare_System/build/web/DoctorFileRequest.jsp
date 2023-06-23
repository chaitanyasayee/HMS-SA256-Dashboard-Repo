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
		%>       <% String val1=request.getAttribute("v1")!=null?request.getAttribute("v1").toString():" ";%>
		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<a href="#"><h1>Dashboard</h1></a>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="UpdateDoctorProfile.jsp">Update Profile</a></li>
                                        <li role="presentation"><a href="DoctorFileRequest.jsp">Patient File Request </a></li>
                                       <li role="presentation"><a href="DoctorRequestStatus.jsp">View Request Status</a></li>
                                       <li role="presentation"><a href="ViewPatientFiles.jsp">View Patient Files</a></li>
                                         <li role="presentation"><a href="ViewPatientHashFiles.jsp">View Patient Hash Reports</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Patient File Request</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
					
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="RequestFileAccess"
										method="post">
										  <div class="form-group">
											<label class="col-sm-2 control-label">Select Patient</label>
											<div class="col-sm-10">
                                                                                            
                                                                                            <select class="form-control" name="patientDetails">
                                                                                        <%
								Connection con = ConnectionProvider.getCon();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select patient_id,patient_name from patient");
								while (rs.next()) {
						%>
                                                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                                <%
										}
									%>
                                                
                                                </select>
                                                
                                                </div>
										</div>
								
										
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Request File Access">
											</div>
										</div>
                                                                        
                                                                           <div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
                                                                                            <label class="col-sm-8 control-label"><%= val1 %></label>
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




	<script src="js1/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("doctorLogin.jsp");
		}
	%>
</body>
</html>l>