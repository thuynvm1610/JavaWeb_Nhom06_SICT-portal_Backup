package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import dao.Student_classroomDAO;
import model.Student;
import model.Student_classroom;

@WebServlet(urlPatterns = "/student")
public class StudentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String action = req.getParameter("action");

		if (action.equals("personalInformation")) {
			req.getRequestDispatcher("view/student/personalInformation.jsp").forward(req, resp);
			return;
		} else if (action.equals("classroomListByStudentID")) {
			String studentID = req.getParameter("studentID");
			Student_classroomDAO student_classroomDAO = new Student_classroomDAO();
			List<Student_classroom> student_classroomList = student_classroomDAO.findByID(null, studentID);
			req.setAttribute("student_classroomList", student_classroomList);
			req.setAttribute("studentID", studentID);
			req.getRequestDispatcher("view/student/classroomList.jsp").forward(req, resp);
			return;
		} else if (action.equals("searchStudentListByClassroomID")) {
			String classroomID = req.getParameter("classroomID");
			Student_classroomDAO student_classroomDAO = new Student_classroomDAO();
			List<Student_classroom> student_classroomList = student_classroomDAO.findByID(classroomID, null);
			req.setAttribute("student_classroomList", student_classroomList);
			if (student_classroomList.isEmpty()) {
				req.setAttribute("message", "Không tìm thấy lớp học có mã: " + classroomID);
			}
			req.getRequestDispatcher("view/student/classroomList.jsp").forward(req, resp);
			return;
		} else if (action.equals("updateStudentForm")) {
			String studentID = req.getParameter("studentID");
			StudentDAO studentDAO = new StudentDAO();
			Student student = studentDAO.findByID(studentID);
			req.setAttribute("student", student);
			req.getRequestDispatcher("view/student/updateStudent.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String action = req.getParameter("action");

		if (action.equals("updateStudent")) {
			StudentDAO studentDAO = new StudentDAO();
			StringBuilder message = new StringBuilder();

			if (studentDAO.isEmailExists(req.getParameter("email"), req.getParameter("studentID"))) {
				message.append("Email đã tồn tại!<br>");
			}

			Student student = new Student();
			student.setStudentID(req.getParameter("studentID"));
			student.setName(req.getParameter("name"));
			student.setGender(req.getParameter("gender"));
			student.setDob(Date.valueOf(req.getParameter("dob")));
			student.setEmail(req.getParameter("email"));

			req.setAttribute("student", student);
			if (message.length() > 0) {
				req.setAttribute("message", message.toString());
				req.getRequestDispatcher("view/student/updateStudent.jsp").forward(req, resp);
				return;
			}

			studentDAO.update(student);
			req.getRequestDispatcher("view/student/personalInformation.jsp").forward(req, resp);
			return;
		}
	}

}
