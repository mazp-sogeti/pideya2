<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.home.models.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  Pedido p = (Pedido)request.getAttribute("pedido");
	String count = ((String)request.getAttribute("count"));
%>

<h1><%=count %></h1>
<br>
<h1><%=p.getMesa() %></h1>
<%for(String s : p.getPedido()){ %>
<h3><%=s %></h3>
<%} %>
</body>
</html>