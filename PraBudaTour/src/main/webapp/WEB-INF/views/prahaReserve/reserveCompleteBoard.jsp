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
	<!--Import jQuery before materialize.js-->
   <script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
   <script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
   <script type="text/javascript">
	  $(function(){
		 var page = '#page'+<%=pVO.getCurPage()%>;
		  	$(page).removeClass();
		  	$(page).addClass("active");
	  });
   </script>
	</head>
	<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notebook.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reviewLogo.jpg"/>'> 나 예약확정이야 바꿔쥬
	</div>
		<table class="striped centered" id="userManageList" style="margin-top: 20px;">
	<thead>
		<tr style="padding:0px;background-color:darksalmon;font-size:18px">
			<th data-field=num" style="width:8%">글번호</th>
			<th data-field="email">제목</th>
			<th data-field="nickName" style="width:13%">작성자</th>
			<th data-field="phone" style="width:12%">작성일자</th>
			<th style="width:15%">비고</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${CompleteList}" var="list">
	<tr>
		<td>${list.boardNo }</td>
		<td style="cursor: pointer"><a href="/controller/complete/praha/reserveCompleteView?boardNo=${list.boardNo}">${list.reserveName} 님의 예약이 확정되었습니다.</a></td>
		<td>관리자</td>
		<td>${list.boardDate}</td> 
		<td></td> 
	</tr>
	</c:forEach>	

<!-- ############################### ##################################### -->	
	<tr>
	<td colspan="5" style="padding:0px;background-color:darksalmon;">
	  <ul class="pagination">
		<li class="page-item">
			<a href="/controller/complete/praha/completeBoard?page=<%=pVO.getPreviPage()%>">
		    <i class="material-icons">chevron_left</i>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	    <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/complete/praha/completeBoard?page=<%=i%>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
			<a href="/controller/complete/praha/completeBoard?page=<%=pVO.getNextPage()%>">
		    <i class="material-icons">chevron_right</i>
	      </a>
	    </li>
	  </ul>
	</td>
	</tr>
	</tbody>
	
</table>
	</div>
</main>

<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
