<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.home.models.Pedido"%>

<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	
<table class="table table-striped">
    <thead>
      <tr>
        <th>Restaurante</th>
        <th>Mesa</th>
        <th>Pedido</th>
      </tr>
    </thead>
    <tbody>
	<%
		List<Pedido> pList = new ArrayList<Pedido>();
		if (request.getAttribute("users") != null) {
			pList = (List<Pedido>) request.getAttribute("users");
		}
	for(Pedido p : pList){
	%>
      <tr>
        <td><%=p.getRestaurante() %></td>
        <td><%=p.getMesa() %></td>
        <td><%=p.getPedido() %></td>
      </tr>
	<%
	}
	%>
	</tbody>
  </table>
  <br><br>
	<P>The time on the server is ${serverTime}.</P>
</body>
</html>
