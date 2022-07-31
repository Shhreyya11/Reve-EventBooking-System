package com.Reve.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Reve.model.Booking;
import com.Reve.model.BookingRepository;
import com.Reve.model.Event;
import com.Reve.model.EventRepository;

@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private EventRepository eventRepo;
	
	@Autowired
	private BookingRepository bookingRepo;

	@Override
	public Event findSelected(Long eventID) {
		Event selectedEvent = eventRepo.findById(eventID).get();
		
		return selectedEvent;
	}

	@Override
	public Date getBookingStartDate(Event selectedEvent) {
		Date bookStartDate = selectedEvent.getStartDate();
		//  Starting booking from current Date if Original start date has passed
		if( bookStartDate.before(new Date()) ) {
			bookStartDate = new Date();
		}
		
		return bookStartDate;
	}

//	@Override
//	public String getSoldSeats(Long eid) {
//		List<String> seatslList = bookingRepo.findSoldSeats(eid);
//		String concatenated = String.join("", seatslList);
//		
//		System.out.println(eid);
//		System.out.println("SEATS SOLD: "+ concatenated);
//		
//		return concatenated;
//	}

	@Override
	public List<String> getSoldSeats(Long eid, Date date) {
		List<String> seatslList = bookingRepo.findSoldSeats( eid, date);
		return seatslList;
	}
	
	
//--------------------- Booking Seats ------------------------------
	
	@Override
	public Booking bookSeats(Booking booking) {
		Event event = eventRepo.findById( booking.getEvent().getEventID() ).get();
		
		// Updating Attendance for the Event
		int atdc = event.getAttendance() + booking.getSeatsReg() + booking.getSeatsVIP();
		event.setAttendance(atdc);
		
		return bookingRepo.save(booking);
	}

	@Override
	public Booking getSavedBooking(Long bookID) {
		//System.out.println(bookID);
		Booking booking = bookingRepo.findById(bookID).get();
		//System.out.println(booking.toString());
		return booking;
	}
	

}
