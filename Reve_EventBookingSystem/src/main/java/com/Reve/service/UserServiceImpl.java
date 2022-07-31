package com.Reve.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Reve.model.User;
import com.Reve.model.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository repo;

	@Override
	public void saveUserDetails(String name, String email, String dob, String pwd) {
		User user = new User();
		
		user.setDob(dob);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(pwd);
		
		// Current Date format
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
	    Date d = new Date();
	    String date = formatter.format(d);
	    
	    user.setDateCreated(date);
	    
		repo.save(user);
		System.out.println("USER REGISTERED");
	}

//	@Override
//	public User getUserDetails(String email, String pwd) {
//		User findUser = repo.findByName(email, pwd);
//		System.out.println("User found \n" + findUser.toString());
//		
//		return findUser;
//	}
	
	@Override
	public String getUserDetails(String email, String pwd) {
		
		User findUser = repo.findByName(email);
		
		if(findUser == null) {
			return "INVALID REQUEST.<br>User NOT found.<br> Register yourself.";
		}
		
		else if( pwd.equals(findUser.getPassword()) == false ) {
			return "Incorrect Login Credentials <br> Incorrect Password!";
		}
		else {
			//matched
			return "USER LOGIN SUCCESSFUL! <br>" + findUser.toString();
		}
		
	}
	


	


}
