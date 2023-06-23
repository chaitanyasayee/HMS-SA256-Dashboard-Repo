package com.browser.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.browser.Bean.RegisterBean;
import com.browser.Bean.UploadBean;
import com.browser.Blockchain.Block;
import com.browser.Blockchain.NoobChain;
import com.browser.Database.DatabaseConnection;
import com.browser.Interface.BrowserInterface;

public class BrowserImplementation implements BrowserInterface {
	Connection con;
	
	
	@Override
	public int register(RegisterBean rb) {
		int ans = 0;
		con = DatabaseConnection.createConnection();
		try{
			PreparedStatement ps = con.prepareStatement("insert into register values (?,?,?,?,?,?)");
			ps.setString(1, rb.getName());
			ps.setString(2, rb.getUsername());
			ps.setString(3, rb.getPassword());
			ps.setString(4, rb.getEmail());
			ps.setString(5, rb.getAddress());
			ps.setString(6, rb.getContact());
			ans = ps.executeUpdate();
			
			ArrayList<Block> blockchain = new ArrayList<Block>();
			String[] packetdata = new String[6];
			packetdata[0] = rb.getName();
			packetdata[1] = rb.getUsername();
			packetdata[2] = rb.getPassword();
			packetdata[3] = rb.getEmail();
			packetdata[4] = rb.getAddress();
			packetdata[5] = rb.getContact();

			NoobChain nc = new NoobChain();
			blockchain = nc.doblockchain(packetdata);
			int ans1 = 0;
			try {
			
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO userblockchain(user,name,username,password,email,address,contact) VALUES(?,?,?,?,?,?,?)");
				ps1.setString(1, rb.getName());
				ps1.setString(2, blockchain.get(0).hash);
				ps1.setString(3, blockchain.get(1).hash);
				ps1.setString(4, blockchain.get(2).hash);
				ps1.setString(5, blockchain.get(3).hash);
				ps1.setString(6, blockchain.get(4).hash);
				ps1.setString(7, blockchain.get(5).hash);
					ans1 = ps1.executeUpdate();
					con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return ans;
	}


	@Override
	public int login(String email, String password) {
		int ans = 0;
		try{
			con = DatabaseConnection.createConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from register where email='"+email+"' and password='"+password+"'");
			while(rs.next()){
				String emailch = rs.getString("email");
				String passwordch = rs.getString("password");
				if(emailch.equals(email)&&passwordch.equals(password)){
					ans = 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return ans;
	}


	@Override
	public int fileupload(UploadBean ub) {
		int ans = 0;
		String domainname=ub.getFilename().substring(0, ub.getFilename().indexOf("."));
		System.out.println("The filename without . extenstion: "+domainname);
		String domain = "www."+domainname+".com";
		System.out.println("The domain name is: "+domain);
		con = DatabaseConnection.createConnection();
		try{
			PreparedStatement ps = con.prepareStatement("insert into serverdata values (?,?,?,?,?,?,?,?)");
			ps.setString(1, ub.getContent());
			ps.setString(2, ub.getFilename());
			ps.setString(3, ub.getSize());
			ps.setString(4, ub.getType());
			ps.setString(5, ub.getPath());
			ps.setString(6, ub.getEncrypt());
			ps.setString(7, ub.getDecrypt());
			ps.setString(8, domain);
			ans = ps.executeUpdate();
			
			
			ArrayList<Block> blockchain = new ArrayList<Block>();
			//String username = "" ;
			//String filename1 = "" ;
			//String type = "";
			//String path = "";
			//String content = "";
			//String size = "";
			//String requestby1=request.getParameter("reqby");
			//System.out.println("Requested by: "+requestby1);
			//System.out.println("Data For Blockchain Performence: "+username+"-"+filename1+"-"+type+"-"+path+"-"+content+"-"+size);

			//try {
			//	Class.forName("com.mysql.jdbc.Driver");
			//	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/finance","root","root");
			//	Statement st = con.createStatement();
			//	ResultSet rs = st.executeQuery("select * from fileupload");
			//	while(rs.next()) {
			//		username = rs.getString("username");
			//		filename1 = rs.getString("filename");
			//		type = rs.getString("type");
			//		path = rs.getString("path");
			//		content = rs.getString("content");
				//	size = rs.getString("size");
			//	}
			//}catch(Exception e) {
			//	e.printStackTrace();
			//}
			//System.out.println(dataholder);
			String[] packetdata = new String[6];
			packetdata[0] = ub.getContent();
			packetdata[1] = ub.getFilename();
			packetdata[2] = ub.getSize();
			packetdata[3] = ub.getPath();
			packetdata[4] = ub.getEncrypt();
			packetdata[5] = domain;

			NoobChain nc = new NoobChain();
			blockchain = nc.doblockchain(packetdata);
			int ans1 = 0;
			try {
			
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO blockchain(domain,block1,block2,block3,block4,block5,block6) VALUES(?,?,?,?,?,?,?)");
				ps1.setString(1, domain);
				ps1.setString(2, blockchain.get(0).hash);
				ps1.setString(3, blockchain.get(1).hash);
				ps1.setString(4, blockchain.get(2).hash);
				ps1.setString(5, blockchain.get(3).hash);
				ps1.setString(6, blockchain.get(4).hash);
				ps1.setString(7, blockchain.get(5).hash);
					ans1 = ps1.executeUpdate();
					con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ans;
	}

}
