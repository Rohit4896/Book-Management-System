package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.crypto.SecretKey;
import javax.naming.NamingException;

import com.bean.AddBook;
import com.bean.UserBean;
import com.db.DBConnection;
import com.helper.AESEncryption;
import com.helper.AESKeyGenerator;
import com.helper.MD5Hashing;
import com.mysql.cj.exceptions.ConnectionIsClosedException;
import com.mysql.cj.protocol.Resultset;

public class UserService implements UserRepo {

	private Connection con;

	@Override
	public boolean createUSer(UserBean bean) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pst = null;

		try {
			// Initialize connection (ensure con is not null)
			con = DBConnection.createConnection(); // Example method to get a connection
			System.out.println("con is :" + con);

			String encryptedPassword = MD5Hashing.hashPassword(bean.getPassWord());

			// SQL insert statement
			String sql = "insert into `users` (name,email,phone,password,quetion,answer) values (?,?,?,?,?,?)";
			pst = con.prepareStatement(sql);

			// Set parameters
			pst.setString(1, bean.getName());
			pst.setString(2, bean.getEmail());
			pst.setString(3, bean.getPhone());
			pst.setString(4, encryptedPassword); // Use encrypted password
			pst.setString(5, bean.getQuetion());
			pst.setString(6, bean.getAnswer());

			System.out.println("Query is :" + pst);

			// Execute update
			int res = pst.executeUpdate();
			System.out.println("Value of result is :" + res);

			// Check if one row was inserted
			if (res == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace(); // Print exception stack trace
		} finally {
			// Close resources
			try {
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public boolean login(String mail, String pass) throws Exception {
		boolean result = false;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBConnection.createConnection(); // Example method to get a connection
			System.out.println("con is :" + con);

			String encryptedPassword = MD5Hashing.hashPassword(pass);

			// SQL insert statement
			String sql = "select * from users where email=? and password=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, mail);
			pst.setString(2, encryptedPassword);

			System.out.println("Query for Login is :" + pst);
			rs = pst.executeQuery();

			if (rs.next()) {
				result = true;
			}

			rs.close();
			pst.close();
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return result;
	}

	public boolean checkUserNameExist(String mail) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean result = false;

		try {

			con = DBConnection.createConnection();

			String sql = "select * from users where email=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, mail);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = true;
			}

			rs.close();
			pst.close();
			con.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (Exception e) {

			}
		}
		return result;

	}

	public boolean checkUserPasswordExist(String pass) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean result = false;

		try {

			con = DBConnection.createConnection();

			String password = MD5Hashing.hashPassword(pass);

			String sql = "select * from users where password=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, password);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = true;
			}

			rs.close();
			pst.close();
			con.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (Exception e) {

			}
		}
		return result;

	}

	public boolean checkUserNoExist(String no) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean result = false;

		try {

			con = DBConnection.createConnection();

			String sql = "select * from users where phone=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, no);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = true;
			}

			rs.close();
			pst.close();
			con.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (Exception e) {

			}
		}
		return result;

	}

	public String getCategory(String mail) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String cat = null;

		try {

			con = DBConnection.createConnection();

			String sql = "select category from users where email=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, mail);

			rs = pst.executeQuery();

			if (rs.next()) {
				cat = rs.getString("cat");
			}

			rs.close();
			pst.close();
			con.close();
			return cat;
		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return cat;
	}

	public UserBean getBeanByMail(String mail) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		UserBean bean = new UserBean();

		try {
			con = DBConnection.createConnection();

			String sql = "select * from users where email=?";

			pst = con.prepareStatement(sql);

			pst.setString(1, mail);

			rs = pst.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String no = rs.getString("phone");
				String category = rs.getString("category");
				String email = rs.getString("email");
				int id = Integer.parseInt(rs.getString("id"));

				bean.setId(id);
				bean.setName(name);
				bean.setCategory(category);
				bean.setEmail(email);
				bean.setPhone(email);
			}
			rs.close();
			pst.close();
			con.close();
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public int addBook(AddBook book) {
		Connection con = null;
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			con = DBConnection.createConnection();
			
			String sql = "insert into book_details (bookname, author, price, bookCategory, status, photo, useremail) values(?,?,?,?,?,?,?)";
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return 0;
	}
}
