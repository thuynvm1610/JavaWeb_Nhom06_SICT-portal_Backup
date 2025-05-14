package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String action = req.getParameter("action");

		if (action.equals("loginForm")) {
			req.getRequestDispatcher("view/login/loginForm.jsp").forward(req, resp);
			return;
		} else if (action.equals("loginRequest")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			LoginDAO loginDAO = new LoginDAO();

			StringBuilder message = new StringBuilder();

			if (!loginDAO.isUsernameExists(username)) {
				message.append("Tên tài khoản không tồn tại<br>");
			} else if (!loginDAO.isPasswordValid(username, password)) {
				message.append("Mật khẩu sai<br>");
			}

			if (message.length() > 0) {
				req.getSession().setAttribute("username", username);
				req.getSession().setAttribute("password", password);
				req.setAttribute("message", message.toString());
				req.getRequestDispatcher("view/login/loginForm.jsp").forward(req, resp);
				return;
			}
			
			String role = loginDAO.getRole(username);
			if (role.equals("admin")) {		
				resp.sendRedirect("admin?action=dashboard");
			} else if (role.equals("student")) {
				resp.sendRedirect("admin?action=studentList");
			}
			return;
		}
	}
	
}
