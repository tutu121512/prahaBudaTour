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
	    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container">
			<img alt="예약안내" src='<c:url value="/resources/images/usePrice1.jpg"/>' style="width:100%;margin-top:10px">
			<a href="/controller/praha/reserveBoard"><ul style="cursor:pointer"><li style="font-size:31px">
				예약문의하러가기<i class="material-icons" style="font-size:24px">message</i>
			</li>
			<li style="margin-left:100px;">
				클릭하기<i class="material-icons" style="font-size:24px;">mouse</i>
			</li>
			</ul></a>
			<img alt="환불정보" src='<c:url value="/resources/images/usePrice2.jpg"/>' style="width:100%;margin-top:10px;margin-bottom:20px">
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
