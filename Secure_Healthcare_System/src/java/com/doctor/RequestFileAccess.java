/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.doctor;

import static com.block.MD5.getMd5;
import com.block.SHA256Helper;
import com.connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author THILIPAN
 */
public class RequestFileAccess extends HttpServlet {

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
           
  HttpSession session = request.getSession();
         String patientId = request.getParameter("patientDetails");
      
                             String doctorId=session.getAttribute("doctor_id").toString();
                   String doctorName=session.getAttribute("uname").toString();
                  
                       Date date = new Date();
      String strDateFormat = "dd MMM yyyy HH:mm:ss a";
      SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
      System.out.println(sdf.format(date));
        String HashValue=SHA256Helper.generateHash(patientId+strDateFormat);
		try {
			Connection connection = ConnectionProvider.getCon();
			Statement statement = connection.createStatement();
			int add = statement
					.executeUpdate("insert into filerequest(PatitentID, DoctorID, DoctorName, RequestStatus,HASH, CreatedDate) values('"
							+ patientId + "','" + doctorId  + "','" + doctorName + "','Pending','"+HashValue+"','"+sdf.format(date).toString()+"')");
			if (add > 0) {
                                RequestDispatcher rd=request.getRequestDispatcher("DoctorFileRequest.jsp");
                        request.setAttribute("v1","File Access Requested Successfully");
                        rd.forward(request, response);
			
			} else {
				response.sendRedirect("DoctorFileRequest.jsp");
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
