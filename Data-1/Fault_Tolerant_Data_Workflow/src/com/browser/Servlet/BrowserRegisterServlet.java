package com.browser.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.browser.Bean.RegisterBean;
import com.browser.Implementation.BrowserImplementation;
import com.browser.Interface.BrowserInterface;

/**
 * Servlet implementation class BrowserRegisterServlet
 */
@WebServlet("/BrowserRegisterServlet")
public class BrowserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowserRegisterServlet() {
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
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		
		System.out.println(name+" "+username+" "+password+" "+cpassword+" "+email+" "+address+" "+contact);
		
		if(password.equals(cpassword)){
		RegisterBean rb = new RegisterBean();
		rb.setName(name);
		rb.setUsername(username);
		rb.setPassword(password);
		rb.setEmail(email);
		rb.setAddress(address);
		rb.setContact(contact);
		
		BrowserInterface bi = new BrowserImplementation();
		int i = bi.register(rb);
		System.out.println("The value of i is: "+i);
		if(i == 1){
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			response.sendRedirect("BrowserLogin.jsp");
		}else{
			response.sendRedirect("Error.jsp");
		}
		
		}
	}

}
