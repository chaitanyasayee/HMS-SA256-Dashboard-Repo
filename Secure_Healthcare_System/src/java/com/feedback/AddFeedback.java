package com.feedback;
import com.connection.ConnectionProvider;
import java.sql.*;
import com.bean.Feedback;
public class AddFeedback {
	public static int register(Feedback f) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into feedback values(?,?,?,?)");
			ps.setString(1, f.getName());
			ps.setString(2, f.getEmail());
			ps.setString(3, f.getContact());
			ps.setString(4, f.getSuggestion());
			status=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
