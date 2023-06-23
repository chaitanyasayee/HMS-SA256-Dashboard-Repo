/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appointment;

import com.connection.ConnectionProvider;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THILIPAN
 */
public class UpdateLabInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      String doctor_id = request.getParameter("doctor_id");
		int id = Integer.parseInt(doctor_id);
		String doctorname = request.getParameter("doctorname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String add = request.getParameter("add");
		String phon = request.getParameter("phon");

		try {
               
			Connection con = (Connection) ConnectionProvider.getCon();
			Statement st = con.createStatement();
			int updatePatientProfile = st.executeUpdate("update nurse set name='" + doctorname + "',email='"
					+ email + "',password='" + pwd + "',address='" + add + "',phone='" + phon + "' where nurse_id='" + id + "'");
			if (updatePatientProfile > 0) {
				response.sendRedirect("afterLabLogin.jsp");
			} else {
				response.sendRedirect("afterLabLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
