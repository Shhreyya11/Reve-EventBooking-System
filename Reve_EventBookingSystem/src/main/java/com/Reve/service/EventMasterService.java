package com.Reve.service;

import java.util.List;

import com.Reve.model.Admin;
import com.Reve.model.Event;

public interface EventMasterService {

	void saveEvent(Event event);

	List<Event> displayEvents();

	void updateEvent(Event event, Long id);

	List<Event> displayPastEvents();

	void deleteEvent(Long eventId);

	void setDefaultAdmin();

	void addAdmin(Admin admin);

	String checkCredentials(Admin admin);

	Admin findAdmin(Admin admin);

}
