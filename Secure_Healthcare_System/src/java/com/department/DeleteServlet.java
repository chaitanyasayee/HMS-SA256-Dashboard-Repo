package com.department;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.connection.ConnectionProvider;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("did");
		System.out.println(sid);
		int id = Integer.parseInt(sid);
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int deleteRecord = st.executeUpdate("delete from department where dept_id='" + id + "'");
			if (deleteRecord > 0) {
				response.sendRedirect("department.jsp");
			} else {
				response.sendRedirect("department.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}