<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
<h1>
	Hello world!  
</h1>
<script>

var BASE_URI = "http://localhost:8080/pideya/test";
$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8080/pideya/greeting"
    }).then(function(data, status, jqxhr) {
       alert(data);
       alert(data.content);
       console.log(jqxhr);
    });
});
 
</script>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
