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
import com.db.DBConnection;
import com.helper.MailSender;
import com.helper.SendMessage;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String quetion = request.getParameter("quetion");
			String answer = request.getParameter("answer");

			System.out.println("Name is :" + name + "EMail is " + email + "Password is " + password + "phone is "
					+ phone + "Quetion is " + quetion + "Answer is " + answer);

			UserBean bean = new UserBean();

			bean.setName(name);
			bean.setEmail(email);
			bean.setAddress(answer);
			bean.setPassWord(password);
			bean.setPhone(phone);
			bean.setQuetion(quetion);
			bean.setAnswer(answer);

			UserService dao = new UserService();

			boolean check1 = dao.checkUserNameExist(email);

			boolean check2 = dao.checkUserPasswordExist(password);

			boolean check3 = dao.checkUserNoExist(phone);

			if (check1 == false && check2 == false && check3 == false) {
				boolean result = dao.createUSer(bean);
				int mail = MailSender.sendMail(bean);
				
				/*
				 * String msg="hi"; int sms = SendMessage.sendMessage(msg,bean.getPhone());
				 */
				
				if (result == true) {
					request.setAttribute("email", email);
					response.sendRedirect("login?email=" + email + "");

				} else {

					response.sendRedirect("register?status=2");
				}
			} else if (check1 == true ) {
				response.sendRedirect("register?status=3");
			} else if ( check2 == true ) {
				response.sendRedirect("register?status=4");
			} else if ( check3 == true) {
				response.sendRedirect("register?status=5");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		}

	}

}
