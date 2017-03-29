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
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container">
			<table class="centered"><tr><td class="centered">
			<img alt="까를르교 객실" src='<c:url value="/resources/images/budaPublicRoom.jpg"/>' style="width:100%;margin-top:0px">
			</td></tr></table>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
