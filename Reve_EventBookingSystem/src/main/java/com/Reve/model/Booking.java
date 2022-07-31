package com.Reve.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bookings")
public class Booking{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookingID;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eventDateBooked;
	
	@Column(nullable = false, length = 40)
	private String bookerName;
	
	@Column(nullable = false, length = 15)
	private String contactNumber;
	
	@Column(nullable = false, length = 50)
	private String bookerEmail;
	
	@Column(nullable = false, length = 35)
	private String paymentMethod;
	
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumns({
		@JoinColumn(name = "eventid", referencedColumnName = "eventID"),
		@JoinColumn(name = "event_name", referencedColumnName = "eventName")
	})
	private Event event;
	
	@Column(nullable = false, length = 45)
	private String seatNumbers;
	
	@Column(nullable = false, length = 5)
	private int seatsReg;
	
	@Column(nullable = false, length = 5)
	private int seatsVIP;
	
	@Column(nullable = false, length = 5)
	private float price;
	
	@Temporal(TemporalType.DATE)
	private Date bookingDate = new Date();
	
	// Setters & Getters
	
	public Long getBookingID() {
		return bookingID;
	}

	public void setBookingID(Long bookingID) {
		this.bookingID = bookingID;
	}

	public Date getEventDateBooked() {
		return eventDateBooked;
	}

	public void setEventDateBooked(Date eventDateBooked) {
		this.eventDateBooked = eventDateBooked;
	}

	public String getBookerName() {
		return bookerName;
	}

	public void setBookerName(String bookerName) {
		this.bookerName = bookerName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getBookerEmail() {
		return bookerEmail;
	}

	public void setBookerEmail(String bookerEmail) {
		this.bookerEmail = bookerEmail;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public String getSeatNumbers() {
		return seatNumbers;
	}

	public void setSeatNumbers(String seatNumbers) {
		this.seatNumbers = seatNumbers;
	}

	public int getSeatsReg() {
		return seatsReg;
	}

	public void setSeatsReg(int seatsReg) {
		this.seatsReg = seatsReg;
	}

	public int getSeatsVIP() {
		return seatsVIP;
	}

	public void setSeatsVIP(int seatsVIP) {
		this.seatsVIP = seatsVIP;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	@Override
	public String toString() {
		return "Booking [bookingID=" + bookingID + ", eventDateBooked=" + eventDateBooked + ", bookerName=" + bookerName
				+ ", contactNumber=" + contactNumber + ", bookerEmail=" + bookerEmail + ", paymentMethod="
				+ paymentMethod + ", event=" + event + ", seatNumbers=" + seatNumbers + ", seatsReg=" + seatsReg
				+ ", seatsVIP=" + seatsVIP + ", price=" + price + ", bookingDate=" + bookingDate + "]";
	}
	
	
	
}
