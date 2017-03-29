<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO qpVO = (PageDTO)request.getAttribute("Qpage");
	PageDTO cpVO = (PageDTO)request.getAttribute("Cpage");
%>
<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
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
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	
	<script type="text/javascript">
		$(".completeDeleteBtn").click(function(){
			var result = confirm('이 글을 삭제 하시겠습니까?');
			
			if(result) { 
				alert("삭제되었습니다.");
				location.href="/controller/complete/praha/CompleteDelete?boardNo="+$(this).attr("id");				
				}
		
		});
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>
	  <div class="container">
	  <table style="margin-top:30px"><tr><td>
		<h2 style="padding-top:10px;margin:0px;padding-left:40px;">예약확정 등록</h2>
	  </td></tr></table>
		<form method="post" action="/controller/complete/praha/CompleteInsert">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate" placeholder=" ">
							<label for="title">게시글 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="reserveName" name="reserveName" type="text" class="validate" placeholder=" ">
							<label for="writer">게시글 작성자명</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_takeoff</i>
							<input id="startDate" name="startDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160213">
							<label for="startDate">희망 입실날짜</label>
				        </div>
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_land</i>
							<input id="endDate" name="endDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160217">
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
				<tr><td>
					<div class="row">
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="peopleNumber" name="peopleNumber" type="text" class="validate" placeholder="인원수" maxlength="4" value='0'>
							<label for="peopleNumber">인원수</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="price" name="price" type="text" class="validate" placeholder="금액">
							<label for="price">금액</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="roomName" name="roomName" type="text" class="validate" placeholder="방이름">
							<label for="roomName">방이름</label>
						</div>
					</div>
				</td>
				</tr>				
				<tr><td style="text-align:center">
				<input type="submit" value="확정하기" class="waves-effect waves-light btn" style="width:100%">
				</td></tr>
			</table>
			<input type="hidden" name="boardNo" id="boardNo" value="">
			<input type="hidden" name="reserveBoardNo" id="reserveBoardNo" value="">
		</form>
		
	  </div>	<!-- container -->
	
	
	</main>
	</body>
</html>