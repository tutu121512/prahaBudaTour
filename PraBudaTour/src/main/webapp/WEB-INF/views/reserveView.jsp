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
			$("#icon_prefix2").contents().unwrap().wrap("<textarea class='materialize-textarea' name='content' style='color:black; font-size:22px' ></textarea>");
			$(".updateform").removeAttr("readonly");
			$(this).parent().hide();
			$("#update").hide();
			$("#updateComplete").parent().show();
			$("#updateComplete").show();
		}
	});
	
	$("#list").click(function(){
		location.href="/controller/praha/reserveBoard";
	});
	
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' style="width: 5%;margin-left: 100px;margin-top:20px;margin-bottom:15px">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		<form method="post" action="/controller/praha/prahaReserveUpdate">
			<input type="hidden" id="boardNo" name="boardNo" value="${reserveViewInfo.boardNo}">
			<div id="main_content" style="margin-top: 16px;">
				<div class="row" style="margin-left:12%;margin-top:-10px">
			        <div class="input-field col s7" style="margin-bottom:-20px">
			          <input id="title" name="title" type="text" class="validate updateform"  readonly="readonly" value="${reserveViewInfo.title}" style="color:red;text-align:center;font-size:27px">
			          <label for="title">문의 제목</label>
			        </div>
					<div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="writer" name="writer" type="text" class="validate updateform"  readonly="readonly" value="${reserveViewInfo.writer}" style="color:black;font-size:18px">
			          <label for="writer">작성자</label>
			        </div>
			    </div>
				<div class="row" style="margin-left:12%">
					<div class="row" >
				        <div class="input-field col s10">
					        <pre id="icon_prefix2" class="materialize-textarea updateform" name="content" 
					        readonly="readonly" style="color:black; font-size:22px">${reserveViewInfo.content}</pre>
				        </div>
			    	</div>
				</div>
				<div class="row" style="margin-left:12%;margin-top:-40px">
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="password" name="password" type="password" readonly="readonly" class="validate updateform" value="${reserveViewInfo.password}">
			          <label for="password">Password</label>
			        </div>
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="phone" name="phone" type="text" class="validate updateform"  readonly="readonly" value="${reserveViewInfo.phone}">
			          <label for="phone">전화번호</label>
			        </div>
			        <div class="input-field col s3">
			          <input id="kakaoId" name="kakaoId" type="text" class="validate updateform" readonly="readonly" value="${reserveViewInfo.kakaoId}">
			          <label for="kakaoId">카카오톡 아이디</label>
			        </div>
				</div>
				<div class="row" style="margin-left:55%;margin-top:-10px">
			<input class="waves-effect waves-light btn" type="button" value="목록보기" id="list" >
			<input class="waves-effect waves-light btn" type="button" value="삭제" id="delete">
			<input class="waves-effect waves-light btn" type="button" value="수정" id="update">
			<input class="waves-effect waves-light btn" type="submit" value="완료" id="updateComplete">
			</div>
			</div>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
