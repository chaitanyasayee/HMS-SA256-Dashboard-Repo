package com.nurse;

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
 * Servlet implementation class DeleteNurse
 */
@WebServlet("/DeleteNurse")
public class DeleteNurse extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("nid");
		int id = Integer.parseInt(sid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int deleteRecord = st.executeUpdate("delete from nurse where nurse_id='" + id + "'");
			if (deleteRecord > 0) {
				response.sendRedirect("nurse.jsp");
			} else {
				response.sendRedirect("nurse.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
