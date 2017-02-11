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
			location.href="/controller/shuttle/praha/ShuttleDelete?boardNo="+$("#boardNo").val()
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
	
	$("#list").click(function(){
		location.href="/controller/shuttle/praha/shuttleBoard";
	});
	
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		<form method="post" action="/controller/shuttle/praha/ShuttleUpdate">
			<div id="main_content" style="margin-top: 16px;">
				<div class="row" style="margin-left:12%;margin-top:-25px">
			        <div class="input-field col s7" style="margin-bottom:-20px">
			          <input id="title" name="title" type="text" class="validate" disabled="disabled" value="${shuttleViewInfo.title}">
			          <label for="title">문의 제목</label>
			        </div>
					<div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="writer" name="writer" type="text" class="validate" disabled="disabled" value="${shuttleViewInfo.writer}">
			          <label for="writer">작성자</label>
			        </div>
			    </div>
				<div class="row" style="margin-left:12%">
			    <form class="col s12">
					<div class="row" >
				        <div class="input-field col s10">
					        <i class="material-icons prefix">mode_edit</i>
					        <textarea id="icon_prefix2" class="materialize-textarea" name="content" 
					        placeholder="카카오톡 ID를 남겨주시면 연락이 편합니다.">${shuttleViewInfo.content} </textarea>
					        <label for="icon_prefix2">문의 내용 (입력창이 자동으로 늘어납니다.)</label>
				        </div>
			    	</div>
			    </form>
				</div>
				<div class="row" style="margin-left:12%;margin-top:-40px">
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="password" name="password" type="password" disabled="disabled" class="validate">
			          <label for="password">Password</label>
			        </div>
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="phone" name="phone" type="text" class="validate" disabled="disabled" value="${shuttleViewInfo.phone}">
			          <label for="phone">전화번호</label>
			        </div>
			        <div class="input-field col s3">
			          <input id="kakaoId" name="kakaoId" type="text" class="validate" disabled="disabled" value="${shuttleViewInfo.kakaoId}">
			          <label for="kakaoId">카카오톡 아이디</label>
			        </div>
				</div>
				
			<input class="waves-effect waves-light btn" type="button" value="목록보기" id="list" >
			<input class="waves-effect waves-light btn" type="button" value="삭제" id="delete">
			<input class="waves-effect waves-light btn" type="button" value="수정" id="update">
			<input class="waves-effect waves-light btn" type="submit" value="완료" id="updateComplete">
			
			</div>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
