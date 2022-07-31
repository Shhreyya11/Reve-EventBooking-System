package com.Reve.service;

import com.Reve.model.Booking;

public interface EmailSenderService {

	void sendBookingConfirmation(Booking booking);

}
