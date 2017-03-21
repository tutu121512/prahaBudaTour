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
			<img src='<c:url value="/resources/images/tripInfoPlus.png"/>' style="width:25%;margin-left:20px;margin-top:20px;">
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
			    <div class="collapsible-header" style="line-height:2rem;font-size:20px;background-color:forestgreen;border-radius:35px;border-bottom:8px solid;">
			  	<table>
			  	<tbody id="headerContent">
			  	<tr><td style="width:10%;padding-bottom:0px;padding-top:1rem">
			    <img src="<c:url value='${list.boardImg0}'/>" style="max-width:75px;border-radius:20px;">
			    </td><td style="width:85%">
			    <div style="width:85%;font-size:25px;color: white;">${list.title}</div>
			    </td><td>
			    </tbody>
			    </table>
			    </div>
			    
			    <div class="collapsible-body" style="border-radius:37px;display:block;border-right:3px solid #ddd;border-left:3px solid #ddd;border-bottom:3px solid #ddd;">
			<table>
			    <tbody id="bodyContent">
			    <tr>
			    <td rowspan="3">
			    	<pre  class="materialize-textarea" style="font-size:18px;word-break:break-all;white-space:pre-wrap;padding-left:35px;">${list.content}</pre>
			    </td>
				</tr>
			    </tbody>
			</table>
			    
			    <table class="centered">
						<tr>
						<td class="centered" style="padding-left:40px">
							<c:if test="${list.boardImg0 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg0}'/>"/>
								<%-- ${fn:split(fn:substring(list.boardImg1,33,fn:length(list.boardImg1)),'.')[0]} --%>
							</c:if>
							<c:if test="${list.boardImg1 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg1}'/>"/>
							</c:if>
							<c:if test="${list.boardImg2 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg2}'/>"/>
							</c:if>
							<c:if test="${list.boardImg3 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg3}'/>"/>
							</c:if>
							<c:if test="${list.boardImg4 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg4}'/>"/>
							</c:if>
							<c:if test="${list.boardImg5 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg5}'/>"/>
							</c:if>
							<c:if test="${list.boardImg6 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg6}'/>"/>
							</c:if>
							<c:if test="${list.boardImg7 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg7}'/>"/>
							</c:if>
							<c:if test="${list.boardImg8 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg8}'/>"/>
							</c:if>
							<c:if test="${list.boardImg9 ne 'null'}">
								<img height="130px" style="max-heigth:600px;border-radius:20px" class="materialboxed"  src="<c:url value='${list.boardImg9}'/>"/>
							</c:if>
						</td>
						</tr>
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
