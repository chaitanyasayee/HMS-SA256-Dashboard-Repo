/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nurse;

import com.block.Block;
import com.block.BlockChain;
import com.block.Constants;
import static com.block.MD5.getMd5;
import com.block.Miner;
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

/**
 *
 * @author THILIPAN
 */
public class UpdatePatientRecordtInfo extends HttpServlet {

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
        try
        {
           BlockChain blockChain = new BlockChain();  
        // we will instantiate the Miner class to fetch the minor object.  
        Miner miner = new Miner();  
          
//we have created the genesis or block 0   
        // we will pass the id, the transaction string and previous hash  
        //as this is the first block so we have to manually provide the previous hash     
Block block0 = new Block(0,"transaction1",Constants.GENESIS_PREV_HASH);  
  
        //miner will take the transaction and will mine the block  
        //to find the hash value and miner will append the block to Blockchain  
        miner.mine(block0, blockChain);  
          
        //we will create the next block   
        //we pass id, traction and this time the previous hash will contain  
        // the hash value of Genesis block  
Block block1 = new Block(1,"transaction2",blockChain.getBlockChain().get(blockChain.size()-1).getHash());  
  
        miner.mine(block1, blockChain);  
//  
//    Block block2 = new Block (2,"transaction3",blockChain.getBlockChain().get(blockChain.size()-1).getHash());  
//    miner.mine(block2, blockChain);  

    
    String[] blockdata=block1.toString().split("-");
    
    String hash=blockdata[2].toString();
    String transaction=blockdata[3].toString();
        }
        catch(Exception ex)
        {
            
        }
     String lab_id = request.getParameter("lab_id");
         String patientDetails = request.getParameter("patientDetails");
		String BMP = request.getParameter("BMP");
		String CBC = request.getParameter("CBC");
		String BP = request.getParameter("BP");
		String KCL = request.getParameter("KCL");
                String PMS = request.getParameter("PMS");
		String heartRate = request.getParameter("heartRate");
                String pulseRate = request.getParameter("pulseRate");
                String BMPHash =SHA256Helper.generateHash(BMP);
                String CBCHash =SHA256Helper.generateHash(CBC);
                String BPHash =SHA256Helper.generateHash(BP);
                String KCLHash =SHA256Helper.generateHash(KCL);
                String PMSHash =SHA256Helper.generateHash(PMS);
                String heartRateHash =SHA256Helper.generateHash(heartRate);
                String pulseRateHash =SHA256Helper.generateHash(pulseRate);
                		
                  Date date = new Date();
      String strDateFormat = "dd MMM yyyy HH:mm:ss a";
      SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
      System.out.println(sdf.format(date));
		try {
			Connection connection = ConnectionProvider.getCon();
			Statement statement = connection.createStatement();
			int add = statement
					.executeUpdate("insert into patientrecords(PatientID,LabID, BMP, CBC, BP, KCL, PMS, HEARTRATE, PULSE, BMPHASH, CBCHASH, BPHASH, KCLHASH, PMSHASH, HEARTRATEHASH, PULSEHASH, CreatedDate) values('"
							+ patientDetails + "','" + lab_id  + "','" + BMP + "','" + CBC + "','" + BP + "','" + KCL + "','"
							+ PMS + "','" + heartRate + "','" + pulseRate + "','" + BMPHash + "','" + CBCHash + "','" + BPHash + "','" + KCLHash + "','" + PMSHash + "','" + heartRateHash + "','" + pulseRateHash + "','"+sdf.format(date).toString()+"')");
			if (add > 0) {
                                RequestDispatcher rd=request.getRequestDispatcher("LabPatientEntry.jsp");
                        request.setAttribute("v1","Record Added Successfully");
                        rd.forward(request, response);
			
			} else {
				response.sendRedirect("LabPatientEntry.jsp");
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
