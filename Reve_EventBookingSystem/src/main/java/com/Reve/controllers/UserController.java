package com.Reve.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Reve.model.User;
import com.Reve.service.UserService;

@Controller
public class UserController {
	
//	----------------------- REGISTRARTION ------------------------------
	
	
	@Autowired
	private UserService userService;

	@GetMapping("/Registration")
	public String RegisterForm(Model model) {
		model.addAttribute("user", new User());
		return "Registration";
	}
	
//	Code Handler for Submission of form
	@PostMapping("/registerUser")
	public String registerUser(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("dob") String dob, @RequestParam("pwd") String pwd){
	    
		userService.saveUserDetails(name, email, dob, pwd);
		
		return "redirect:/";
	}
	
	
//	----------------------- LOGIN ------------------------------
	
	@PostMapping("/login")
	public ModelAndView login( @RequestParam("email") String email, @RequestParam("pwd") String pwd){
	    
		ModelAndView mv = new ModelAndView();
		
		String message = userService.getUserDetails(email, pwd);
		
		mv.addObject("message", message);
		mv.setViewName("loginResult");
		
		return mv;
	}
	
	
}
