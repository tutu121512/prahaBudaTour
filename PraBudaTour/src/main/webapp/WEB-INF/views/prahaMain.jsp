<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	List<BoardDTO> review = (List<BoardDTO>)request.getAttribute("reviewList");
	List<BoardDTO> reserve = (List<BoardDTO>)request.getAttribute("reserveList");
	List<BoardDTO> notice = (List<BoardDTO>)request.getAttribute("noticetList");
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
	<script>
	$(document).ready(function(){
	      $('.carousel').carousel();
	    });
	</script>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
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
		
	<div class="row"> 
	
	<table class="striped" style="width: 30%;  float: right;  margin-left: 50px; height: 150px;">
		<tr><td>후기 <a style="float: right; margin-right: 10px;" href="/controller/review/praha/reviewBoard">더 보기</a></td></tr>
		<%for(int i=0; i<review.size(); i++) { 
		if(i<5){%>
		<tr><td style="font-size: 12px; padding: 10px;"><a href="/controller/review/praha/reviewPasswordCheck?boardNo=<%=review.get(i).getBoardNo()%>"><div><%=review.get(i).getTitle()%><div></div></a></td></tr>
		<%
		}else{ 
			break;
		}
		} %>
	</table>

	<table class="striped" style="width: 30%; float :right; height: 150px;">
		<tr><td>예약 문의<a style="float: right; margin-right: 10px;" href="#">더 보기</a></td></tr>
		<%for(int i=0; i<reserve.size(); i++) { 
		if(i<5){%>
		<tr><td style="font-size: 12px;  padding: 10px;"><%= reserve.get(i).getTitle() %></td></tr>
		<%
		}else{ 
			break;
		}
		} %>
	</table>
		
	<%-- 
	<table class="striped" style="width: 30%; height: 150px;">
		<tr><td>공지사항<a style="float: right; margin-right: 10px;" href="#">더 보기</a></td></tr>
		<%for(int i=0; i<notice.size(); i++) { 
		if(i<5){ %>
		<tr><td style="font-size: 12px;  padding: 10px;"><%= notice.get(i).getTitle()%></td></tr>	
		<%}else{ 
				break;
			}
		} %>
	</table> 
	--%>
	
	
	</div> <!-- container -->
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</body>
</html>