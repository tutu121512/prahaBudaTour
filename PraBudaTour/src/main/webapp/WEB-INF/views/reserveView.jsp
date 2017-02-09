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
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<script type="text/javascript">
	$(function(){		
	$("#updateComplete").hide();
	$("#delete").click(function(){
		var result = confirm('이 글을 삭제 하시겠습니까?');
		
		if(result) { 
			alert("삭제되었습니다.");
			location.href="/controller/praha/prahaReserveDelete?boardNo="+$("#boardNo").val()
		}
	
	});
	
	$("#update").click(function(){
		
		var result = confirm('이 글을 수정 하시겠습니까?');
		
		if(result) { 
		$(".updateform").removeAttr("disabled");
		$(this).hide();
		$("#updateComplete").show();
		}
	});
	
	
	});
	</script>	    
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<form method="post" action="/controller/praha/prahaReserveUpdate">
			<div id="main_content" style="margin-top: 16px;">
				<div style="height:148px">
			
				<textArea style="margin-left:10px; float:left; height:90%; width:50%" name="content" disabled="disabled" class="updateform"
				placeholder="문의 내용을 입력해주세요. 카카오톡 ID를 남겨주시면 연락이 편합니다.">${reserveViewInfo.content}</textArea>
				<input type="submit" style="height: 150px;margin: 10px 0px 0px 10px; width: 70px;">
			
				</div>
				
			<input type="text" placeholder="writer 이름" name="writer" value="${reserveViewInfo.writer}" disabled="disabled"  class="updateform">
			<input type="text" placeholder="title 입력" name="title" value="${reserveViewInfo.title}" disabled="disabled"  class="updateform" >
			<input type="password" placeholder="password 입력" name="password" value="${reserveViewInfo.password}" disabled="disabled"  class="updateform">
			<input type="text" placeholder="phone 입력" name="phone" value="${reserveViewInfo.phone}" disabled="disabled"  class="updateform" >
			<input type="text" placeholder="KakaoID 입력" name="kakaoId" value="${reserveViewInfo.kakaoId}" disabled="disabled"  class="updateform" >
			<input type="hidden" name="boardNo" id="boardNo" value="${reserveViewInfo.boardNo}">
				
			<input type="button" value="목록보기" id="list" >
			<input type="button" value="삭제" id="delete">
			<input type="button" value="수정" id="update">
			<input type="submit" value="완료" id="updateComplete">
			</div>
		</form>
		</div>
		
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
