<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% BoardDTO bto = (BoardDTO)request.getAttribute("reviewViewInfo"); %>
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
				location.href="/controller/review/praha/reviewDelete?boardNo="+$("#boardNo").val()
			}											
		});
		
		$("#update").click(function(){
			var result = confirm('이 글을 수정 하시겠습니까?');
			
			if(result) { 
				$(".updateform").removeAttr("readonly");
				$("#icon_prefix2").contents().unwrap().wrap('<textarea class="materialize-textarea"></textarea>');
				$(this).parent().hide();
				$("#update").hide();
				$("#updateComplete").parent().show();
				$("#updateComplete").show();
				
			}
		});
	
		$("#list").click(function(){
			location.href="/controller/review/praha/reviewBoard";
		});
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container" style="margin-bottom:15px">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notebook.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reviewLogo.jpg"/>'>
		</div>

		<form method="post" action="/controller/review/praha/ReviewUpdate">
		<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate updateform" readonly="readonly" value="${reviewViewInfo.title}"style="font-size: 30px;text-align: center;color: black;">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate updateform" readonly="readonly" value="${reviewViewInfo.writer}" >
							<label for="writer">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-top:-20px;margin-bottom:-15px">
				        <div class="input-field col s12">
				        <i class="material-icons prefix">mode_edit</i>
					        <pre id="icon_prefix2" class="materialize-textarea updateform" name="content" 
					         readonly="readonly" style="color:black; font-size:1.4em;margin-left:45px;margin-top:0px">${reviewViewInfo.content}</pre>
				        </div>
			    	</div>
				</td></tr>
				<tr><td>
				<div class="row">
						<div>
						<c:if test="${reviewViewInfo.boardImg0 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg0}'/>"/>
						</div>
						</c:if>
				
						<c:if test="${reviewViewInfo.boardImg1 != 'null'}">
						 <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg1}'/>"/>
						</div>
						</c:if>
				
						<c:if test="${reviewViewInfo.boardImg2 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg2}'/>"/>
						</div>
						</c:if>

						<c:if test="${reviewViewInfo.boardImg3 != 'null'}">
			                 <div class="input-field col s12" style="text-align:center">
			                <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg3}'/>"/>
						</div>
						</c:if>
					
						<c:if test="${reviewViewInfo.boardImg4 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg4}'/>"/>
						</div>
						</c:if>
						
						<c:if test="${reviewViewInfo.boardImg5 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg5}'/>"/>
						</div>
						</c:if>
						
						<c:if test="${reviewViewInfo.boardImg6 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg6}'/>"/>
						</div>
						</c:if>
						
						<c:if test="${reviewViewInfo.boardImg7 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg7}'/>"/>
						</div>
						</c:if>
						
						<c:if test="${reviewViewInfo.boardImg8 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg8}'/>"/>
						</div>
						</c:if>
						
						<c:if test="${reviewViewInfo.boardImg9 != 'null'}">
					         <div class="input-field col s12" style="text-align:center">
					        <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg9}'/>"/>
						</div>
						</c:if>					
					
					
						</div>
			    	</div>
			    	</div>
				</td></tr>
				<tr><td>
				<div class="row">
					<input type="hidden" id="boardNo" name="boardNo" value="${reviewViewInfo.boardNo}">
					<input class="waves-effect waves-light btn" type="button" value="목록보기" id="list" >
					<input class="waves-effect waves-light btn" type="button" value="삭제" id="delete">
					<input class="waves-effect waves-light btn" type="button" value="수정" id="update">
					<input class="waves-effect waves-light btn" type="submit" value="완료" id="updateComplete">
				</div>	<!--  button -->
			</td></tr>
			</table>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
