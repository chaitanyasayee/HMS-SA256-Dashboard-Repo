package com.browser.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.browser.Implementation.BrowserImplementation;
import com.browser.Interface.BrowserInterface;

/**
 * Servlet implementation class BrowserLoginServlet
 */
@WebServlet("/BrowserLoginServlet")
public class BrowserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowserLoginServlet() {
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
		doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(email+" "+password);
		
		BrowserInterface bi = new BrowserImplementation();
		int i = bi.login(email, password);
		System.out.println("The value of i is: "+i);
		if(i == 1){
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("BrowserHome.jsp");
		}else{
			response.sendRedirect("Error.jsp");
		}
	}

}
