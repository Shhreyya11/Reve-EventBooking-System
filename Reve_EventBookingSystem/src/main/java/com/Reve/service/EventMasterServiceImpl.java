package com.Reve.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Reve.model.Admin;
import com.Reve.model.AdminRepository;
import com.Reve.model.Event;
import com.Reve.model.EventRepository;

@Service
public class EventMasterServiceImpl implements EventMasterService {
	
	@Autowired
	private EventRepository eventRepo;
	
	@Autowired
	private AdminRepository adminRepo;
	
//-------------- Find Admin By username -------------------
	
	@Override
	public Admin findAdmin(Admin admin) {
		admin = adminRepo.findByUsername( admin.getUsername() );
		return admin;
	}
	
//------------- Setting Default Admin on OPening of Index --------------
	
	@SuppressWarnings("deprecation")
	@Override
	public void setDefaultAdmin() {
		Admin admin = new Admin();
		
		admin.setAdminName("Default Admin");
		admin.setAdminEmail("admindefault@gmail.com");
		admin.setDob( new Date(22, 8, 11) );
		
		admin.setUsername("admin");
		admin.setPassword("123");
		try {
			adminRepo.save(admin);
		} catch (Exception e) {
			System.out.println(" - default admin already exists - ");
			// Already Saved
		}
		
		System.out.println("Default Admin Credetials - \nUSERNAME: " 
		+ admin.getUsername() + "\nPASSWORD: " + admin.getPassword());
		
	}

	
//---------- Events display: Dynamic HTML Table ---------

    @Override
	public List<Event> displayEvents() {
    	classifyEvents();
    	//returns all events as List<Event> : default JPA method
		return eventRepo.findPresentEvents();
	}
    
    

	@Override
    public List<Event> displayPastEvents() {
		classifyEvents();
    	// returns list of Past Events
    	return eventRepo.findPastEvents();
    }
	
	private void classifyEvents() {
		List<Event> list = eventRepo.findPresentEvents();
		
		for(Event event : list ) {

			if( event.getEndDate().before(new Date()) ) {
				event.setStatus("past");
			}
			
			eventRepo.save(event);
		}
		
		
	}
    

//----------------- Add an Event -------------------
    
	@Override
	public void saveEvent(Event event) {
		
		if( event.getEndDate().before(new Date()) ) {
			event.setStatus("past");
		}else {
			event.setStatus("present");
		}
		
		eventRepo.save(event);
		
	}


//----------------- Edit an Event -------------------
	
	@Override
	public void updateEvent(Event event, Long id) {
		Event existingEvent = eventRepo.findById(id).get();
		
		System.out.println("BEFORE: " + existingEvent.toString());
		
		//existingEvent.setEventName( event.getEventName() );
		existingEvent.setVenue( event.getVenue() );
		existingEvent.setStartDate( event.getStartDate() );
		existingEvent.setEndDate( event.getEndDate() );
		
		if( existingEvent.getEndDate().before(new Date()) ) {
			existingEvent.setStatus("past");
		}else {
			existingEvent.setStatus("present");
		}
		
		eventRepo.save(existingEvent);
//		eventRepo.saveAndFlush(existingEvent);
		
		System.out.println("AFTER: " + existingEvent.toString());
	}
	

//----------------- Delete an Event -------------------	

	@Override
	public void deleteEvent(Long eventId) {
		eventRepo.deleteById(eventId);
	}


//----------------- Add Admin -------------------	
	
	@Override
	public void addAdmin(Admin admin) {
		adminRepo.save(admin);	
	}


//----------------- Admin Login -------------------

	@Override
	public String checkCredentials(Admin admin) {
		
		Admin findAdmin = adminRepo.findByUsername( admin.getUsername() );
		
		if( findAdmin == null ) {
			// Registration Required
			return "Invalid Access! <br>NO SUCH ADMIN IS REGISTERED";
		}else if( findAdmin.getPassword().equals(admin.getPassword()) == false ) {
			return "Incorrect Login Credentials!<br>The entered Password is incorrect.";
		}else {
			return "";
		}
		
	}


	


	


	



	
}
