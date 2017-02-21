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
	    <style>
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
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	<script>
	    function submit()
	    {
	    document.getElementById("reserveInsertForm").submit();
	    }
	</script>
	<main>
	<div class="container" style="margin-bottom:15px">
		<div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		
		<form id="reserveInsertForm" method="post" action="/controller/praha/prahaReserveInsert">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate">
							<label for="writer">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-bottom:-30px">
						<div class="input-field col s12">
							<i class="material-icons prefix">mode_edit</i>
							<textarea id="icon_prefix2" class="materialize-textarea" name="content" placeholder="카카오톡 ID를 남겨주시면 연락이 편합니다."></textarea>
							<label for="icon_prefix2">문의 내용 (입력창이 자동으로 늘어납니다.)</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_takeoff</i>
							<input id="startDate" name="startDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160213" maxlength="6">
							<label for="startDate">희망 입실날짜</label>
				        </div>
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_land</i>
							<input id="endDate" name="endDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160217" maxlength="6">
							<label for="endDate">퇴실날짜</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
						<div class="input-field col s8">
							<i class="material-icons prefix">card_giftcard</i>
							<input id="product" name="product" type="text" class="validate" placeholder="프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요 - 100자이내">	
							<label for="product">신청상품(프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요) - 100자이내</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="password" name="password" type="password" class="validate" placeholder="4자리만 입력가능" maxlength="4">
							<label for="password">Password</label>
						</div>
					</div>
				</td></tr>
				<tr><td style="text-align:center">
					<div class="row">
						<a href="#" onClick="submit(); return false;" class="waves-effect waves-light btn" style="width:100%">문의</a>
					</div>
				</td></tr>
			</table>
		</form>
	</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
