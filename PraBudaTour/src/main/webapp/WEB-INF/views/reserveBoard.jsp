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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<main>
	<div class="container">
		<table class="striped" id="userManageList">
	<thead>
		<tr>
			<th data-field="email">제목</th>
			<th data-field="nickName">작성자</th>
			<th data-field="phone">작성일자</th>
			<th data-field="phone">비밀번호</th>
			<th data-field="cashPoint">T 잔액</th>
			<th data-field="level">레벨</th>
			<th data-field="name">이름</th>
			<th data-field="gender">성별</th>
			<th data-field="birthDate">생년월일</th>
			<th data-field="userState">계정처리</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${reserveSelectList}" var="list">
	<tr>
		<th>${list.title}</th>
		<th>${list.writer}</th>
		<th>${list.boardDate}</th>  
	</tr>
	</c:forEach>	
	</tbody>
	
	<tbody>
		<tr>
			<th data-field="userState"><input type="button" value="글쓰기"></th>
		</tr>
	</tbody>
	
</table>
	</div>
</main>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
