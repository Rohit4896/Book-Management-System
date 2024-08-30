package com.dao;

import java.security.NoSuchAlgorithmException;

import com.bean.AddBook;
import com.bean.UserBean;

public interface UserRepo {

	public boolean createUSer(UserBean bean);
	
	public boolean login(String mail,String password) throws NoSuchAlgorithmException, Exception;
	
	public boolean checkUserNameExist(String mail);
	
	public boolean checkUserPasswordExist(String password);
	
	public boolean checkUserNoExist(String no);
	
	public String getCategory(String mail);
	
	public int addBook(AddBook book);
}
