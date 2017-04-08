package com.home.mongo.repositories;

import java.awt.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.home.models.Users;



@Repository
public interface UsersRepository extends MongoRepository<Users, String>{
	
	@Query("{ 'username' : ?0 }")
	Users findUsersByName(String name);
	
	@Query("update users u set u.username = ?1 and u.address = ?2 and u.email = ?3 where u._id = ?4")
	int setFixedFirstnameFor(String username, String address, String email, String id );
	
}