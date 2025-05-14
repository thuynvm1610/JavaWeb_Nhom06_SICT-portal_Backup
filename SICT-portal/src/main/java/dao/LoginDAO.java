package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnect;

public class LoginDAO {
	
	public boolean isUsernameExists(String username) {
		String sql = "select * from account where username = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			boolean result = rs.next();
			conn.close();
			pstmt.close();
			rs.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}
	
	public boolean isPasswordValid(String username, String password) {
		String sql = "select password from account where username = ? and password = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			boolean result = rs.next();
			conn.close();
			pstmt.close();
			rs.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String getRole(String username) {
		String sql = "select role from account where username = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			String role = null;
			if (rs.next()) {
			    role = rs.getString("role");
			}
			conn.close();
			pstmt.close();
			rs.close();
			return role;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
