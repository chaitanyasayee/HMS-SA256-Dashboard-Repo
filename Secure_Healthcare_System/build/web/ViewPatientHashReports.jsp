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
                 <% String val1=request.getAttribute("v1")!=null?request.getAttribute("v1").toString():" ";%>
                     <% String val2=request.getAttribute("v2")!=null?request.getAttribute("v2").toString():" ";%>
		<%
			if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		%>
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
					<div class="panel-heading">View Patient Files</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="ViewPatientFiles"
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
                                                                   if( rs.getInt(1) == Integer.parseInt(val2))
                                                                   {
						%>
                                                <option value="<%=rs.getInt(1)%>" selected><%=rs.getString(2)%></option>
                                                      <%
										}
else {
									%>
                                                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                                <%
                                                    }
										}
									%>
                                                
                                                </select>
                                                
                                                </div>
										</div>
								
										
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="View Patient Files">
											</div>
										</div>
                                                                        
                                                                           <div class="form-group">
											<div class="col-sm-12">
                                                                                            <label class="col-sm-12 control-label"><%= val1 %></label>
                                                                        </div>
										</div>
									</form>
								
								</div>
							</div>
						</div>
                                                                        
                                                                        <div class="panel-heading">View Patient Reports</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						

<table class="table table-bordered table-hover">
								<tr class="active">
									<td> ID</td>
									<td>Patient Name</td>
									<td>Lab Assistant Name</td>
									<td>BMP</td>
                                                                        <td>CBC</td>
                                                                        <td>BP</td>
                                                                        <td>KCL</td>
                                                                             <td>PMS</td>
                                                                        <td>HEARTRATE</td>
                                                                        <td>PULSE</td>
                                                                        <td>CreatedDate</td>
                                                                        
								</tr>
								<%
									
										Connection con1 = ConnectionProvider.getCon();
										Statement st1 = con1.createStatement();
										ResultSet rs1 = st1.executeQuery("select patientrecords.ID,patient.patient_name as PatientName,nurse.name as NurseName,patientrecords.BMPHASH, patientrecords.CBCHASH, patientrecords.BPHASH, patientrecords.KCLHASH, patientrecords.PMSHASH, patientrecords.HEARTRATEHASH, patientrecords.PULSEHASH,patientrecords.CreatedDate from patientrecords  inner join nurse on nurse.nurse_id = patientrecords.LabID inner join patient on patient.patient_id = patientrecords.PatientID  where patientrecords.PatientID='" + val2 + "'");
										while (rs1.next()) {
											
								%>
							
									<tr>
										
                                                                               <td><%=rs1.getInt(1)%></td>
										<td><%=rs1.getString(2)%></td>
										<td><%=rs1.getString(3)%></td>
										<td><%=rs1.getString(4)%></td>
                                                                                <td><%=rs1.getString(5)%></td>
                                                                                <td><%=rs1.getString(6)%></td>
                                                                                <td><%=rs1.getString(7)%></td>
										<td><%=rs1.getString(8)%></td>
                                                                                <td><%=rs1.getString(9)%></td>
                                                                                <td><%=rs1.getString(10)%></td>
                                                                                  <td><%=rs1.getString(11)%></td>
									</tr>
								
								<%
									}
								%>

							</table>
						<!----------------   Add Patients Ends   --------------->
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