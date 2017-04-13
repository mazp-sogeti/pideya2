<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.home.models.*, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Tabla de pedidos</h2>                                                                                    
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Restaurante</th>
        <th>Mesa</th>
        <th>Pedido</th>
      </tr>
    </thead>
    <tbody>
     <%for(Pedido p : (List<Pedido>)request.getAttribute("pList")){ %>
      <tr>
     
        
        <td><%=p.getId() %></td>
        <td><%=p.getRestaurante() %></td>
        <td><%=p.getMesa() %></td>
        <td><%=p.getPedido() %></td>

      </tr>
      <%} %>
    </tbody>
  </table>
  </div>
</div>

</body>
</html>