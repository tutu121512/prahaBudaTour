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
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/gift.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top:20px;">
			<img src='<c:url value="/resources/images/useServiceLogo.jpg"/>'>
	</div>
	<div>
	 <ul id="ListandView" class="collapsible" data-collapsible="accordion" style="border-style:hidden;box-shadow:none">  
		 <c:forEach items="${selectList}" var="list">
			  <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:burlywood;border-radius:27px;">
			  	<table>
			  	<tbody id="headerContent">
			  	<tr><td style="width:10%;padding-bottom:0px;padding-top:1rem">
			    <img src="<c:url value='${list.boardImg0}'/>" style="max-width:75px">
			    </td><td style="width:85%">
			    <div>${list.title}</div>
			    </td><td>
			    </tbody>
			    </table>
			    </div>
			    
			    
			    <div class="collapsible-body" style="background-color:antiquewhite;border-radius:25px;">
			    <table>
			    <tbody id="bodyContent">
			    <tr>
			    <td rowspan="3" width="70%"><pre>${list.content}</pre></td>
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
			    </tbody>
			    </table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
	</div>
	</div>

</main>

<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
