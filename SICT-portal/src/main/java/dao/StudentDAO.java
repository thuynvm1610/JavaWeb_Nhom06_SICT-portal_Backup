package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Student;
import util.DBConnect;

public class StudentDAO {

	public List<Student> findAll() {
		String sql = "select * from student";
		DBConnect dbConn = new DBConnect();
		List<Student> studentList = new ArrayList<>();
		try {
			Connection conn = dbConn.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Student student = new Student();
				student.setStudentID(rs.getString("studentID"));
				student.setName(rs.getString("name"));
				student.setGender(rs.getString("gender"));
				student.setDob(rs.getDate("dob"));
				student.setEmail(rs.getString("email"));
				studentList.add(student);
			}
			conn.close();
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return studentList;
	}

	public Student findByID(String studentID) {
		String sql = "select * from student where studentID = ?";
		DBConnect dbConn = new DBConnect();
		Student student = null;
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				student = new Student();
				student.setStudentID(rs.getString("studentID"));
				student.setName(rs.getString("name"));
				student.setGender(rs.getString("gender"));
				student.setDob(rs.getDate("dob"));
				student.setEmail(rs.getString("email"));
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return student;
	}

	public boolean insert(Student student) {
		String sql = "insert into student values (?, ?, ?, ?, ?)";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getStudentID());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getGender());
			pstmt.setDate(4, student.getDob());
			pstmt.setString(5, student.getEmail());
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean update(Student student) {
		String sql = "update student set name = ?, gender = ?, dob = ?, email = ? where studentID = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getGender());
			pstmt.setDate(3, student.getDob());
			pstmt.setString(4, student.getEmail());
			pstmt.setString(5, student.getStudentID());
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(String studentID) {
		String sql = "delete from student where studentID = ?";
		DBConnect dbConn = new DBConnect();
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			pstmt.executeUpdate();
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean isEmailExists(String email, String studentID) {
		String sql = "select email from student where email = ? and studentID != ? " + "union "
				+ "select email from teacher where email = ?";
		DBConnect dbConn = new DBConnect();

		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, studentID);
			pstmt.setString(3, email);
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

	public boolean isStudentExists(String studentID, String role) {
		if (role.equals("admin"))
			return true;
		else {
			String sql = "select studentID from student where studentID = ?";
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
				e.printStackTrace();
				return false;
			}
		}
	}

	public int totalStudent() {
		String sql = "select count(*) from student";
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

	public String getStudentName(String studentID) {
		String sql = "select name from student where studentID = ?";
		DBConnect dbConn = new DBConnect();
		String studentName = null;
		try {
			Connection conn = dbConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				studentName = rs.getString("name");
			}
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentName;
	}

}
