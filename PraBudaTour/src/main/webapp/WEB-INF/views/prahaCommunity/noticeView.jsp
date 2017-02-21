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
	</head>
	<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notice.png"/>' style="width:5%;margin-left:100px;margin-top:20px;">
			<img src='<c:url value="/resources/images/noticeLogo.jpg"/>'>
		</div>
	
		제목 : 
		<h5>${noticeViewInfo.title} </h5>
		${noticeViewInfo.boardDate} 
		<hr style="margin-bottom:10px;">
		<table>
	    <tbody id="bodyContent">
	    <tr>
	    <td rowspan="3" width="70%"><pre>${noticeViewInfo.content}</pre></td>
	    <td width="10%"><c:if test="${noticeViewInfo.boardImg1 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg1}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg1,33,fn:length(noticeViewInfo.boardImg1)),'.')[0]}
		</c:if></td>
	    <td width="10%"><c:if test="${noticeViewInfo.boardImg2 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg2}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg2,33,fn:length(noticeViewInfo.boardImg2)),'.')[0]}
		</c:if></td>
		<td width="10%"><c:if test="${noticeViewInfo.boardImg3 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg3}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg3,33,fn:length(noticeViewInfo.boardImg3)),'.')[0]}
		</c:if></td>
	    </tr>
	    
	    <tr>
	    <td width="10%"><c:if test="${noticeViewInfo.boardImg4 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg4}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg4,33,fn:length(noticeViewInfo.boardImg4)),'.')[0]}
		</c:if></td>
		<td width="10%"><c:if test="${noticeViewInfo.boardImg5 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg5}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg5,33,fn:length(noticeViewInfo.boardImg5)),'.')[0]}
		</c:if></td>
		<td width="10%"><c:if test="${noticeViewInfo.boardImg6 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed"  src="<c:url value='${noticeViewInfo.boardImg6}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg6,33,fn:length(noticeViewInfo.boardImg6)),'.')[0]}
		</c:if></td>
		</tr>
			   	
	   	<tr>
	    <td width="10%"><c:if test="${noticeViewInfo.boardImg7 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg7}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg7,33,fn:length(noticeViewInfo.boardImg7)),'.')[0]}
		</c:if></td>
		<td width="10%"><c:if test="${noticeViewInfo.boardImg8 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg8}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg8,33,fn:length(noticeViewInfo.boardImg8)),'.')[0]}
		</c:if></td>
		<td width="10%"><c:if test="${noticeViewInfo.boardImg9 != 'null'}">
		<img width="50px" style="max-width:600px;" class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg9}'/>"/>
		${fn:split(fn:substring(noticeViewInfo.boardImg9,33,fn:length(noticeViewInfo.boardImg9)),'.')[0]}
		</c:if></td>
	    </tr>
			   
	    </tbody>
	    </table>
		
	</div>
</main>

<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
