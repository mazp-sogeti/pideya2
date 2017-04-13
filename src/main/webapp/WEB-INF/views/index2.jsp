<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
	Multiverse by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<style type="text/css">
@media only screen and (max-width: 767px) {
	h1 {
		font-size: 3em;
	}
	h2 {
		font-size: 2em;
	}
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>PideYa - Test</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/main.css" />" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html"><strong>testAPP</strong> by pingMan</a>
			</h1>
			<nav>
				<ul>
					<li><a href="#footer" class="icon fa-info-circle">pideYA</a></li>
				</ul>
			</nav>
		</header>
		<center>
			<h1 id="pinga"></h1>
			<center>
				<script>
					
					$(document).ready(function() {
// 		$.ajax({
<%-- 			url : "<%=request.getAttribute("url")%>", --%>
// 			type : 'GET',
// 			crossDomain : true,
// 			contentType : 'application/json',
// 			//dataType : 'json',
// 			//data : JSON.stringify(fight),
// 			success : function(response) {
// 				if (parseInt(response.length) == 0) {
// 					alert("nada");
// 				} else {
					
// 					$.each(response, function(k, v) {
// 						if(k==0){
// 						$('#pinga').append("<div class='panel-heading'> Restaurante: " + v.restaurante + "</div>");
						
// 						}
// 					});
// 				}
// 			},
// 			error : function(response) {
// 				alert("Fail cargando la lista de topUsers  " + response);
// 			}
// 		});

		$('#pinga').append("<div class='panel-heading'> Restaurante: <%=request.getAttribute("res")%>  </div>");
		$('#pinga').append("<div class='panel-heading'> Mesa: <%=request.getAttribute("mesa")%>  </div>");

});
					
					
					
					
					
					</script>
					

 
  
				<!-- Main -->
				<div id="main">
					<article class="thumb">
						<a
							href="<c:url value="http://www.entrevies.com/wp-content/themes/entrevies/images/restaurante/entrantes-en-cocina-creativa.jpg" />"
							class="image"><img
							src="<c:url value="http://www.entrevies.com/wp-content/themes/entrevies/images/restaurante/entrantes-en-cocina-creativa.jpg" />"
							alt="" /></a>
						<h2>Merluza a la pinga</h2>
						<p>Nunc blandit nisi ligula magna sodales lectus elementum
							non. Integer id venenatis velit.</p>
							
					</article>
					
					<a href="#demo" class="btn btn-default" data-toggle="collapse">Info & Pedir	</a>
  <div id="demo" class="collapse">
   <div data-role="page">
						<div data-role="main" class="ui-content">
							<h2>Plato estrella</h2>
							<p>Nunc blandit nisi ligula magna sodales lectus elementum
								non. Integer id venenatis velit.</p>
							<form method="get" action="pedido">
								<fieldset class="ui-field-contain">
									<label for="day">Carne :</label> <select path="day" name="day"
										id="day">
										<option value="Pollo">Pollo</option>
										<option value="Ternera">Ternera</option>
									</select> <label for="day2">Extra :</label> <select path="day2"
										name="day2" id="day2">
										<option value="Queso">Queso</option>
										<option value="Champiniones">Champiniones</option>
										<option value="Maiz">Maiz</option>
									</select>
								</fieldset>
								<input path="mesas" type="hidden" id="mesas" name="mesas"
									value="<%=request.getAttribute("mesa")%>"></input> <input
									type="hidden" path="restaurante" id="restaurante"
									name="restaurante" value="<%=request.getAttribute("res")%>"></input>
								</br>
								<input type="submit" data-inline="true" value="Pedir">
							</form>

						</div>
					</div>
  </div>

					<%
						if (request.getAttribute("result") != null) {
					%>
					<div class="alert alert-success">
						<strong><%=request.getAttribute("result")%></strong>
					</div>
					<%
						}
					%>
					
					<article class="thumb">
						<a
							href="<c:url value="https://www.comedera.com/wp-content/uploads/2013/12/el-brillante-bocata-calamares.jpg" />"
							class="image"><img
							src="<c:url value="https://www.comedera.com/wp-content/uploads/2013/12/el-brillante-bocata-calamares.jpg" />"
							alt="" /></a>
						<h2>Bocata de calamares</h2>
						<p>Nunc blandit nisi ligula magna sodales lectus elementum
							non. Integer id venenatis velit.</p>
					</article>
					<div data-role="page">
						<div data-role="main" class="ui-content">
							<h2>Bocata calamares</h2>
							<p>Nunc blandit nisi ligula magna sodales lectus elementum
								non. Integer id venenatis velit.</p>
							<form method="get" action="pedido">
								<fieldset class="ui-field-contain">
									<label for="day">Carne :</label> <select path="day" name="day"
										id="day">
										<option value="Pollo">Pollo</option>
										<option value="Ternera">Ternera</option>
									</select> <label for="day2">Extra :</label> <select path="day2"
										name="day2" id="day2">
										<option value="Queso">Queso</option>
										<option value="Champiniones">Champiniones</option>
										<option value="Maiz">Maiz</option>
									</select>
								</fieldset>
								<input path="mesas" type="hidden" id="mesas" name="mesas"
									value="<%=request.getAttribute("mesa")%>"></input> <input
									type="hidden" path="restaurante" id="restaurante"
									name="restaurante" value="<%=request.getAttribute("res")%>"></input>
								</br>
								<input type="submit" data-inline="true" value="Pedir">
							</form>

						</div>
					</div>
					
					<article class="thumb">
						<a href="<c:url value="http://diariodegastronomia.com/wp-content/uploads/2015/07/Locro-plato-tradicional-de-la-cocina-quite%C3%B1a.jpg" />"
							class="image"><img
							src="<c:url value="http://diariodegastronomia.com/wp-content/uploads/2015/07/Locro-plato-tradicional-de-la-cocina-quite%C3%B1a.jpg" />" alt="" /></a>
						<h2>Tempus aliquam veroeros</h2>
						<p>Nunc blandit nisi ligula magna sodales lectus elementum
							non. Integer id venenatis velit.</p>
					</article>
					<div data-role="page">
						<div data-role="main" class="ui-content">
							<h2>Plato estrella</h2>
							<p>Nunc blandit nisi ligula magna sodales lectus elementum
								non. Integer id venenatis velit.</p>
							<form method="get" action="pedido">
								<fieldset class="ui-field-contain">
									<label for="day">Carne :</label> <select path="day" name="day"
										id="day">
										<option value="Pollo">Pollo</option>
										<option value="Ternera">Ternera</option>
									</select> <label for="day2">Extra :</label> <select path="day2"
										name="day2" id="day2">
										<option value="Queso">Queso</option>
										<option value="Champiniones">Champiniones</option>
										<option value="Maiz">Maiz</option>
									</select>
								</fieldset>
								<input path="mesas" type="hidden" id="mesas" name="mesas"
									value="<%=request.getAttribute("mesa")%>"></input> <input
									type="hidden" path="restaurante" id="restaurante"
									name="restaurante" value="<%=request.getAttribute("res")%>"></input>
								</br>
								<input type="submit" data-inline="true" value="Pedir">
							</form>

						</div>
					</div>
					
					
					<article class="thumb">
						<a href="<c:url value="http://www.eliminaladiabetes.com/wp-content/uploads/2014/03/platillos-para-diabeticos1.jpg" />"
							class="image"><img
							src="<c:url value="http://www.eliminaladiabetes.com/wp-content/uploads/2014/03/platillos-para-diabeticos1.jpg" />" alt="" /></a>
						<h2>Aliquam ipsum sed dolore</h2>
						<p>Nunc blandit nisi ligula magna sodales lectus elementum
							non. Integer id venenatis velit.</p>
					</article>
					
					<div data-role="page">
						<div data-role="main" class="ui-content">
							<h2>Plato estrella</h2>
							<p>Nunc blandit nisi ligula magna sodales lectus elementum
								non. Integer id venenatis velit.</p>
							<form method="get" action="pedido">
								<fieldset class="ui-field-contain">
									<label for="day">Carne :</label> <select path="day" name="day"
										id="day">
										<option value="Pollo">Pollo</option>
										<option value="Ternera">Ternera</option>
									</select> <label for="day2">Extra :</label> <select path="day2"
										name="day2" id="day2">
										<option value="Queso">Queso</option>
										<option value="Champiniones">Champiniones</option>
										<option value="Maiz">Maiz</option>
									</select>
								</fieldset>
								<input path="mesas" type="hidden" id="mesas" name="mesas"
									value="<%=request.getAttribute("mesa")%>"></input> <input
									type="hidden" path="restaurante" id="restaurante"
									name="restaurante" value="<%=request.getAttribute("res")%>"></input>
								</br>
								<input type="submit" data-inline="true" value="Pedir">
							</form>

						</div>
					</div>
					

				</div>

				<!-- 				Footer -->
				<!-- 					<footer id="footer" class="panel"> -->
				<!-- 						<div class="inner split"> -->
				<!-- 							<div> -->
				<!-- 								<section> -->
				<!-- 									<h2>Magna feugiat sed adipiscing</h2> -->
				<!-- 									<p>Nulla consequat, ex ut suscipit rutrum, mi dolor tincidunt erat, et scelerisque turpis ipsum eget quis orci mattis aliquet. Maecenas fringilla et ante at lorem et ipsum. Dolor nulla eu bibendum sapien. Donec non pharetra dui. Nulla consequat, ex ut suscipit rutrum, mi dolor tincidunt erat, et scelerisque turpis ipsum.</p> -->
				<!-- 								</section> -->
				<!-- 								<section> -->
				<!-- 									<h2>Follow me on ...</h2> -->
				<!-- 									<ul class="icons"> -->
				<!-- 										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li> -->
				<!-- 										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li> -->
				<!-- 										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li> -->
				<!-- 										<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li> -->
				<!-- 										<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li> -->
				<!-- 										<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li> -->
				<!-- 									</ul> -->
				<!-- 								</section> -->
				<!-- 								<p class="copyright"> -->
				<!-- 									&copy; Unttled. Design: <a href="http://html5up.net">HTML5 UP</a>. -->
				<!-- 								</p> -->
				<!-- 							</div> -->
				<!-- 							<div> -->
				<!-- 								<section> -->
				<!-- 									<h2>Get in touch</h2> -->
				<!-- 									<form method="post" action="#"> -->
				<!-- 										<div class="field half first"> -->
				<!-- 											<input type="text" name="name" id="name" placeholder="Name" /> -->
				<!-- 										</div> -->
				<!-- 										<div class="field half"> -->
				<!-- 											<input type="text" name="email" id="email" placeholder="Email" /> -->
				<!-- 										</div> -->
				<!-- 										<div class="field"> -->
				<!-- 											<textarea name="message" id="message" rows="4" placeholder="Message"></textarea> -->
				<!-- 										</div> -->
				<!-- 										<ul class="actions"> -->
				<!-- 											<li><input type="submit" value="Send" class="special" /></li> -->
				<!-- 											<li><input type="reset" value="Reset" /></li> -->
				<!-- 										</ul> -->
				<!-- 									</form> -->
				<!-- 								</section> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</footer> -->
	</div>

	<!-- Scripts -->
	<script src="<c:url value="/resources/assets/js/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/assets/js/jquery.poptrox.min.js" />"></script>
	<script src="<c:url value="/resources/assets/js/skel.min.js" />"></script>
	<script src="<c:url value="/resources/assets/js/util.js" />"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="<c:url value="/resources/assets/js/main.js" />"></script>

</body>
</html>