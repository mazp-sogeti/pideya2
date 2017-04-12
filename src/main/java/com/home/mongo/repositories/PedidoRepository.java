package com.home.mongo.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.home.models.Users;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.home.models.Pedido;



@Repository
public interface PedidoRepository extends MongoRepository<Pedido, String>{

}
