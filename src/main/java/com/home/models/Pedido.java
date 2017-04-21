package com.home.models;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="pedidos")
public class Pedido {
    @Id
	String id;
	String restaurante;
	String mesa;
	public List<String> getPedido() {
		return pedido;
	}
	public void setPedido(List<String> pedido) {
		this.pedido = pedido;
	}
	List<String> pedido;


	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRestaurante() {
		return restaurante;
	}
	public void setRestaurante(String restaurante) {
		this.restaurante = restaurante;
	}
	public String getMesa() {
		return mesa;
	}
	public void setMesa(String mesa) {
		this.mesa = mesa;
	}


}
