package com.nurse;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.Nurse;
import com.connection.ConnectionProvider;

public class AddNurse {

	public static int register(Nurse n) {
		int status = 0;
		int id = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into nurse values(?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, n.getName());
			ps.setString(3, n.getEmail());
			ps.setString(4, n.getPassword());
			ps.setString(5, n.getAddress());
			ps.setString(6, n.getPhone());
			status = ps.executeUpdate();
		} catch (Exception e) {
		}

		return status;
	}

}
