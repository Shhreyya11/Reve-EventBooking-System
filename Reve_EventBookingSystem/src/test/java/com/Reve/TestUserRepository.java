package com.Reve;

import static org.assertj.core.api.Assertions.assertThat;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.Reve.model.User;
import com.Reve.model.UserRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class TestUserRepository {
	
	@Autowired
	private UserRepository repo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	// Current Date format
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
    Date d = new Date();
    String date = formatter.format(d);
	
	@Test
	public void testCreateUser(){
		User user = new User();
		user.setDob("01-01-2002");
		user.setEmail("test@gmail.com");
		user.setName("Test Name");
		user.setPassword("pwd");
		user.setDateCreated(date);
		
		User savedUser = repo.save(user);
		
		User existUser = entityManager.find( User.class, savedUser.getId());
		assertThat(existUser.getEmail()).isEqualTo(user.getEmail());
		
	}

}
