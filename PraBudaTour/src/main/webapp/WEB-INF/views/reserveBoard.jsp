<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="prahaBuda.tour.dto.*" %>

<%
	//페이징 클래스 받아오기
	PageDTO pVO = (PageDTO)request.getAttribute("page");

%>
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
   
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<main>
	<div class="container">
		<table class="striped" id="userManageList">
	<thead>
		<tr>
			<th data-field=num">글번호</th>
			<th data-field="email">제목</th>
			<th data-field="nickName">작성자</th>
			<th data-field="phone">작성일자</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${reserveSelectList}" var="list">
	<tr>
		<th>${list.boardNo}</th>
		<th>${list.title}</th>
		<th>${list.writer}</th>
		<th>${list.boardDate}</th>  
	</tr>
	</c:forEach>	

<!-- ############################### ##################################### -->	
	<tr align="center">
	<th colspan="4">
	<nav aria-label="..."  align="center">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="/controller/praha/reserveBoard?page=<%=pVO.getPreviPage()%>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	    <li class="page-item"><a class="page-link" href="/controller/praha/reserveBoard?page=<%=i%>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href="/controller/praha/reserveBoard?page=<%=pVO.getNextPage()%>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</th>
	</tr>
	</tbody>
	
	<tbody>
		<tr>
			<th data-field="userState"><a href="/controller/praha/reserveInsertForm"><input type="button" value="글쓰기"></a></th>
		</tr>
	</tbody>
	
</table>
	</div>
</main>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
