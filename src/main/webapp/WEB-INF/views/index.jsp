<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="java.util.List,com.home.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body  onload="myFunction()">
	<% Pedido p = new Pedido();
	p=(Pedido)request.getAttribute("pedidoF"); %>
<script type="text/javascript">

//Así como en CSS3, tenemos variantes para distintos navegadores. Tan solo obtenemos la función automáticamente
//cuando el navegador encuentre la que exista en su motor de javascript.
navigator.vibrate = navigator.vibrate || navigator.webkitVibrate || navigator.mozVibrate || navigator.msVibrate;

//Ahora preguntamos si realmente existe.
if (navigator.vibrate) {
  alert('¡Puedes hacerlo vibrar!');
  window.navigator.vibrate(1000);
} else {
	alert('No puedes hacerlo vibrar :');
}

function myFunction() {
	
	
	window.location.replace("/pideya/test/pedido");
}setInterval(myFunction, 2000);
</script>
<h1>Pedido <%= p !=null ? p.getId() : "nada" %> enviado correctamente </h1>
</body> 
</html>