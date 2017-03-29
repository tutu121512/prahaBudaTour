<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	List<BoardDTO> notice = (List<BoardDTO>)request.getAttribute("noticetList");
	List<BoardDTO> userBenefit = (List<BoardDTO>)request.getAttribute("userBenefitList");
	List<BoardDTO> review = (List<BoardDTO>)request.getAttribute("reviewList");
	List<BoardDTO> tourInfo = (List<BoardDTO>)request.getAttribute("tourInfoList");
%>
<!DOCTYPE>
<html>
	<head>
	<title>♥PRAHA 즐겨찾기에 오신것을 환영합니다.♥</title>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
		

		<!-- Compiled and minified CSS -->
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/css/materialize.min.css"> -->


          

		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
	<style>
/*@media (min-width:769px){
	body{ background:#663;}
}*/
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
	<!-- <script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script> -->
	  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
	<script>
	$(document).ready(function(){
	      $('.carousel').carousel();  
	});
	
	if(!checkPoupCookie("close20150406")){
	    var popUrl ="/controller/praha/popup";
	  	var popOption = "width=403, height=482,scrollbars=no,toolbar=no,location=no,directories=no,top=100,left=100,resizable=no";    //팝업창 옵션(optoin)
		<% Object obj = request.getAttribute("popup");
		if(obj!=null){%>
			window.open(popUrl,"",popOption);
		<% } %>

	}
	
	function checkPoupCookie(cookieName){
		var cookie = document.cookie;
		// 현재 쿠키가 존재할 경우
		if(cookie.length > 0){
		// 자식창에서 set해준 쿠키명이 존재하는지 검색
			startIndex = cookie.indexOf(cookieName);
		// 존재한다면
		if(startIndex != -1){
			return true;
		}else{
			return false; // 쿠키 내에 해당 쿠키가 존재하지 않을 경우
		};
			}else{
			return false;	// 쿠키 자체가 없을 경우
			};
	}

	</script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<main>
		<div class="container">
		<div class="row">
		<table class="centered"><tr><td class="centered">
		<div class="carousel">
		    <a class="carousel-item" href="#one!"><img src='<c:url value="/resources/images/1.jpg"/>'></a>
		    <a class="carousel-item" href="#two!"><img src='<c:url value="/resources/images/2.jpg"/>'></a>
		    <a class="carousel-item" href="#three!"><img src='<c:url value="/resources/images/3.jpg"/>'></a>
		    <a class="carousel-item" href="#four!"><img src='<c:url value="/resources/images/4.jpg"/>'></a>
		    <a class="carousel-item" href="#five!"><img src='<c:url value="/resources/images/5.jpg"/>'></a>
		    <a class="carousel-item" href="#four!"><img src='<c:url value="/resources/images/6.jpg"/>'></a>
		    <a class="carousel-item" href="#five!"><img src='<c:url value="/resources/images/7.jpg"/>'></a>
		    <a class="carousel-item" href="#four!"><img src='<c:url value="/resources/images/8.jpg"/>'></a>
		</div>
		</td></tr></table>
	</div>
		
		<table>
		
		<tr><td colspan="3">
		<div class="col s12">
		<table class="striped centered bordered" >
		<tr><td style="background-color:firebrick;color:aliceblue;font-size:25px;padding:2px;">공지사항
		<i class="material-icons prefix" style="cursor:pointer;float:right;padding-top:6px;padding-right:7px;margin-left:-30px;" onclick='location.href="/controller/notice/praha/noticeBoard"'">&#xE145;</i>
		</td></tr>
		<%if(notice.isEmpty()){ %>
		<tr><td> 게시글이 없습니다.</td></tr>		
		<%}else{ %>
		<%for(int i=0; i<notice.size(); i++){ %>
		<tr style="cursor: pointer" onclick="location.href='/controller/notice/praha/noticeView?boardNo=<%=notice.get(i).getBoardNo()%>'"><td><%=notice.get(i).getTitle() %></td></tr>
			<% if(i==4) break; } %>
		<%} %>
		</table>
		</div></tr>

		<tr><td>
		<div class="row">
		<div class="col s4">
		<table class="striped centered bordered" >
		<tr><td style="background-color:#cc3825;color:aliceblue;font-size:25px;padding:2px;">이용혜택
		<i class="material-icons prefix" style="cursor:pointer; float:right;padding-top:6px;padding-right:7px;margin-left:-30px;" onclick='location.href="/controller/userBenefit/praha/userBenefitBoard"'>&#xE145;</i>
		</td></tr>
		<%if(userBenefit.isEmpty()){ %>
		<tr><td> 게시글이 없습니다.</td></tr>		
		<%}else{ %>
		<%for(int i=0; i<userBenefit.size(); i++){ %>
		<tr style="cursor: pointer" onclick="location.href='/controller/userBenefit/praha/userBenefitBoard'"><td><%=userBenefit.get(i).getTitle() %></td></tr>
			<% if(i==4) break; } %>
		<%} %>
		</table>
		</div>
		
		<div class="col s4">
		<table class="striped centered bordered" >
		<tr><td style="background-color:#cc3825;color:aliceblue;font-size:25px;padding:2px;">여행정보
		<i class="material-icons prefix" style="cursor:pointer; float:right;padding-top:6px;padding-right:7px;margin-left:-30px;"  onclick='location.href="/controller/tourInfo/tourInfoSelect"'>&#xE145;</i>
		</td></tr>
		<%if(tourInfo.isEmpty()){ %>
		<tr><td> 게시글이 없습니다.</td></tr>		
		<%}else{ %>
		<%for(int i=0; i<tourInfo.size(); i++){ %>
		<tr style="cursor: pointer;" onclick="location.href='/controller/tourInfo/tourInfoSelect'"><td><%=tourInfo.get(i).getTitle() %></td></tr>
			<% if(i==4) break; } %>
		<%} %>
		</table>
		</div>
		
		<div class="col s4">
		<table class="striped centered bordered" >
		<tr style="cursor: pointer;" onclick="location.href='/controller/praha/prahaRoomInfo/publicRoom'"><td style="background-color:chocolate;color:aliceblue;font-size:25px;padding:2px;">둘러 보러 가기 !!
		</td></tr>
		<tr><td> </td></tr>
		<tr style="cursor: pointer;" onclick="location.href='/controller/praha/reserveBoard'"><td style="background-color:chocolate;color:aliceblue;font-size:25px;padding:2px;">예약 문의 하러 가기 !!
		</td></tr>
		<tr><td> </td></tr>
		<tr style="cursor: pointer;" onclick="location.href='/controller/shuttle/praha/shuttleBoard'"><td style="background-color:chocolate;color:aliceblue;font-size:25px;padding:2px;">셔틀 문의 하러 가기 !!
		</td></tr>
		<tr><td> </td></tr>
		<tr style="cursor: pointer;" onclick="location.href='/controller/review/praha/reviewBoard'"><td style="background-color:chocolate;color:aliceblue;font-size:25px;padding:2px;">즐거운 후기 미리보기 !!
		</td></tr>
		</table>
		</div>
		</div>
		</td></tr>
		</table>
		
	</div> <!-- container -->
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
	</body>
</html>