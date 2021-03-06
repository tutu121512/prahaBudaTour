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
	    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0"/>-->
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
	<!--<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>

	<script type="text/javascript">
	$(function(){		
	$("#updateComplete").hide();
	var preheight = $("#icon_prefix2").height();
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
			$(".updateform").removeAttr("readonly");
			$("#icon_prefix2").contents().unwrap().wrap('<textarea id="icon_prefix2" class="materialize-textarea updateform" name="content" style="color:black; font-size:1.4em;margin-left:45px;margin-top:0px"></textarea>');
			$("#icon_prefix2").css("height",preheight);
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
	
	function submit()
    {
    document.getElementById("reserveForm").submit();
    }
	</script>
	
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
	<div class="container" style="margin-bottom:15px">
		<div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		
		<form id="reserveForm" method="post" action="/controller/praha/prahaReserveUpdate">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate updateform" readonly="readonly" value="${reserveViewInfo.title}"style="font-size: 30px;text-align: center;color: black;">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate updateform" readonly="readonly" value="${reserveViewInfo.writer}" >
							<label for="writer">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-top:-20px;margin-bottom:-15px">
				        <div class="input-field col s12">
				        <i class="material-icons prefix">mode_edit</i>
					        <pre id="icon_prefix2" class="materialize-textarea updateform" name="content" 
					         readonly="readonly" style="color:black; font-size:1.4em;margin-left:45px;margin-top:0px">${reserveViewInfo.content}</pre>
				        </div>
			    	</div>
				</td></tr>
				<tr><td>
					<div class="row">
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_takeoff</i>
							<input id="statrDate" name="startDate" type="text" class="validate updateform" readonly="readonly" placeholder="입력예시 : 17년 2월 17일 => 160213" value="${reserveViewInfo.startDate}">
							<label for="statrDate">입실날짜</label>
				        </div>
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_land</i>
							<input id="endDate" name="endDate" type="text" class="validate updateform" readonly="readonly" placeholder="입력예시 : 17년 2월 17일 => 160217" value="${reserveViewInfo.endDate}" }>
							<label for="endDate">퇴실날짜</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
						<div class="input-field col s8">
							<i class="material-icons prefix">card_giftcard</i>
							<input id="product" name="product" type="text" class="validate updateform" readonly="readonly" placeholder="프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요 - 100자이내" value="${reserveViewInfo.product}">	
							<label for="product">신청상품(프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요) - 100자이내</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="password" name="password" type="password" class="validate updateform" readonly="readonly" placeholder="비밀번호 입력" value="${reserveViewInfo.password}">
							<label for="password">Password</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
				<div class="row">
				<hr style="margin-bottom:10px;">
				<div>
				<ins>댓글</ins>
				</div>
					<div class="col s12" style="background-color: blanchedalmond; border-radius: 30px; margin-bottom: 10px;" >
						<c:choose>
						<c:when test="${reserveViewInfo.boardReply eq null}">
						<table class="centered"><tr><td class="centered">
							<img src='<c:url value="/resources/images/noComment.png"/>' style="border-radius:15px;padding-top:8px;width: 50%;">
						</td></tr></table>
						</c:when>
						<c:otherwise>
							<table>
							<tr>
							<td><img src="<c:url value='/resources/images/adminLogo.png'/>"></td>
							<td><pre style="white-space:pre-wrap; border: none; height: auto">${reserveViewInfo.boardReply}</pre></td>
							</tr>
							</table>
						</c:otherwise>
						</c:choose>
					</div><!-- 댓글 -->
				<hr>
				</div>
				</td></tr>
				<tr><td >
				<div class="row">
					<input type="hidden" id="boardNo" name="boardNo" value="${reserveViewInfo.boardNo}">
					<a class="waves-effect waves-light btn" type="button" id="list" >목록보기</a>
					<a class="waves-effect waves-light btn" type="button" id="delete">삭제</a>
					<a class="waves-effect waves-light btn" type="button" id="update">수정</a>
					<a class="waves-effect waves-light btn" href="#" onClick="submit(); return false;" id="updateComplete">완료</a>
				</div>	<!--  button -->
			</td></tr>
			</table>
		</form>
	</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
</body>
