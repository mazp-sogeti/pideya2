<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.home.models.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <!-- Bootstrap    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<%
List<Users> users = (List<Users>) request.getAttribute( "users" );
%>
<%
for (Users user : users) {
pageContext.setAttribute("firstname", user.getFirstName() );
%>
<div>${firstname}</div>
<%
}
%>
</body>
</html>