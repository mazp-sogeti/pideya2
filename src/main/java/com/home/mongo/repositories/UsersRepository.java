package com.home.mongo.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.home.models.Users;



@Repository
public interface UsersRepository extends MongoRepository<Users, String>{
}