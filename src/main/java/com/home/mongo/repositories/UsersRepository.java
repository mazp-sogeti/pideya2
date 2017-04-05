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
	
}