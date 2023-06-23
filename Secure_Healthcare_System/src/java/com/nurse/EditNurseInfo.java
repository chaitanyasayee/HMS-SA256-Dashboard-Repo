package com.nurse;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.Nurse;
import com.connection.ConnectionProvider;

public class EditNurseInfo {
	public static int update(Nurse n) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update nurse set name=?,email=?,password=?,address=?,phone=? where nurse_id=?");
			ps.setString(1, n.getName());
			ps.setString(2, n.getEmail());
			ps.setString(3, n.getPassword());
			ps.setString(4, n.getAddress());
			ps.setString(5, n.getPhone());
			ps.setInt(6, n.getNurse_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
