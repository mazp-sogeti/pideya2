package com.home.models;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="users")
public class Users {

    @Id
    private String id;
    
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String username;
    public String password;
    public String firstName;    
    public String lastName;
    public String email;
    public String address;
    public String getAddress() {
		return address;
	}

	public void setAddress(String adreess) {
		this.address = adreess;
	}

	public int role;
    
   public Users() {
    }
    
   public int getRole() {
    return role;
    }
    
   public void setRole(int role) {
    this.role = role;
    }

   public Users(String username, String password, String firstName, String lastName, String email, String adreess,
		int role) {
	super();
	this.username = username;
	this.password = password;
	this.firstName = firstName;
	this.lastName = lastName;
	this.email = email;
	this.address = adreess;
	this.role = role;
}

public String getUsername() {
    return username;
    }
    
   public void setUsername(String username) {
    this.username = username;
    }
    
   public String getPassword() {
    return password;
    }
    
   public void setPassword(String password) {
    this.password = password;
    }
    
   public String getFirstName() {
    return firstName;
    }
    
   public void setFirstName(String firstName) {
    this.firstName = firstName;
    }
    
   public String getLastName() {
    return lastName;
    }
    
   public void setLastName(String lastName) {
    this.lastName = lastName;
    }
    
   public String getEmail() {
    return email;
    }
    
   public void setEmail(String email) {
    this.email = email;
    }

@Override
public String toString() {
	return "Users [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
			+ ", lastName=" + lastName + ", email=" + email + ", address=" + address + ", role=" + role + "]";
}
    

   }
