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
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<form method="post" action="/controller/praha/prahaReserveInsert">
			<div id="main_content" style="margin-top: 16px;">
				<div style="height:148px">
				<textArea style="margin-left:10px; float:left; height:90%; width:50%" name="content"
				 placeholder="문의 내용을 입력해주세요. 카카오톡 ID를 남겨주시면 연락이 편합니다."></textArea>
				<input type="submit" style="height: 150px;margin: 10px 0px 0px 10px; width: 70px;">
				</div>
				<input type="text" placeholder="writer 이름" name="writer">
				<input type="text" placeholder="title 입력" name="title">
				<input type="password" placeholder="password 입력" name="password">
				<input type="text" placeholder="phone 입력" name="phone">
				<input type="text" placeholder="KakaoID 입력" name="kakaoId">
			</div>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
