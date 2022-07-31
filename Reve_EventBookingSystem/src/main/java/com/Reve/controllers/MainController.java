package com.Reve.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Reve.model.Event;
import com.Reve.service.EventMasterService;

@Controller
public class MainController {
	
	@Autowired
	private EventMasterService emService;
	
//------------Page Navigation---------------
	
	@GetMapping("/")
	public String viewHome() {
		emService.setDefaultAdmin();
		
		return "index";
	}
	
	@GetMapping("/Events")
	public String viewEvents(Model model){
		List<Event> events = emService.displayEvents();
		model.addAttribute("events", events);
		return "Events";
	}
	
	

	
	
	
	
	
}
