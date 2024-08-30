package com.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.UserService;

/**
 * Servlet implementation class AddBook
 */
@WebServlet("/AdminAddBook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBook() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			System.out.println("Add book controlller");
			
			String bookName = request.getParameter("BookName");
			String authorName = request.getParameter("AuthorName");
			double price = Double.parseDouble(request.getParameter("Price"));
			String bookCategory = request.getParameter("Category");
			String bookStatus = request.getParameter("Status");

			Part part = request.getPart("Image");
			String filename = part.getSubmittedFileName();
			
			com.bean.AddBook book = new com.bean.AddBook();
			book.setAuthor(authorName);
			book.setBookname(bookName);
			book.setPrice(price);
			book.setBookCategory(bookCategory);
			book.setStatus(bookStatus);
			
			UserService dao = new UserService();
			
			int result = dao.addBook(book);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
