﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
	    <!--Let browser know website is optimized for mobile-->
	  <!--Let browser know website is optimized for mobile-->
	   <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">  

<style>
​
body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
 	 }

 	 main {
 	   flex: 1 0 auto;
 	 }
</style>
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container">
			<table class="centered"><tr><td class="centered">
			<img alt="인사말" src='<c:url value="/resources/images/prahaGreetings.jpg"/>' style="width:100%;margin-top:1em">
			</td></tr></table>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
