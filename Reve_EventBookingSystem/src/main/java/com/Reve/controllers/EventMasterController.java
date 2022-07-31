package com.Reve.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Reve.model.Admin;
import com.Reve.model.Event;
import com.Reve.service.EventMasterService;

@Controller
public class EventMasterController {
	
	@Autowired
	private EventMasterService emService;
	
	static Admin loggedAdmin = null;
	public static void insertAdmin( Admin a ){
		loggedAdmin = a;
	}
	
	
//----------------- Page Navigation -------------------
		
		
		@GetMapping("EventMaster/addEvent")
		public String addEventDisplay() {
			return "addEvent";
		}
		
		@GetMapping("EventMaster/addAdmin")
		public String addAdminDisplay() {
			return "addAdmin";
		}
		
//---------- Events display: Dynamic HTML Table ---------
		
		@GetMapping("EventMaster/EMhome")
		public String emHomeDisplay(Model model) {
			model.addAttribute("events", emService.displayEvents() );
			return "EMhome";
		}
		
		@GetMapping("EventMaster/ListOfEvents")
		public String listofEventsDisplay(Model model){
			model.addAttribute("events", emService.displayEvents() );
			return "ListOfEvents";
		}
		
		@GetMapping("EventMaster/pastEvents")
		public String pastEventsDisplay(Model model){
			model.addAttribute("events", emService.displayPastEvents());
			return "pastEvents";
		}
		
	// Edit an Event (Past & Present) 
		
		@PostMapping(value = "/editEvent")
		public String update(@ModelAttribute Event event, @RequestParam("eventID") Long id){
			emService.updateEvent( event, id);
			return "redirect:/EventMaster/EMhome";
		}

	// Delete an Event (Past & Present) 
				
		@PostMapping(value = "/EventMaster/deleteEvent")
		public String deleteEvent(@RequestParam("hiddenIDdel") Long eventId) {
			emService.deleteEvent(eventId);
			//System.out.println(eventId);	
			return "redirect:/EventMaster/EMhome";
		}
		
//----------------- Admin Login ------------------
		
		@GetMapping("EventMaster/EMlogin")
		public String emLogin() {
			return "EMlogin";
		}
		
		@PostMapping("/EventMaster/adminLogin")
		public String adminLogin( @ModelAttribute("admin") Admin admin, Model model) {
			
			String result = emService.checkCredentials(admin);
			
			if(result.equals("")) {
				admin = emService.findAdmin(admin);
				insertAdmin(admin);
				return "redirect:/EventMaster/EMhome";
			} else {
				model.addAttribute("message", result);
				return "/loginResult";
			}
		}
	
//----------------- Add an Event -------------------
	
		@PostMapping("EventMaster/createEvent")
		public String createNewEvent( @ModelAttribute("event") Event event ) {
			emService.saveEvent(event);
			return "redirect:/EventMaster/EMhome";
		}
	

		
//----------------- Add an Admin -------------------
	
		@PostMapping("/EventMaster/registerAdmin")
		public String registerAdmin( @ModelAttribute("admin") Admin admin) {
			emService.addAdmin( admin);
			return "redirect:/EventMaster/EMhome";
		}
		
//----------------- Admin Profile ---------------
		
		@GetMapping("/EventMaster/EMprofile")
		public String adminProfile(Model model) {
			model.addAttribute("message", loggedAdmin.toString() );
			return "/loginResult";
		}
	
}
