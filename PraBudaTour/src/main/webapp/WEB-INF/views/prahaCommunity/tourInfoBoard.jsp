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
			    <td rowspan="3">
			    	<pre  class="materialize-textarea" style="word-break:break-all; white-space:pre-wrap;">${list.content}</pre>
			    </td>
				</tr>
			    </tbody>
			    </table>
			    
			    <table class="centered">
						<tr>
						<td class="centered">
							<c:if test="${!list.boardImg0 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg0}'/>"/>
								<%-- ${fn:split(fn:substring(list.boardImg1,33,fn:length(list.boardImg1)),'.')[0]} --%>
							</c:if>
							<c:if test="${!list.boardImg1 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg1}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg2 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg2}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg3 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg3}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg4 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg4}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg5 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg5}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg6 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg6}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg7 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg7}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg8 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg8}'/>"/>
							</c:if>
							<c:if test="${!list.boardImg9 eq 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg9}'/>"/>
							</c:if>
						</td>
						</tr>
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
