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
<!DOCTYPE html>
<html>
	<head>
	<title>♥PRAHA 즐겨찾기에 오신것을 환영합니다.♥</title>
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
	<script>
	$(document).ready(function(){
	      $('.carousel').carousel();
	    });
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
		<%for(int i=0; i<5; i++){ %>
		<tr style="cursor: pointer" onclick="location.href='/controller/notice/praha/noticeView?boardNo=<%=notice.get(i).getBoardNo()%>'"><td><%=notice.get(i).getTitle() %></td></tr>
			<%} %>
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
		<%for(int i=0; i<5; i++){ %>
		<tr style="cursor: pointer" onclick="location.href='/controller/userBenefit/praha/userBenefitBoard'"><td><%=userBenefit.get(i).getTitle() %></td></tr>
			<%} %>
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
		<%for(int i=0; i<5; i++){ %>
		<tr style="cursor: pointer;" onclick="location.href='/controller/tourInfo/tourInfoSelect'"><td><%=tourInfo.get(i).getTitle() %></td></tr>
			<%} %>
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