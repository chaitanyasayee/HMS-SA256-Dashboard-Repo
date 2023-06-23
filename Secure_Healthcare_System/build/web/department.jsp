<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="com.bean.Department"%>
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
				<h2>
					Soft Computing Technique for Block Chain Enabled 
Secure Healthcare System
					</h2>
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
					<li role="presentation"><a href="department.jsp">Department</a></li>
					<li role="presentation"><a href="doctor.jsp">Doctors</a></li>
					<li role="presentation"><a href="patients.jsp">Patients</a></li>
					<li role="presentation"><a href="nurse.jsp">Lab Assistant</a></li>
					<li role="presentation"><a href="viewFeedback.jsp">View Feedback</a></li>
					<li role="presentation"><a href="profile.jsp">Profile</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->

			<!-------   Content Area start  --------->
			<div class="col-md-10 maincontent">

				<!-----------  Content Menu Tab Start   ------------>
				<div class="panel panel-default contentinside">
					<div class="panel-heading">Manage Department</div>

					<!----------------   Panel Body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#doctorlist">Department
									List</a></li>
							<li role="presentation"><a href="#adddoctor">Add
									Department</a></li>
						</ul>

						<!----------------   Display Department Data List start   --------------->

						<div id="doctorlist" class="switchgroup">
							<table class="table table-bordered table-hover">
								<tr class="active">
									<td>Department ID</td>
									<td>Department Name</td>
									<td>Department Description</td>
									<td>Options</td>
								</tr>
								<%
									int deptId = 0;
										Connection con = ConnectionProvider.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from department");
										while (rs.next()) {
											deptId = rs.getInt(1);
											session.setAttribute("deptId", deptId);
								%>
								<form action="DeleteServlet" method="post">
									<tr>
										<td><input type="text" name="did"
											value="<%=rs.getInt(1)%>" class="form-control"></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><a href="editDepartment.jsp?id=<%=rs.getInt(1)%>" class="btn btn-primary"
											data-toggle="modal">Edit
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
						<!----------------   Display Department Data List ends   --------------->

						<!------ Edit Department Modal Start ---------->


						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">

							<div class="modal-dialog" role="document">
								<div class="modal-content">


									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Edit Department
											Information</h4>
									</div>

									<div class="modal-body">
										<div class="panel panel-default">
											<div class="panel-body">
												<%
													ResultSet resultset = st.executeQuery(
																"select * from department where dept_id='" + session.getAttribute("deptId") + "'");
														while (resultset.next()) {
												%>
												<form class="form-horizontal" action="#">

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															ID</label>
														<div class="col-sm-4">
															<input type="number" class="form-control" name="deptId"
																value="<%=session.getAttribute("deptId")%>"
																readonly="readonly">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Name</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptName"
																value="<%=resultset.getString(2)%>">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Description</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptDesc"
																value="<%=resultset.getString(3)%>">
														</div>
													</div>
													<%
														}
													%>
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




						<!----------------   Add Department Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="departmentProcess.jsp"
										method="post">
										<div class="form-group">
											<label class="col-sm-4 control-label">Department Name</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="deptName"
													placeholder="Enter Department Name">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 control-label">Department
												Description</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="deptDesc"
													placeholder="Enter Department Description here...">
											</div>
										</div>


										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-10">
												<button type="submit" class="btn btn-primary">Add
													Department</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!----------------   Add Department Ends   --------------->
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
				response.sendRedirect("index.jsp");
			}
		%>
	
</body>
</html>