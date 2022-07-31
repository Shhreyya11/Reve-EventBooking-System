package com.Reve.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false, length = 45)
	private String name;
	
	@Column(nullable = false, length = 30)
	private String dob; //date of birth
	
	@Column(nullable = false, unique = true, length = 50)
	private String email; //user-name
	
	@Column(nullable = false, length = 64)
	private String password;
	
	@Column(nullable = false, length = 30)
	private String dateCreated;
	
	
	//	GETTERS & SETTERS
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public String toString() {
		return "User ID: " + id + "<br>Name: " + name + "<br>Date of Birth: " + dob + "<br>email: " + email + "<br>password: " + password
				+ "<br>dateCreated: " + dateCreated;
	}  
	
	
	
}
