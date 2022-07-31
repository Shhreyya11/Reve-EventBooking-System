package com.Reve.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {

	@Query(value = "SELECT * FROM events where status='present'", nativeQuery = true)
	List<Event> findPresentEvents();

	@Query(value = "SELECT * FROM events where status='past'", nativeQuery = true)
	List<Event> findPastEvents();
	
}
