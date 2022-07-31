package com.Reve.controllers;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Reve.model.Booking;
import com.Reve.model.Event;
import com.Reve.service.BookingService;
import com.Reve.service.EmailSenderService;
import com.Reve.service.EventMasterService;

@Controller
public class BookingController {
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private EventMasterService emService;
	
	@Autowired
	private EmailSenderService mailService;
	
//---------- Displaying Info of selected event on Booking Page ------------
	
	@GetMapping("/bookAnEvent-{eventID}")
	public String bookAnEvent(@PathVariable("eventID") Long eid, ModelMap modelmap) {
		
		Event selectedEvent = bookingService.findSelected(eid);
		// Avoid Booking past date
		Date bookStartDate = bookingService.getBookingStartDate( selectedEvent);
		
		modelmap.put("event", selectedEvent);
		modelmap.put("bookStartDate", bookStartDate);
		modelmap.put( "eventList", emService.displayEvents() );
		
		// Populating Sold Seats
		//modelmap.put("soldSeats", bookingService.getSoldSeats(eid) );
		
		return "bookAnEvent";
	}
	
	
//-------------------- Query for Populating Sold Seats --------------------
	
	@GetMapping("/getSoldSeats")
	@ResponseBody
	public List<String> getSoldSeats(@RequestParam("eid") Long eventID, @RequestParam("dt") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) { //pass eventId & dateSelected
		List<String> soldSeats = bookingService.getSoldSeats(eventID, date);
		
		return soldSeats;
	}
	
//---------------------- Booking the Event --------------------------------
	
	@PostMapping("/bookSeats")
	@ResponseBody
	public String bookSeats( @ModelAttribute("booking") Booking booking, Model model) {
		Booking savedBooking = bookingService.bookSeats(booking);
		
		update(savedBooking.getBookingID());
		mailService.sendBookingConfirmation(savedBooking);
		
		return savedBooking.getBookingID().toString();
	}
	
	static Long bookingID;
	public void update(Long id) {
		bookingID = id;
	}
	
	
//	@GetMapping("/bookSuccess-{bid}")
//	public String bookSuccess( Model model, @PathVariable("bid") Long bid) {
//		Booking booking = bookingService.getSavedBooking(bid);
//		System.out.println(booking);
//		
//	    model.addAttribute("b", booking);
//		
//		return "bookSuccess";
//	}
	
	@GetMapping("/bookSuccess")
	public String bookSuccess( Model model) {
		Booking booking = bookingService.getSavedBooking(bookingID);
		System.out.println(booking);
	    model.addAttribute("b", booking);
		
		return "bookSuccess";
	}

	
	
}
