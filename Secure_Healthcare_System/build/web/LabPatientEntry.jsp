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

						
							<li role="separator" class="divider"></li>
							<li><a href="logout.jsp">Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		<!--- Header Ends --------->
                 <% String val1=request.getAttribute("v1")!=null?request.getAttribute("v1").toString():" ";%>
		<%
			if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		%>
		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<a href="#"><h1>Dashboard</h1></a>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="afterLabLogin.jsp">Update Profile</a></li>
                                        <li role="presentation"><a href="LabPatientEntry.jsp">Patient Report Entry</a></li>
                                        <li role="presentation"><a href="ViewLabPatient.jsp">View Patient Report</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Patient Report Entry</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
			
						<!----------------   Add Patient Start   --------------->
						
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="UpdatePatientRecordtInfo"
										method="post">
                                                                            
                                                                     
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="lab_id"
													value="<%= session.getAttribute("UserID") %>">
											</div>
										</div>
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
											<label class="col-sm-2 control-label">BMP(Basic metabolic panel)</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="BMP"
													placeholder="BMP(Basic metabolic panel)" value="">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">CBC(Complete blood count)</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="CBC"
													placeholder="CBC(Complete blood count)" value="">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">BP(Blood pressure)</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="BP"
													placeholder="BP(Blood pressure)" value="">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">KCL(Potassium chloride)</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="KCL"
													placeholder="KCL(Potassium chloride)" value="">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">PMS(Premenstrual syndrome)</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="PMS"
													placeholder="PMS(Premenstrual syndrome)" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Heart Rate</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="heartRate"
													placeholder="Heart Rate" value="">
											</div>
										</div>
                                                                                <div class="form-group">
											<label class="col-sm-2 control-label">Pulse Rate</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="pulseRate"
													placeholder="Pulse Rate" value="">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Add Patient Records">
											</div>
										</div>
                                                                        <div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
                                                                                            <label class="col-sm-2 control-label"><%= val1 %></label>
                                                                        </div>
										</div>
									</form>

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