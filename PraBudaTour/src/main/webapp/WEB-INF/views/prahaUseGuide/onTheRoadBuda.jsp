<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
<!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
	    <!--Let browser know website is optimized for mobile-->
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
	<style type="text/css">
  #map { height: 400px;
  		margin-bottom:20px;
   }
  #addr { 
         margin-left:10px;
         width:120px;
         font-size:20px;
         font-weight:bold;
         color:blue;
   }
</style>
   </head>
   <body>
    <!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
  </body>
  <main>
		<div class="container">
		<div class="row">
		<table class="centered"><tr><td class="centered">
                        <img alt=" HUNGARY" src='<c:url value="/resources/images/selectonTheRoad.jpg"/>' style="margin-top:10px; padding-left:340px" >
		        <div>
		        <label id="addr">O utca 11 , Budapest , 1066 , HUNGARY</label>
		        </div>
                   <div id="map1"><img alt="rootbuda" src='<c:url value="/resources/images/rootbuda.png"/>'</div>
		   <div id="map"></div>
		</td></tr>
		</table>
		
		</div>
   <script>
      function initMap() {
        var myLatLng = {lat: 47.503231, lng: 19.056643};

        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          scrollwheel: true,
          zoom: 16
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: myLatLng,
          title: 'Hello World!'
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZX8_-AZGre3u8odCflwzpAiuKzPinswI&callback=initMap"
    async defer></script>
    </div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
	
</html>