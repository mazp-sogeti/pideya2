<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,com.home.models.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>


	<script>
	
	$(document).ready(function() {
		var BASE_URI = "http://84.78.131.211:8080/pideya";
		$.ajax({
			url : "http://84.78.131.211:8080/pideya/test/masmas",
			type : 'GET',
			crossDomain : true,
			contentType : 'application/json',
			//dataType : 'json',
			//data : JSON.stringify(fight),
			success : function(response) {
				if (parseInt(response.length) == 0) {
					alert("nada");
				} else {
					$.each(response, function(k, v) {
						
					});
					
					alert("te veoooooooo");
					window.location.href = BASE_URI+"/home";
				}
			},
			error : function(response) {
				alert("Fail cargando la lista de topUsers  " + response);
			}
		});

// 		var BASE_URI = "http://localhost:8080/pideya";
// 		$(document).ready(function() {
// 			$.ajax({
// 				url : "http://localhost:8080/pideya/test/masmas"
// 			}).then(function(data, status, jqxhr) {
// 				alert(data);
// 				alert(data.content);
// 				console.log(jqxhr);
// 				window.location.href = BASE_URI + "/" + data + "/";
// 			});
		});
	</script>

</body>
</html>