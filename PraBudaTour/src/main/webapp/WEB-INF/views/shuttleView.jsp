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
	var preheight = $("#icon_prefix2").height();

	$("#delete").click(function(){
		var result = confirm('이 글을 삭제 하시겠습니까?');
		
		if(result) { 
			alert("삭제되었습니다.");
			location.href="/controller/shuttle/praha/shuttleDelete?boardNo="+$("#boardNo").val()
		}
	
	});
	
	$("#update").click(function(){
		
		var result = confirm('이 글을 수정 하시겠습니까?');
		
		if(result) { 
			$("#title").removeAttr("style");
			$(".updateform").removeAttr("readonly");
			$("#icon_prefix2").contents().unwrap().wrap('<textarea id="icon_prefix2" class="materialize-textarea updateform" name="content" "></textarea>');
			$("#icon_prefix2").css("height",preheight-200);
			$(this).parent().hide();
			$("#update").hide();
			$("#updateComplete").parent().show();
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
		<div class="container" style="margin-bottom:15px">
		<div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/shuttle.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/shuttleLogo.jpg"/>'>
		</div>
		<form method="post" action="/controller/shuttle/praha/shuttleUpdate">
			<div id="main_content" style="margin-top: 16px;">
				<div class="row">
			        <div class="input-field col s8" style="margin-bottom:-20px">
			        <i class="material-icons prefix">title</i>
			          <input id="title" name="title" type="text" class="validate updateform"  readonly="readonly" value="${shuttleViewInfo.title}" style="color:red;text-align:center;font-size:27px">
			          <label for="title">문의 제목</label>
			        </div>
					<div class="input-field col s4" style="margin-bottom:-20px">
					<i class="material-icons prefix">supervisor_account</i>
			          <input id="writer" name="writer" type="text" class="validate updateform"  readonly="readonly" value="${shuttleViewInfo.writer}" style="color:black;font-size:18px">
			          <label for="writer">작성자</label>
			        </div>
			    </div>
				<div class="row" >
					<div class="row" style="margin-top:-20px;margin-bottom:30px">
				        <div class="input-field col s12" style="margin-left: 16px;">
				        <i class="material-icons">mode_edit</i>
					        <pre id="icon_prefix2" class="materialize-textarea updateform" name="content" 
					         readonly="readonly" style="color:black; font-size:1.4em">${shuttleViewInfo.content}</pre>
				        </div>
			    	</div>
				</div>
				
				<div class='row' id="password">
					<div class='input-field col s4' style='margin-bottom:-20px'>
						<i class='material-icons prefix'>security</i>
						<input id='password' name='password' type='password' readonly="readonly" value="${shuttleViewInfo.password}" class='validate updateform' placeholder='4자리만 입력가능' maxlength='4'>
						<label for='password'>Password</label>
					</div>
				</div>				
		<div class="row">
		<hr style="margin-bottom:10px;">
		<div>
		<ins>댓글</ins>
		</div>
			<div class="col s12" style="background-color: blanchedalmond; border-radius: 30px; margin-bottom: 10px;" >
				<c:choose>
				<c:when test="${shuttleViewInfo.boardReply eq null}">
				<table class="centered"><tr><td class="centered">
					<img src='<c:url value="/resources/images/noComment.png"/>' style="border-radius:15px;padding-top:8px;width: 50%;">
				</td></tr></table>
				</c:when>
				<c:otherwise>
					<pre style="border: none; height: auto">${shuttleViewInfo.boardReply}</pre>
				</c:otherwise>
				</c:choose>
			</div><!-- 댓글 -->
		<hr>
		</div>
			<div class="row">
				<input type="hidden" id="boardNo" name="boardNo" value="${shuttleViewInfo.boardNo}">
				<input class="waves-effect waves-light btn" type="button" value="목록보기" id="list" >
				<input class="waves-effect waves-light btn" type="button" value="삭제" id="delete">
				<input class="waves-effect waves-light btn" type="button" value="수정" id="update">
				<input class="waves-effect waves-light btn" type="submit" value="완료" id="updateComplete">
			</div>	<!--  button -->
			
			</div>	<!-- main_content -->
		</form>
		</div>	<!-- container -->
	
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
