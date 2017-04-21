<%@ page session="true" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="com.home.models.*"%>
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
body {
	background-color: #666363;
}

#background {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 50%;
	background-color: pink;
	z-index: 1;
}

article {
	min-height: 13em;
}

#content {
	position: relative;
	z-index: 2;
	padding: 30px;
	text-align: center;
	font-weight: bold;
	font-family: Arial, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-backdrop {
	background-color: red;
}

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	<%
		Pedido p = new Pedido();
		p = (Pedido) request.getAttribute("pedido");
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html"><strong>Restaurante </strong><%=request.getAttribute("res")%></a>
			</h1>
			<nav>
				<ul>
					<li><a onclick="Carrito()">Carrito <%=(String)request.getAttribute("count") != null ? request.getAttribute("count") :"" %> <span
							class="glyphicon glyphicon-shopping-cart"></span></a></li>
				</ul>
			</nav>
		</header>
		<center>
			<h1 id="pinga"></h1>
			<center>
				<script>
				var pedido = "<%=p != null ?String.valueOf( p.getId()) : null%>";
				var count =  "<%=p != null ? (String)request.getAttribute("count") : null%>";	
				function Carrito(){
						if(pedido=="null")
							{
							alert("pedido nulo");
							}
						else
							{
							if(count=="null")
								{
								alert("Carrito vacio");
								}
							else
								window.location.href= "/pideya/test/carrito/"+pedido;
							}
						
					}
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

<%-- 		$('#pinga').append("<div class='panel-heading'> Restaurante: <%=request.getAttribute("res")%>  </div>"); --%>
		$('#pinga').append("</br><div style=' border-radius: 20%;width:70%;background:#575454;' class='jumbotron'><img src='http://cdn.animalgourmet.com/wp-content/uploads/2014/04/animal_gourmet_logo.png'  class='img-responsive'></div>");

});
				
					
					function SeguirComprando(){
						var FormAction = document.getElementById("form1").action;
				
						document.getElementById("form1").action = "/pideya/test/seguir/<%=request.getAttribute("id")!=null ?request.getAttribute("id"):""%>";
						document.getElementById("form1").submit();
					}
					
					
					
					
					</script>


				<!-- Modal comida -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">


						<!-- Modal content-->
						<div style="background: #666363;" class="modal-content">
							<div class="modal-header">
								<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
								<h2>Merluza a la pinga</h2>
							</div>
							<div class="modal-body">
								<div data-role="page">
									<div data-role="main" class="ui-content">
										<h2>Plato estrella</h2>
										<!-- 										<p>Nunc blandit nisi ligula magna sodales lectus elementum -->
										<!-- 											non. Integer id venenatis velit.</p> -->


										<form id="form1" method="get" action="/pideya/test/confirmar<%=request.getAttribute("id")!=null ? "/"+request.getAttribute("id") : ""%>">
											<fieldset class="ui-field-contain">
												<label for="day3"><span> <!-- Steak Filled icon by Icons8 -->
														<!-- Steak icon by Icons8 --> <!-- Meal icon by Icons8 -->
														<!-- Meal icon by Icons8 --> <img class="icon icons8-Meal"
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAFTUlEQVR4Xu2ZgZEjRQxFdyMAIsAXwUEE+CIAIlgTARDBmQiACM4XAUsE543gIAKGCIAIOL2tbtCqunuknh7XVnlU1bX2WKOWvn5LmtnbmyuX2yuP/2YDYGPAlSOwHYErJ8BWBC91BD4Wpn0h6zNZe1m7tDQBJ/nCOsv6TdaDrL/XZuiaABD0l7K+S4H3xAIQP8n6dS0w1gCA7N6lwAFhhMAEgHibWDLC5qON0QC8Hhy4DRQgjrJ+HoXAKADI+i8zVP9dfr+XBa2n9FfHQX3Azj6tl40gsfH1CDaMAOArceSNrBLd/0zUJXCCjghgYJsa8mnhRtjwTQI1YveJ7lIADil468A/cuGYgu92Tt0ICNj7qGAMEE69mywBoBY8FZvfRrcwGEagdBYr3SD0AgA1OfNWvh+Y9VpSYcOPhR+pCRy1kPQAsJMd3svSZx7Kk/WwAyFv/1dmL9qiPhIw7nNZU8RmDwAET8XW0oV+xNGCLiBQfLXQHQDBLVEAjmKZXq/lErSvBVQ6DiF/IgDsxAtLfQoe9aAmTIRkCsZwZPJoy0T3r7kp+xK9zrHThTF0FCIA2Oxz7gGlVO0JliK5ryBzLvzWCwB7TbJ0PfhBvuPvrHgBYJM/Uhaz0VrrQfddyvqsA0qhFwBM2KNAUl5UkvPEJy8AB7lLFxwmPLJfEqrzt5HIk+4SADAxydITo2s28AJgK3+t0OxT9nX8PAPkOsF5rc34SwE4im1doF0dwQMAlP7LZBR6gbgVqA8IWQjetkwcK4GwFICd2OWYavlEvjQnUg8AduorBcWmJQdeyfWzcQqAAMrKUgCwZ8GdnU88ABzFsKZWrcLaQvRg2KADLrFgBAC2/sx2Aw8AZJD3eVlqqNp+3CpCpQFmBACWra0kPMbjAYBzBb2zMGqSQStePe6jLlBYtYwAwNqdZAPqVVU8ANQmM2vUq5fvq+lTtPJQo9ut175Xz80Ar0Gv3hwAe1E4JaWD/D2nz177Xr3VAWi1oFJrbenvxFvb4mrsHQ6ApiSo1TYmU7pYtoogmbWPsq2WZYtbaxLVAPC8AtiLaoANrFYEj7KLncSYA+wgUntWmEQX2yV9CiYsyMJrcTqJlb1c0DPGkC5gAahlCgctTekWAIMjCAzhu50OcyCAQGBan96ug0e3Nomu0gZx2DMI4ZgdRApJWnypln0MR3x9dMTTBi2qrYcM6H2W1fqnhkaAsRp7d05Y3oreoaFrH9qGjMLQz1K7RkF8AwSYMBcUwUB3zrzNXCnGVubRj/rpZgCKZFVX+NkZW/Q552TLvhsgkFPKvA6UAACkpA+gUwkVdc2COPe6LgQAgei2Rdbo2x4J9WUxGNXPPvDIrlteqw3/57enBqCMYTKg37t5375GA4rq45/Nfut95ZOkeQEobQILqAW2b1tWRAOK6pMcapTOvueIho5AjQX38gOVtiXRgKL6DD575YA7+9wTYQD6FCn7f7m5oxANKKJvqY+Pc/50H4F841k+6I7A9VbBiQSELa/+QXTt88Ts6GupGmUA9+9kMbzY/9XXQPAGlH3z6JeCh/q03skG2freAwD22Mi+0eE6lKQAafEEFNFnLGcfK7WHtCYevQBgtJQFrlubowGw9tjT1fNLSCwBoAbCpQHoDr6Urcjxyboch7OsXBMuBQBnfi+LetQtSxmQN97Jh5MsusMlAKDacwSn7sjTjaMAyH4wJ/DgomV0DSjt0Y3DaABKjowGoDvY0o0bAEPhLBvbGGBwmWNdFLBFOZxzZpHxdHM0oKj+Ih8vAcAiB9e+eQNgbYSfu/2NAc89Q2v7d/UM+AAmuURQ0X6jGwAAAABJRU5ErkJggg=="
														width="20" height="20">
												</span>Cantidad :</label> <select path="day" name="day" id="day">
													<%
														for (int i = 0; i < 10; i++) {
													%>
													<option value="<%=i%>"><%=i%></option>
													<%
														}
													%>
												</select>
												<!-- 												<label for="day"><span> Steak Filled icon by Icons8 -->
												<!-- 														Steak icon by Icons8 <img -->
												<!-- 														class="icon icons8-Steak" -->
												<!-- 														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEVUlEQVRoQ+2YjXHUMBCFkwqACjAVABVgKgAqwFRAqACnAqACLhUAFXCpAKgAUwFQAewXLGZ5Xsm/CXMz2RlNzra0em9/pRwfHbgcHzj+o2sC/9uDl+GBm0bquY3HNu71BDv7+9nGexsfbPzYivjWBAD81gHP4Wztw5stiGxJAMt/tcHfKYIXHvaemTI/nLMlgY+2Q70AyTNbs1uw7mLJVgQIiZcC4syeT/owgRjhxfPtACye2C8hsQWBKHTOC96AxCsBSzjdt9HNJbEFAbX+TwNR9ZbP4cEjVKQbbgIea66aQGT9UwMBqTEBLBXLC16g3E6WtR7QcJhifQ9uZw9P3Qt6BP1jsqwlQNms3G6R9Wv7/qC3LAC9sBYdXm7Zw+RGt4YAwCidpc1f20e6chKaF17zsrMH74VZZXUNAd1Y3U/Z/CRgebxjo3PvG/vtc4EceCJzAjV/Xq0h8N3W+67LplSWJK390N7AN6356ECXF0KI9XisKEsJqHVJXj1C5AhElWZv68kTlZ29IKSyspSAxnZUw2vbVXPkm72rAjSQB+yj4BtehUSY2EsJENt4IUku8QCVEhTwlMhSnYc0a/S4AQlCdCBLCEQxWyp9EGXNPgKQ8QZz78o3zbGLz0sINLbOV40v4o2JOIvTIIzVfV4QQhjqH1lCQI/NL0wjObG1QKKz4c9Lg1CdS6A2hZqYWtenEqlsYrp68jvS09p7X4oHR425BDR5555dsCqVhm7siwAJzrNWGjXYuc3h3V+ZQ4C4b8S82pRy1gc0FUjXU36Jdd8AvQ4tGFQw+shsAlhMLyHRucbrruzBh0j6RtKTM4AOa7tTsokHAKFJCgiUK4BSiAAYPZ24iTX0CrxDGHmvtvbsc2DQMMdCCKV66eDYAHjfkJaECGvQT2gl8bohpv/lmFWFpoLXxC6FCBZO1gZgEooBHtq5d3jLH8XDy1LOA2xEufSbRJZnPzzBvKkhkjBCFMAMDUW88s6R4eepjVbeZTuxNqsceNXnn7E0QDREEmgfgn5dZLxcmQ0J1L31vdLwHBKgZ/NUeTREAI6XSgJZcs6vZX62XEchxEb+ihcdlT2Iyh5Sc+J3klKIRCSiase84lElIqAX9dJRoektlgDh6lwu5CyPtYn3OpgwZrwwhH6JolKpPbG5NLixjpoDj9XbIGSYHyatKlJwxLC/iF/GURkMhCjAqwyzQb3PWUAJ4E69YEd32Jy+0vvUcfFaDjgGa2zkKtRAfxQenc3yVzpqNJvSbLRejxEBNJeSVE61uvj1hAzNa9YeEQEsoMeHtBEJinUYaSOOuEi6PQGytkE48ndMWM+e3djE6HsuQXc22ZfSJbrH1gC8tbEfm1j6XqowKCd0/JVuzV6spaNjHEJlkcUVwNhplHCACDGs/+qYSib1BsJvlbXnhFA0l5hmVDbqfgIE078/qCDkBSPlCYBnJeVUq6R5Yx6Yq+/K518TuHKTy4YH74Hfw6z8MdRXrCAAAAAASUVORK5CYII=" -->
												<!-- 														width="20" height="20"> -->
												<!-- 												</span>Carne :</label> <select path="day" name="day" id="day"> -->
												<!-- 													<option value="Pollo">Pollo</option> -->
												<!-- 													<option value="Ternera">Ternera</option> -->
												<!-- 												</select> -->
												</br> <label for="day2"> <img class="icon icons8-Meal"><span
													style="color: black" class="glyphicon glyphicon-cog"></span>Extra
													:
												</label> <select path="day2" name="day2" id="day2">
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
											<button  type="submit" class="btn btn-default"
												data-inline="true">
												<font color="black">Pedir y pagar</font>
											</button>
											</br>
											</br>
											<button onclick="SeguirComprando()" type="button" class="btn btn-success"
												data-inline="true">Pedir y añadir mas</button>
										</form>

									</div>
								</div>
							</div>
							<div class="modal-footer">
								<a type="button" class="btn btn-default" data-dismiss="modal">Cerrar</a>
							</div>
						</div>

					</div>
				</div>

				<!-- Main -->
				<div id="main">

					<div class="container">
						<h2>la excelencia de nuestras comidas al brillo de tu mesa</h2>

						<div class="row">


							<!--================Empieza el anuncio -->

							<div class="col-xs-12">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 13em;" class="thumb">
										<a
											href="<c:url value="http://www.entrevies.com/wp-content/themes/entrevies/images/restaurante/entrantes-en-cocina-creativa.jpg" />"
											class="image"><img class="img-responsive"
											src="<c:url value="http://www.entrevies.com/wp-content/themes/entrevies/images/restaurante/entrantes-en-cocina-creativa.jpg" />"
											alt="" /></a>
										<h2>Pinga a la merluza</h2>
									</article>
									<h5>
										</br>
										<a href="#demo" data-toggle="modal" data-target="#myModal"><span
											class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">9$</span>

											<h2 style="background-color: #666363;">Merluza a la
												pinga</h2>


											<div id="demo" class="collapse">
												<p style="color: #5e9ca0;">
													<span style="color: #ffffff;"></br>Los ingredientes que
														se suelen emplear a la horade hacer las m&aacute;s
														conocidas y t&iacute;picas recetas de merluzas al horno
														son estas: </span><br /> <br /> <span style="color: #ffffff;">-
														Merluza de buena calidad</span><br /> <br /> <span
														style="color: #ffffff;">- Cebollas</span><br /> <br /> <span
														style="color: #ffffff;">- Patatas</span><br /> <br /> <span
														style="color: #ffffff;">- Ajos</span><br /> <br /> <span
														style="color: #ffffff;">- Vino blanco</span><br /> <br />
													<span style="color: #ffffff;">- Lim&oacute;n</span><br />
													<br /> <span style="color: #ffffff;">- Pimienta</span><br />
													<br /> <span style="color: #ffffff;">- Aceite de
														oliva virgen</span><br /> <br /> <span style="color: #ffffff;">-
														Sal</span>
												</p>
												<a href="#demo" data-toggle="modal" data-target="#myModal"><span
													class="glyphicon glyphicon-shopping-cart"></span> <!-- 	 data-toggle="collapse" -->
													Info & Pedir </a>
											</div>
											</br> <a style="font-size: 200%;" href="#demo"
												data-toggle="collapse"> <span
												class="glyphicon glyphicon-circle-arrow-down"></span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!--================Acaba el anuncio -->

							<!--================Empieza el anuncio -->

							<div class="col-xs-12">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 10em;" class="thumb">
										<a
											href="<c:url value="http://www.losandes.com.ar/files/image/2015/03/26/878306.jpg" />"
											class="image"><img class="img-responsive"
											src="<c:url value="http://www.losandes.com.ar/files/image/2015/03/26/878306.jpg" />"
											alt="" /></a>
										<h2>Pizza de la Mamma</h2>
									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">7,5$</span>

											<h2 style="background-color: #666363;">Pizza mediana</h2>


											<div id="demo" class="collapse">
												<p style="color: #5e9ca0;">
													<span style="color: #ffffff;"></br>Los ingredientes que
														se suelen emplear a la horade hacer las m&aacute;s
														conocidas y t&iacute;picas recetas de merluzas al horno
														son estas: </span><br /> <br /> <span style="color: #ffffff;">-
														Merluza de buena calidad</span><br /> <br /> <span
														style="color: #ffffff;">- Cebollas</span><br /> <br /> <span
														style="color: #ffffff;">- Patatas</span><br /> <br /> <span
														style="color: #ffffff;">- Ajos</span><br /> <br /> <span
														style="color: #ffffff;">- Vino blanco</span><br /> <br />
													<span style="color: #ffffff;">- Lim&oacute;n</span><br />
													<br /> <span style="color: #ffffff;">- Pimienta</span><br />
													<br /> <span style="color: #ffffff;">- Aceite de
														oliva virgen</span><br /> <br /> <span style="color: #ffffff;">-
														Sal</span>
												</p>
												<a href="#demo" data-toggle="modal" data-target="#myModal"><span
													class="glyphicon glyphicon-shopping-cart"></span> <!-- 	 data-toggle="collapse" -->
													Info & Pedir </a>
											</div>
											</br> <a style="font-size: 200%;" href="#demo"
												data-toggle="collapse"> <span
												class="glyphicon glyphicon-circle-arrow-down"></span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!--================Acaba el anuncio -->

							<!--================Empieza el anuncio -->

							<div class="col-xs-12">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 13em;" class="thumb">
										<a
											href="<c:url value="https://grupofeminas.files.wordpress.com/2015/03/comida.jpg" />"
											class="image"><img class="img-responsive"
											src="<c:url value="https://grupofeminas.files.wordpress.com/2015/03/comida.jpg" />"
											alt="" /></a>
										<h2>Ensalada Asumaja</h2>
									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">4$</span>

											<h2 style="background-color: #666363;">Ensalada
												especialidad</h2>


											<div id="demo" class="collapse">
												<p style="color: #5e9ca0;">
													<span style="color: #ffffff;"></br>Los ingredientes que
														se suelen emplear a la horade hacer las m&aacute;s
														conocidas y t&iacute;picas recetas de merluzas al horno
														son estas: </span><br /> <br /> <span style="color: #ffffff;">-
														Merluza de buena calidad</span><br /> <br /> <span
														style="color: #ffffff;">- Cebollas</span><br /> <br /> <span
														style="color: #ffffff;">- Patatas</span><br /> <br /> <span
														style="color: #ffffff;">- Ajos</span><br /> <br /> <span
														style="color: #ffffff;">- Vino blanco</span><br /> <br />
													<span style="color: #ffffff;">- Lim&oacute;n</span><br />
													<br /> <span style="color: #ffffff;">- Pimienta</span><br />
													<br /> <span style="color: #ffffff;">- Aceite de
														oliva virgen</span><br /> <br /> <span style="color: #ffffff;">-
														Sal</span>
												</p>
												<a href="#demo" data-toggle="modal" data-target="#myModal"><span
													class="glyphicon glyphicon-shopping-cart"></span> <!-- 	 data-toggle="collapse" -->
													Info & Pedir </a>
											</div>
											</br> <a style="font-size: 200%;" href="#demo"
												data-toggle="collapse"> <span
												class="glyphicon glyphicon-circle-arrow-down"></span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!--================Acaba el anuncio -->
						</div>


						<img width="700" height="700" class="img-responsive"
							src="<c:url value="http://test08.inversionesdigitales.com/img/commons/vinos-titulo.png" />"
							alt="" /></br>



						<!--===========Bedidas=========== -->
						<div class="row">
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="700" height="700"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>
									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="500" height="500"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>

									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
						</div>

						<div class="row">
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="700" height="700"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>
									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="500" height="500"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>

									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
						</div>

						</br> <img width="700" height="700" class="img-responsive"
							src="<c:url value="http://test08.inversionesdigitales.com/img/commons/cervezas-titulo.png
" />"
							alt="" /></br>
						<div class="row">
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="700" height="700"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>
									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
							<!--================Empieza el anuncio -->
							<div class="col-xs-6">
								<div style="background-color: #575454;" class="thumbnail">

									<article style="min-height: 9em;" class="thumb">
										<a
											href="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											class="image"><img width="500" height="500"
											class="img-responsive"
											src="<c:url value="http://www.crepestation.cl/wp-content/uploads/2017/01/fantanor.png" />"
											alt="" /></a>

									</article>
									<h5 href="#demo" data-toggle="modal" data-target="#myModal">
										<a><span class="glyphicon glyphicon-plus-sign"></span> <!-- 	 data-toggle="collapse" -->
											Añadir Pedido </a>
									</h5>
									<div class="container">

										<div data-role="main" class="ui-content">
											<span style="float: right; font-size: 200%;"
												class="label label-danger">1$</span>

											<h2 style="background-color: #666363;">Fanta naranja</h2>
										</div>
									</div>
								</div>
							</div>
							<!--================Acaba el anuncio -->
						</div>

						<img width="500" height="500" class="img-responsive"
							src="<c:url value="http://www.vyp-kaleidos.com/wp-content/uploads/2016/04/botellas2017.png" />"
							alt="" />
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