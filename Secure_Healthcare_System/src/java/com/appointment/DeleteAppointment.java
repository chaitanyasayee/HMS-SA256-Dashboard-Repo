package com.appointment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.ConnectionProvider;

/**
 * Servlet implementation class DeleteAppointment
 */
@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String apid = request.getParameter("apid");
		int id = Integer.parseInt(apid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int cancelAppointment = st.executeUpdate("delete from appointment where apid='" + id + "'");
			if (cancelAppointment > 0) {
				response.sendRedirect("afterDoctorLogin.jsp");
			} else {
				response.sendRedirect("afterDoctorLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
