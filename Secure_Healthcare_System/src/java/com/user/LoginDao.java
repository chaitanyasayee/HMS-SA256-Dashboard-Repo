package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.ConnectionProvider;

/**
 * Servlet implementation class LoginDao
 */
@WebServlet("/LoginDao")
public class LoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		// TODO Auto-generated method stub
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				try {
					HttpSession hs = request.getSession();
					Connection con = ConnectionProvider.getCon();
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select name,email,password from user where email='" + email + "'and password='" + password + "'");
					if (rs.next()) {
						hs.setAttribute("uname", rs.getString(1));
						response.sendRedirect("department.jsp");
					} else {
						response.sendRedirect("index.html");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		doGet(request, response);
	}

}
