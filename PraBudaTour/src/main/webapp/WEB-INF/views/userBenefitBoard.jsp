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
	</head>
	<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top:20px;margin-bottom:15px">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'> 안녕? 나는 이용혜택인데 내 이름좀 만들어주겠니 ?
		</div>

	
		 <ul class="collapsible popout" data-collapsible="accordion">  
		 <c:forEach items="${selectList}" var="list">
			  <li>
			    <div class="collapsible-header">
			    <i class="material-icons">
			    <img width="100%" src="<c:url value='/resources/images/logo.jpg'/>">
			    </i>${list.title}</div>
			    <div class="collapsible-body">
			    <table>
			    <tr>
			    <td rowspan="3" width="70%">${list.content}</td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    
			    <tr>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    
			    <tr>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    
			    </table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
	</div>

</main>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
