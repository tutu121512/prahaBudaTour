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
	</script>
	</head>
	<body>
   <!--Import jQuery before materialize.js-->
   <script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){
	    $('.materialboxed').materialbox();
	  });

<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/gift.png"/>' style="width:5%;margin-left:20px;margin-top:20px;">
			<img src='<c:url value="/resources/images/useServiceLogo.jpg"/>'>
	</div>
	<div>
	<ul id="ListandView" class="collapsible" data-collapsible="accordion" style="border-style:hidden;box-shadow:none">  
	<c:choose>
	<c:when test="${empty selectList}">
	<table class="striped centered">
	<tr><td colspan="5">게시글이 없습니다.</td></tr>
	</table>
	</c:when>
	<c:otherwise>
		 <c:forEach items="${selectList}" var="list">
			  <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="line-height:1rem;font-size:20px;background-color:seagreen;border-radius:35px;border-bottom:6px solid;">
			  	<table>
			  	<tbody id="headerContent">
			  	<tr><td style="width:10%;padding-bottom:0px;padding-top:5px">
			  	<c:if test="${list.boardImg0 != 'null'}">
			    <img src="<c:url value='${list.boardImg0}'/>" style="max-width:75px">
			    </c:if>
			    </td><td style="width:85%">
			    <div style="width:85%;font-size:25px;color: white;">${list.title}</div>
			    </td></tr>
			    </tbody>
			    </table>
			    </div>
			    
			    
			    <div class="collapsible-body" style=" padding:0px;margin:0px;border-radius:37px;display:block;border-right:3px solid #ddd;border-left:3px solid #ddd;border-bottom:3px solid #ddd;">
			    <table>
			    <tbody id="bodyContent">
			    <tr>
			    <td rowspan="3" width="70%"><pre style="white-space:pre-wrap;text-align:center;font-size:17px;">${list.content}</pre></td>
			    </tr>
			    </tbody>
			    </table>
			    </div>
			  </li>
		  </c:forEach>
	</c:otherwise>
	</c:choose>
		</ul>
	</div>
	</div>

</main>

<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
