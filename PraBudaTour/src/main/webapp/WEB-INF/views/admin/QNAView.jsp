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
		<pre style="border: none; border: 2px solid #000; height: 300px">1:1 문의 예시입니다.</pre>
		<div style="float:right;">
			<a class="waves-effect waves-light btn">답변하기</a>
			<a class="waves-effect waves-light btn">삭제하기</a>
		</div>
	</div>
	</main> 


</body>
</html>