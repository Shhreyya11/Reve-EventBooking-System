package com.Reve;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.Reve.model.Event;
import com.Reve.model.EventRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class TestEventRepository {
	
	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private TestEntityManager entityManager;
    
    @SuppressWarnings("deprecation")
	Date st = new Date(22, 8, 3);
    @SuppressWarnings("deprecation")
	Date end = new Date(22, 8, 11);
	
	@Test
	public void testCreateEvent() {
		Event event = new Event();
		
		event.setEventName("Test Event");
		event.setVenue("Test Venue");
		event.setStartDate(st);
		event.setEndDate(end);
		event.setAttendance(123);
		event.setCreateDate(new Date());
		
		if( event.getEndDate().before(new Date()) ) {
			event.setStatus("past");
		}else {
			event.setStatus("present");
		}
		
		Event savedEvent = eventRepository.save(event);
		
		Event existEvent = entityManager.find( Event.class, savedEvent.getEventID());
		assertThat(existEvent.getEventName()).isEqualTo(existEvent.getEventName());
		
	}
	

}
