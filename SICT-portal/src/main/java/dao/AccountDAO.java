package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import util.DBConnect;

public class AccountDAO {

	public List<Account> findAll() {
		String sql = "select * from account";
		DBConnect dbConn = new DBConnect();
		List<Account> accountList = new ArrayList<>();
		try {
			Connection conn = dbConn.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Account account = new Account();
				account.setAccountID(rs.getString("accountID"));
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setRole(rs.getString("role"));
				account.setStudentID(rs.getString("studentID"));
				accountList.add(account);
			}
			conn.close();
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return accountList;
	}

	public Account findByID(String accountID) {
		String sql = "select * from account where accountID = ?";
		DBConnect dbConn = new DBConnect();
		Account account = null;
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				account = new Account();
				account.setAccountID(rs.getString("accountID"));
				account.setUsername(rs.getString("username"));
				account.setPassword(rs.getString("password"));
				account.setRole(rs.getString("role"));
				account.setStudentID(rs.getString("studentID"));
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return account;
	}

	public boolean insert(Account account) {
		String sql = "insert into account values (?, ?, ?, ?, ?)";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account.getAccountID());
			pstmt.setString(2, account.getUsername());
			pstmt.setString(3, account.getPassword());
			pstmt.setString(4, account.getRole());
			pstmt.setString(5, account.getStudentID());
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean update(Account account) {
		String sql = "update account set username = ?, password = ? where accountID = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account.getUsername());
			pstmt.setString(2, account.getPassword());
			pstmt.setString(3, account.getAccountID());
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(String accountID) {
		String sql = "delete from account where accountID = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountID);
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean isStudentIDUsed(String studentID, String oldStudentID, String role) {
		if (role.equals("admin")) {
			return false;
		} else if (role.equals("student") & studentID.equals(oldStudentID)) {
			return false;
		} else if (role.equals("student") & !studentID.equals(oldStudentID)) {
			String sql = "select studentID from account where studentID = ?";
			DBConnect dbConn = new DBConnect();
			try {
				Connection conn = dbConn.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, studentID);
				ResultSet rs = pstmt.executeQuery();
				boolean result = rs.next();
				conn.close();
				pstmt.close();
				rs.close();
				return result;
			} catch (Exception e) {
				return true;
			}
		}
		return true;
	}

	public boolean isUsernameExists(String username, String accountID) {
		String sql = "select username from account where username = ? and accountID != ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, accountID);
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

	public int totalAccount() {
		String sql = "select count(*) from account";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int result = 0;
			if (rs.next()) {
				result = rs.getInt(1);
			}
			conn.close();
			stmt.close();
			rs.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
