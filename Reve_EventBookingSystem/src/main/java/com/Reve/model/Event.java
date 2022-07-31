package com.Reve.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "events")
public class Event implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2081709977742562797L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long eventID;
	
	@Column(nullable = false, unique = true, length = 60)
	private String eventName;
	
	@Column(nullable = false, length = 60)
	private String venue;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") // 2002-03-11T18%3A58: yyyy-MM-dd'T'HH:mm
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date endDate;
	
	@Column(nullable = false, length = 10)
	private int attendance;
	
	@Temporal(TemporalType.DATE)
	private Date createDate = new Date();
	
	@Column(nullable = false, length = 10)
	private String status;
	
//	Getters Setters
	public Long getEventID() {
		return eventID;
	}
	public void setEventID(Long eventID) {
		this.eventID = eventID;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Event [eventID=" + eventID + ", eventName=" + eventName + ", venue=" + venue + ", startDate="
				+ startDate + ", endDate=" + endDate + ", attendance=" + attendance + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}
	
	
	
	
	

}
