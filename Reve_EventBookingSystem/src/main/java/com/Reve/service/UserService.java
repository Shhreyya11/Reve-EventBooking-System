package com.Reve.service;

// import com.Reve.model.User;

public interface UserService {

	void saveUserDetails(String name, String email, String dob, String pwd);

//	User getUserDetails(String email, String pwd);
	
	String getUserDetails(String email, String pwd);
	
}
