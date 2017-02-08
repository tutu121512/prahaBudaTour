<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>♥PRAHA/BUDAPEST 오신것을 환영합니다.♥</title>
		<meta name="description" content="Fullscreen Layout with Page Transitions"/>
		<meta name="keywords" content="fullscreen layout, boxes, responsive, page transitions, css transitions, jquery, portfolio, template" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/component.css'/>"/>
		<script src="<c:url value='/resources/main/js/modernizr.custom.js'/>"></script>
		<script>
			window.onfocus=function(){
			}
			window.onload=function(){
			window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
			window.resizeTo(1200,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
			}
		</script>
	</head>
	<body>
		<div class="container">	
			<div id="bl-main" class="bl-main">
				<section>
					<div class="bl-box" style="cursor: pointer;" onclick="location.href='/controller/praha/prahaMain'">
					</div>
				</section>
				
				<section>
					<div class="bl-box" style="cursor: pointer;" onclick="location.href='/controller/praha/prahaMain'">
					</div>
				</section>
			</div>
		</div><!-- /container -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script>
			$(function() {
				Boxlayout.init();
			});
		</script>
	</body>
</html>
