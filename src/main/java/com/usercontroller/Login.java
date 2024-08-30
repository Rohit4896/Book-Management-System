package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.dao.UserService;

/**
 * Servlet implementation class Login
 */

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String mail = request.getParameter("email");
			request.setAttribute("mail", mail);

			request.getRequestDispatcher("login.jsp").forward(request, response);
		} catch (Exception e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession(true);

			String mail = request.getParameter("mail");

			String password = request.getParameter("password");

			String cap1 = request.getParameter("cap1");

			String cap2 = request.getParameter("cap2");

			boolean login = false;

			UserService dao = new UserService();

			if (cap1.equals(cap2)) {
				login = dao.login(mail, password);

				String cat = dao.getCategory(mail);

				if (login == true) {
					if (cat != null) {
						UserBean bean = dao.getBeanByMail(mail);

						session.setAttribute("bean", bean);
						response.sendRedirect("home.jsp");
					} else {
						UserBean bean = dao.getBeanByMail(mail);

						session.setAttribute("bean", bean);
						response.sendRedirect("Admin/home.jsp");
					}

				} else {
					response.sendRedirect("login?status=3");
				}

			} else {
				response.sendRedirect("login?status=2");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		}
	}

}
