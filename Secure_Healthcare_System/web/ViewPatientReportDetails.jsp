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
									
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select patientrecords.ID,patient.patient_name as PatientName,nurse.name as NurseName,patientrecords.BMP, patientrecords.CBC, patientrecords.BP, patientrecords.KCL, patientrecords.PMS, patientrecords.HEARTRATE, patientrecords.PULSE,patientrecords.CreatedDate from patientrecords  inner join nurse on nurse.nurse_id = patientrecords.LabID inner join patient on patient.patient_id = patientrecords.PatientID  where patientrecords.PatientID='" + session.getAttribute("UserID") + "'");
										while (rs.next()) {
											
								%>
							
									<tr>
										
                                                                               <td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getString(4)%></td>
                                                                                <td><%=rs.getString(5)%></td>
                                                                                <td><%=rs.getString(6)%></td>
                                                                                <td><%=rs.getString(7)%></td>
										<td><%=rs.getString(8)%></td>
                                                                                <td><%=rs.getString(9)%></td>
                                                                                <td><%=rs.getString(10)%></td>
                                                                                  <td><%=rs.getString(11)%></td>
									</tr>
								
								<%
									}
								%>

							</table>
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