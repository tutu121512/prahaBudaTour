<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   $(document).ready(function(){
	    $('.materialboxed').materialbox();
	  });
   </script>
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
			    <td width="10%"><c:if test="${list.boardImg1 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg1}'/>"/>
				${fn:split(fn:substring(list.boardImg1,33,fn:length(list.boardImg1)),'.')[0]}
				</c:if></td>
			    <td width="10%"><c:if test="${list.boardImg2 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg2}'/>"/>
				${fn:split(fn:substring(list.boardImg2,33,fn:length(list.boardImg2)),'.')[0]}
				</c:if></td>
				<td width="10%"><c:if test="${list.boardImg3 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg3}'/>"/>
				${fn:split(fn:substring(list.boardImg3,33,fn:length(list.boardImg3)),'.')[0]}
				</c:if></td>
			    </tr>
			    
			    <tr>
			    <td width="10%"><c:if test="${list.boardImg4 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg4}'/>"/>
				${fn:split(fn:substring(list.boardImg4,33,fn:length(list.boardImg4)),'.')[0]}
				</c:if></td>
				<td width="10%"><c:if test="${list.boardImg5 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg5}'/>"/>
				${fn:split(fn:substring(list.boardImg5,33,fn:length(list.boardImg5)),'.')[0]}
				</c:if></td>
				<td width="10%"><c:if test="${list.boardImg6 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${list.boardImg6}'/>"/>
				${fn:split(fn:substring(list.boardImg6,33,fn:length(list.boardImg6)),'.')[0]}
				</c:if></td>
				</tr>
			   	
			   	<tr>
			    <td width="10%"><c:if test="${list.boardImg7 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${list.boardImg7}'/>"/>
				${fn:split(fn:substring(list.boardImg7,33,fn:length(list.boardImg7)),'.')[0]}
				</c:if></td>
				<td width="10%"><c:if test="${list.boardImg8 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${list.boardImg8}'/>"/>
				${fn:split(fn:substring(list.boardImg8,33,fn:length(list.boardImg8)),'.')[0]}
				</c:if></td>
				<td width="10%"><c:if test="${list.boardImg9 != 'null'}">
				<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${list.boardImg9}'/>"/>
				${fn:split(fn:substring(list.boardImg9,33,fn:length(list.boardImg9)),'.')[0]}
				</c:if></td>
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
