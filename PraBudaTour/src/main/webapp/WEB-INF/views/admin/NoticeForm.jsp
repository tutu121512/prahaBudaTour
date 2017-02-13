<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link
	href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>'
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href='<c:url value="/resources/css/materialize.css"/>'
	media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />

	<main>
	<div class="container">
		<h3>Q & A</h3>
		<textarea style="border: none; border: 2px solid #000; height: 300px">답변하는 부분입니다.</textarea>
		<a class="waves-effect waves-light btn" style="float:right; margin-top:30px; ">등록하기</a>
	</div>
	</main> 


</body>
</html>