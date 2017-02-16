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
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<div>
		정보통신망법 제50조의 2, 제50조의 7 등에 의거하여 프라하즐겨찾기가 운영, 관리하는 웹페이지 상에서 다음과 같은 행위를 금지합니다.
		프라하즐겨찾기의 동의 없이 영리 목적의 광고성 정보를 게시하는 행위를 거부합니다. 이메일 주소 수집 프로그램이나 그 밖의 기술적 장치등을 이용하여 이메일 주소를 무단으로 수집하는 행위를 거부합니다.
		</div>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
