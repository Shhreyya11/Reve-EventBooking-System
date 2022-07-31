package com.Reve.service;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.Reve.model.Booking;

@Service
public class EmailSenderServiceImpl implements EmailSenderService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	// Current Date format
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
	SimpleDateFormat frmtr = new SimpleDateFormat("E, d MMMM yyyy"); 

	@Override
	public void sendBookingConfirmation(Booking booking) {
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setFrom("shhreyya1132@gmail.com");
		mail.setTo( booking.getBookerEmail() );
		mail.setSubject("Booking Confirmation: " + booking.getEvent().getEventName() );
		mail.setText(
				"Your booking for " + booking.getEvent().getEventName() + " for the date " + formatter.format( booking.getEventDateBooked() )
				+ " has been successfully made.\nEvent Date: " + frmtr.format( booking.getEventDateBooked() ) + "\nSeats Booked: " + booking.getSeatNumbers()
				);
		
		mailSender.send(mail);
		System.out.println("Booking Confirmation Mail sent successfully for BookingID: " + booking.getBookingID() );
		
	}
	
	

}
