<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="prahaBuda.tour.dto.*" %>

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
		 $("tbody tr[name='board']").click(function(){
			$(".password").css("display","none");	 	 
			$(this).find(".password").css("display","block");
		 });

	  });
   </script>
	</head>
	<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<main>
	<div class="container">
		<table class="striped centered" id="userManageList" style="margin-top: 20px;">
	<thead>
		<tr>
			<th data-field=num">글번호</th>
			<th data-field="email">제목</th>
			<th data-field="nickName">작성자</th>
			<th data-field="phone">작성일자</th>
			<th>비고</th>
		</tr>
	</thead>
	
	<tbody>
	
	<% for(int i =0; i<10; i++){%>
	<tr name="board" style="cursor: pointer">
	<td>No</td>
	<td>Title</td>	
	<td>Writer</td>
	<td>Date</td>
	<td style="width:180px;">
			<div class="password" style="display: none; padding: 0px; margin: 0px;">
			<form action="/controller/praha/prahaReservePasswordCheck" method="post">
			<input type="hidden" name="boardNo" value="<%=i%>">
			<input type="password" name="password" maxlength="4" placeholder="비밀번호 4자리" style="width:100px; margin: 0; height: 20px; padding-right: 10px;"/> 
			<input type="submit" value="보기">
			</form>
			</div>
		</td>
	</tr>
	<% } %>
	
<!-- ############################### ##################################### -->	
	<tr>
	<td colspan="5">
	<nav aria-label="..." style="padding-left: 350px;">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="/controller/praha/reserveBoard?page=1" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=1; i<=5; i++) {%>
	    <li class="page-item"><a class="page-link" href="/controller/praha/reserveBoard?page=<%=i%>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href="/controller/praha/reserveBoard?page=5" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</td>
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
