package com.Reve.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long> {
	
	@Query(value = "select * from users where email= :email", nativeQuery = true)
	User findByName(String email);

//	@Query("Select * from users where email= :email and password= :pwd")
//	User findByName(String email, String pwd);

	

}
