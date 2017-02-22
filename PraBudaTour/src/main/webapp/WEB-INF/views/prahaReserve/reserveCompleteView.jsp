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
		var preheight = $("#icon_prefix2").height();
		$("#delete").click(function(){
			var result = confirm('이 글을 삭제 하시겠습니까?');
			if(result) { 
				alert("삭제되었습니다.");
				location.href="/controller/review/praha/reviewDelete?boardNo="+$("#boardNo").val()
			}											
		});
		
		$("#update").click(function(){
			var result = confirm('이 글을 수정 하시겠습니까?');
			var str ='<div class="input-field col s4" style="margin-bottom:-20px; width: 20%;">'
				str +='<i class="material-icons prefix">security</i>'
				str +='<input id="password" name="password" type="password" class="validate" placeholder="4자리만 입력가능" maxlength="4">'
				str +='<label for="password">Password</label>'
				str +='</div>'
			if(result) { 
				$(".updateform").removeAttr("readonly");
				$("#icon_prefix2").contents().unwrap().wrap('<textarea id="icon_prefix2" class="materialize-textarea updateform" name="content" style="color:black; font-size:1.4em;margin-left:45px;margin-top:0px"></textarea>');
				$("#icon_prefix2").css("height",preheight);
				$(this).parent().hide();
				$("#pass").append(str);
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
	
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container" style="margin-bottom:15px">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notebook.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reviewLogo.jpg"/>'>
		</div>
			
			
		
		<table>
		<tr>
		<td><h5>제목 : ${completeView.title} </h5></td>
		<td>${completeView.boardDate}</td>
		</tr>
		<tr><td colspan="2"><hr style="margin-bottom:2px;"></tr>
		<tr>
		<td><pre>${completeView.reserveName} 님
즐겨찾기 게스트하우스에 관심가져 주셔서 감사합니다.
문의 하신 ${completeView.startDate} ${completeView.endDate} 예약확정 되셨습니다.
예약사항을 확인하시고 변경사항이 있으시면 언제든지 카톡남겨주시기 바랍니다.
아름다운 프라하에서 즐겨찾기와 함께 행복한 시간이 되기를 바랍니다 ^^
		</pre></td>
		<td><img style="padding-left:22%" src="<c:url value='/resources/images/favicon.png'/>"></td>		
		</tr>
		</table>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
