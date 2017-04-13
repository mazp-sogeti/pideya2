<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.home.models.*, java.util.List"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  #alertAudio{ display:none; }
</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="<c:url value="/resources/js/push.min.js" />"></script>
  <script src="<c:url value="/resources/audiojs/audio.min.js" />"></script>
  
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
    <tbody id="tabla">
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
<head>
  <title>Pusher Test</title>
  <script src="https://js.pusher.com/4.0/pusher.min.js"></script>
  <script>

    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;
    var i =0;
    var pusher = new Pusher('25a63b5bdeb97ea6104e', {
      cluster: 'eu',
      encrypted: true
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
    	var a= data.message;
    	i++;
    	//work on PC only
//     	var audio = new Audio('<c:url value="/resources/alert.mp3" />');
//     	audio.play();
    	
    	audiojs.events.ready(function() {
    	    var as = audiojs.createAll();
    	   // var x = document.getElementById("alertAudio");
    	  //  x.autoplay = true;

    	  });
    	
//     	var audio = document.getElementById('denied');
//     	var button = document.getElementById('play-button');
//     	button.addEventListener('click',function(){
//     	    audio.play();
//     	});
    	
    	alert("Nuevo pedido de la "+ a.mesa);
    	
//     	Push.create("Hello world!", {
//     	    body: "How's it hangin'?",
//     	    icon: 'icon.png',
//     	    timeout: 4000,
//     	    onClick: function () {
//     	        window.focus();
//     	        this.close();
//     	    }
//     	});
    	
//     	$('#play-button').click(function(){ audio.play(); });
//     $('#alertAudio').click(function(){ audio.play(); });

		$('#tabla').append("<tr><td>"+a.id+"</td><td>"+a.restaurante+"</td><td>"+a.mesa+"</td><td>"+a.pedido+"</td></tr>");
		var re = 0;
		if(i > 0) 
			re=1 ;
		else
			re=0;
		 <%
		    String url = "https://www.youtube.com/embed/p_R0vEaw0bE?rel=0&autoplay=";%> <%String url2 = "&output=embed";%>
		  	var URLOK = "<%=url%>"+re+"<%=url2%>";
		  	
		  	 $('#if').attr('src',URLOK);  
    });
 
    </script>
</head>
 
 
<!--  <audio id="denied" autobuffer controls autoplay> -->
<%--     <source src="<c:url value="/resources/alert.mp3" />" /> --%>
<!-- </audio> -->
<!-- <a href="#" id="play-button"></a> -->
 
<%-- <audio id="alertAudio" src="<c:url value="/resources/alert.mp3" />" autobuffer controls autoplay /> --%>

<iframe  id="if" hidden width="640" height="360" src="" frameborder="0" allowfullscreen ></iframe>


</body>
</html>