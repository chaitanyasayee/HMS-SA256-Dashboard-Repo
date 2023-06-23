package com.browser.Servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.browser.Bean.UploadBean;
import com.browser.Crypto.AES;
import com.browser.Implementation.BrowserImplementation;
import com.browser.Interface.BrowserInterface;
import com.browser.Pcloud.PCloudAPI;
import com.browser.Pcloud.PCloudAPIDebug;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
//import com.oreilly.servlet.multipart.FilePart;
//import com.oreilly.servlet.multipart.MultipartParser;
//import com.oreilly.servlet.multipart.ParamPart;
//import com.oreilly.servlet.multipart.Part;
//import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;



@WebServlet("/FileuploadServlet")
public class FileuploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public FileuploadServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at:").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		//HttpSession session=request.getSession();
		//String dataholder=session.getAttribute("dataholder").toString();
		MultipartParser mp =new MultipartParser(request, 999999999);

		String ff = null;
		String filename=request.getParameter("filename");
		String key=request.getParameter("key");
		
				
		Part part = null;
		ArrayList paramValues = new ArrayList();
				
		FilePart filepart = null;
		ParamPart param=null;
		File file1 = null;
		String filepath1 = null;
		String filetype=null;
		String filepath2 = null;
			
				
		long size=0;
		String path=getServletContext().getRealPath("");
				
		System.out.println("path0000000000000000000000=="+path);
				
				
		String editpath=path.substring(0, path.indexOf("."));
				
		System.out.println("edithpath1111111111111111======"+editpath);
				
		String fullpath=editpath+"Decentralized_Browser_SICHER\\WebContent\\LOCAL\\";
		
		File mk = new File(fullpath);
		System.out.println("The file path MK is"+mk);
	    mk.mkdir();
	    System.out.println("The total auto created path Location is"+mk.mkdir());
		System.out.println("fullpath333333333333333=="+fullpath);
				
		while((part=mp.readNextPart())!=null)
			{
					
					if(part.isFile())
					{
						
						filepart=(FilePart)part;
						
						
					 filename=filepart.getFileName();
						
						System.out.println("filename9999999999999999=="+filename);
						
					 fullpath=fullpath+filename;
						
						System.out.println("fullpath5555555555555555555=="+fullpath);
						
						
						
						File file=new File(fullpath);
					 size=filepart.writeTo(file);
						
						System.out.println("size6666666666666=="+size);
						
				 filetype=filepart.getContentType();
						System.out.println("filetype88888888888---"+filetype);
						
					}
					else if(part.isParam())
					{
						param = (ParamPart) part;
						String tagName =param.getName();
						System.out.println("tagName ============= " + tagName);
						String tagValue = param.getStringValue();
						System.out.println("tagValue ************ " + tagValue);
						 
						paramValues.add(tagValue);
						paramValues.add(tagName);
						
					}
				
				}
					// FileInputStrean get bytes from file
				String filecontent = "";
				String encrpt = null;
				  String encontent = null;
				  String decontent = null;

				  if (filename.endsWith(".txt")) {
						
						FileInputStream fis = new FileInputStream(fullpath);
						byte[] b = new byte[fis.available()];
						fis.read(b);
						String reading = new String(b);
						filecontent = filecontent + reading;
		                System.out.println("filecontent=" + filecontent);
		               
		                try {//try1 open
		                	
		                    
		        	encontent = AES.encrypt99(filecontent);
		        	System.out.println("encontent===="+encontent);
		            filepath1 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		            file1 = new File(filepath1);
		            file1.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
		        				BufferedWriter bw = new BufferedWriter(fw);
		                        bw.write(encontent);// Write in file
		                        bw.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
		           
		              //file decrypted and store into filepath2
		                      decontent= AES.decrypt(encontent);
		        				System.out.println("decontent===="+decontent);
		        		    filepath2 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		                        File file2 = new File(filepath2);
		                        file2.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
		        				BufferedWriter bw1 = new BufferedWriter(fw1);
		                        bw1.write(decontent);// Write in file
		                        bw1.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
		           
		                        
		                        } catch (Exception e) {
							
							e.printStackTrace();
						}
		                
		                
					} else if(filename.endsWith(".docx")){
						FileInputStream fis = new FileInputStream(fullpath);
						byte[] b = new byte[fis.available()];
						fis.read(b);
						String reading = new String(b);
						filecontent = filecontent + reading;
		                System.out.println("filecontent=" + filecontent);
		               
		                try {//try1 open
		                	
		                    
		        	encontent = AES.encrypt99(filecontent);
		        	System.out.println("encontent===="+encontent);
		            filepath1 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		            file1 = new File(filepath1);
		            file1.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
		        				BufferedWriter bw = new BufferedWriter(fw);
		                        bw.write(encontent);// Write in file
		                        bw.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
		           
		              //file decrypted and store into filepath2
		                      decontent= AES.decrypt(encontent);
		        				System.out.println("decontent===="+decontent);
		        		    filepath2 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		                        File file2 = new File(filepath2);
		                        file2.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
		        				BufferedWriter bw1 = new BufferedWriter(fw1);
		                        bw1.write(decontent);// Write in file
		                        bw1.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
		           
		                        
		                        } catch (Exception e) {
							
							e.printStackTrace();
						}
						
					} else if(filename.endsWith(".pdf")) {
						FileInputStream fis = new FileInputStream(fullpath);
						byte[] b = new byte[fis.available()];
						fis.read(b);
						String reading = new String(b);
						filecontent = filecontent + reading;
		                System.out.println("filecontent=" + filecontent);
		               
		                try {//try1 open
		                	
		                    
		        	encontent = AES.encrypt99(filecontent);
		        	System.out.println("encontent===="+encontent);
		            filepath1 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		            file1 = new File(filepath1);
		            file1.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
		        				BufferedWriter bw = new BufferedWriter(fw);
		                        bw.write(encontent);// Write in file
		                        bw.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
		           
		              //file decrypted and store into filepath2
		                      decontent= AES.decrypt(encontent);
		        				System.out.println("decontent===="+decontent);
		        		    filepath2 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		                        File file2 = new File(filepath2);
		                        file2.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
		        				BufferedWriter bw1 = new BufferedWriter(fw1);
		                        bw1.write(decontent);// Write in file
		                        bw1.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
		           
		                        
		                        } catch (Exception e) {
							
							e.printStackTrace();
						}
					} else if(filename.endsWith(".sql")) {
						FileInputStream fis = new FileInputStream(fullpath);
						byte[] b = new byte[fis.available()];
						fis.read(b);
						String reading = new String(b);
						filecontent = filecontent + reading;
		                System.out.println("filecontent=" + filecontent);
		               
		                try {//try1 open
		                	
		                    
		        	encontent = AES.encrypt99(filecontent);
		        	System.out.println("encontent===="+encontent);
		            filepath1 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		            file1 = new File(filepath1);
		            file1.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
		        				BufferedWriter bw = new BufferedWriter(fw);
		                        bw.write(encontent);// Write in file
		                        bw.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
		           
		              //file decrypted and store into filepath2
		                      decontent= AES.decrypt(encontent);
		        				System.out.println("decontent===="+decontent);
		        		    filepath2 = editpath + "Decentralized_Browser_SICHER/WebContent/Decrypt/"+filename;
		                        File file2 = new File(filepath2);
		                        file2.createNewFile();
		                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
		                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
		        				BufferedWriter bw1 = new BufferedWriter(fw1);
		                        bw1.write(decontent);// Write in file
		                        bw1.close();// Close connection
		                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
		           
		                        
		                        } catch (Exception e) {
							
							e.printStackTrace();
						}
					} 
		                
		                UploadBean bean=new UploadBean();
		                //bean.setUsername(dataholder);
		                bean.setContent(filecontent);
		                bean.setFilename(filename);
		                bean.setSize(String.valueOf(size));
		                bean.setType(filetype);
		                //bean.setKey(paramValues.get(0).toString());
		                bean.setPath(fullpath);
		                bean.setEncrypt(encontent);
		                bean.setDecrypt(filecontent);
		                System.out.println("mnxc vxc v"+decontent);
		                
		                		                		                
		                
		                BrowserInterface iii=new BrowserImplementation();
		                int f=iii.fileupload(bean);
		                System.out.println("The value of F is111 :"+f);
		                if(f == 1){
		        			if (ServletFileUpload.isMultipartContent(request)) {
		        				try {
		        										
		        					String ftype = null;
		        				    File file=new File(fullpath);
		        				    
		        					FileInputStream ifile=new FileInputStream(file);
		        					PCloudAPI conn=new PCloudAPI(true);
		        					      Hashtable <String, Object> params=new Hashtable <String, Object> ();
		        					      params.put("username", "cloudproject18032019@gmail.com");
		        					      params.put("password", "18032019");
		        					      params.put("folderid", 0);
		        					
		        					      Object res=conn.sendCommand("listfolder", params);
		        					      if (PCloudAPI.resultGetLong(res, "result")!=0){
		        					        System.out.println("Error: "+PCloudAPI.resultGetString(res, "error"));
		        					        return;
		        					      }
		        					      Object[] contents=PCloudAPI.resultGetArray(PCloudAPI.resultGetHashtable(res, "metadata"), "contents");
		        					      for (int ii=0; ii<contents.length; ii++){
		        					        Object entry=contents[ii];
		        					        if (PCloudAPI.resultGetBoolean(entry, "isfolder"))
		        					        {
		        					           System.out.println("Folder: "+PCloudAPI.resultGetString(entry, "name"));
		        					            if(PCloudAPI.resultGetString(entry, "name").equals("MyCloud"))
		        					            {
		        					            	  System.out.println("Folder Id: "+PCloudAPI.resultGetString(entry, "id"));
		        					            	  String fid=PCloudAPI.resultGetString(entry, "id").replace('d',' ');
		        					            	 // fid.replace('d',' ');
		        					            	  ff=fid.trim();
		        					            	  System.out.println(ff);
		        					            					                  
		        					            }
		        					        } 
		        					        
		        					        else
		        					           System.out.println("File: "+PCloudAPI.resultGetString(entry, "name")+" Size: "+PCloudAPI.resultGetLong(entry, "size"));
		        					      }  
		        			              params.put("folderid", ff);
		        					     // params.put("progresshash", "7606879663799546276");
		        			              
		        					      params.put("filename", filename);
		        					      PCloudAPIDebug.print(conn.sendCommand("uploadfile", params, ifile));
		        					      					      					      					
		        						}
		        			 catch (Exception ex) {
		        					request.setAttribute("message", "File Upload Failed due to "
		        							+ ex);
		        				}
		        	 
		        			} else {
		        				request.setAttribute("message",
		        						"Sorry this Servlet only handles file upload request");
		        			}
		        			response.sendRedirect("FileUploadSuccess.jsp");
		        		} else {
		        			response.sendRedirect("Error.jsp");
		        		}
	}

}
