<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.home.models.*" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body style="background: #666363;">
<% Pedido p = new Pedido();
	p =(Pedido) request.getAttribute("pedido");
    String restaurante = p.getRestaurante();
    String mesa = p.getMesa();
    String pedido = p.getPedido();
    
    String[] parts = pedido.split(";");
	//request.setAttribute("pedido", p);
    %>
<div style="background: #666363;" data-role="page" id="pageone" data-theme="b">
  <div  data-role="header">
    <h1><%= mesa %></h1>
  </div>
<form method="get" action="test2/<%=p.getId()%>">

  <div data-role="main" class="ui-content">
<!--     <p>Some Text..</p> -->
    <center><a href="#">Restaurante : <%=restaurante %></a></center>
<!--     <a href="#" class="ui-btn">Link Button</a> -->
    <p>Su pedido:</p>
    <ul data-role="listview" data-inset="true">
    <%for(String ped : parts){ %>
      <li><a href="#"><%=ped %></a></li>
	<%} %>
    </ul>
    
<!--     <label for="fullname">Input Field:</label> -->
<!--       <input type="text" name="fullname" id="fullname" placeholder="Name..">     -->
    <label for="switch">Desea copia ticket ?</label>
      <select name="switch" id="switch" data-role="slider">
        <option value="si">SI</option>
        <option value="no" selected>NO</option>
      </select>
  </div>
<button type="submit" class="btn btn-danger">Confirmar pedido</button>
</form>
  <div data-role="footer">
    <h1>Page Footer</h1>
  </div>
</div> 

</body>
</html>
