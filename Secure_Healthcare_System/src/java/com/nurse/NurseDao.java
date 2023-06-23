package com.nurse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.Nurse;
import com.connection.ConnectionProvider;

public class NurseDao {
	public static Nurse getRecordById(int id) {
		Nurse n= null;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("select * from nurse where nurse_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				n = new Nurse();
				n.setNurse_id(rs.getInt("nurse_id"));
				n.setName(rs.getString("name"));
				n.setEmail(rs.getString("email"));
				n.setPassword(rs.getString("password"));
				n.setAddress(rs.getString("address"));
				n.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return n;
	}
}
