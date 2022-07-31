package com.Reve.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {

	@Query(value = "SELECT * FROM ADMINS where username = :username", nativeQuery = true)
	Admin findByUsername(String username);
	
}
