<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Login</title>
</head>
<body>

	<!-- ADDING SECURITY EXCEPTION HANDLING Add the following just above the form on login.jsp -->
	<c:if test="${not empty param.login_error}">
		<font color="#ff0000"> Login unsuccessful.<br /> <c:out
				value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
		</font>
	</c:if>


	<sec:authorize access="isAuthenticated()">
 Username: <sec:authentication property="principal.username" />
 Role: <sec:authentication property="principal.authorities" />
	</sec:authorize>

	<form action="j_spring_security_check" method="POST">
		<label for="username">User Name:</label> <input id="username"
			name="j_username" type="text" /> <label for="password">Password:</label>
		<input id="password" name="j_password" type="password" /> <input
			type="submit" value="Log In" />
	</form>

	<a href="<c:url value="/j_spring_security_logout"/>">Logout</a>
</body>
</html>