package com.Reve.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

	@Query(value = "SELECT seat_numbers FROM bookings WHERE eventid = :eid and event_date_booked= :date", nativeQuery = true)
	List<String> findSoldSeats(Long eid, Date date);

}
