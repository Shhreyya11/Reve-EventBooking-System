package com.Reve.service;

import java.util.Date;
import java.util.List;

import com.Reve.model.Booking;
import com.Reve.model.Event;

public interface BookingService {

	Event findSelected(Long id);

	Date getBookingStartDate(Event selectedEvent);

	List<String> getSoldSeats(Long eid, Date date);

	Booking bookSeats(Booking booking);

	Booking getSavedBooking(Long bookID);

}
