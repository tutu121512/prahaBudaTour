<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO pVO = (PageDTO)request.getAttribute("page");
	List<BoardDTO> review = (List<BoardDTO>)request.getAttribute("reviewList");
	List<BoardDTO> reserve = (List<BoardDTO>)request.getAttribute("reserveList");
	List<BoardDTO> notice = (List<BoardDTO>)request.getAttribute("noticetList");
%>
<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
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
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>

	  <div class="container" style="margin-left:25%">
	 <div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/manageBoard.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/manageBoardLogo.jpg"/>'>
	<a href="/controller/admin/selectBoard?boardState=shuttle" class="waves-effect waves-light btn"><input type="button" value="셔틀문의"></a>
	<a href="/controller/admin/selectBoard?boardState=reserveQuestion" class="waves-effect waves-light btn"><input type="button" value="예약문의"></a>
	<a href="/controller/admin/selectBoard?boardState=review" class="waves-effect waves-light btn"><input type="button" value="후기"></a>
	<a href="/controller/admin/selectBoard?boardState=notice" class="waves-effect waves-light btn"><input type="button" value="공지사항"></a>
	
	</div>
	  <ul class="collapsible popout" data-collapsible="accordion" style="width:80%">  
	  <li>
	    <div style="padding:0px">
	    <table class="centered">
	    	<tr>
	    		<td class="centered" style="width:10%">
	    			<label style="font-size:1.3rem">글번호</label>
	    		</td>
	    		<td class="centered" style="width:55%">
	    			<label style="font-size:1.3rem">제목</label>
	    		</td>
				<td class="centered" style="width:10%">
	    			<label style="font-size:1.3rem">작성자</label>
	    		</td>
				<td class="centered" style="width:15%">
	    			<label style="font-size:1.3rem">작성일자</label>
	    		</td>
	    		<td class="centered" style="width:10%">
	    			<label style="font-size:1.3rem">종류</label>
	    		</td>
	    	</tr>
	    </table>
	    </div>
	  </li>
	
		<c:forEach items="${totalList}" var ="list">
		<li>
	    <div class="collapsible-header" style="padding:0px">
	    <table class="centered">
	    	<tr>
	    		<td class="centered" style="width:10%">
			    	<input type="checkbox" class="filled-in" id="${list.boardNo}" checked="checked" />
      				<label for="${list.boardNo}">${list.boardNo}</label>
	    		</td>
	    		<td class="centered" style="width:55%">
	    			<label style="font-size:1rem">${list.title}</label>
	    		</td>
				<td class="centered" style="width:10%">
	    			<label style="font-size:1rem">${list.writer}</label>
	    		</td>
				<td class="centered" style="width:15%">
	    			<label style="font-size:1rem">${list.boardDate}</label>
	    		</td>
	    		<td class="centered" style="width:10%">
	    			<label style="font-size:1rem">
	    			<c:choose>    			
		    			<c:when test="${list.boardState eq 'notice'}"> 공지사항 </c:when>
		    			<c:when test="${list.boardState eq 'shuttle'}">셔틀문의</c:when>
		       			<c:when test="${list.boardState eq 'reserveQuestion'}">예약문의</c:when>
		       			<c:when test="${list.boardState eq 'review'}">후기</c:when>
	    			</c:choose>
	    			</label>
	    		</td>
	    	</tr>
	    </table>
	    </div>
	    <div class="collapsible-body">
	    <pre>${list.content}</pre>
		<c:if test="${list.boardImg0 != 'null'}">
			<img style="max-width:600px;" src="<c:url value='${list.boardImg0}'/>"/>
		</c:if>				
		<c:if test="${list.boardImg1 != 'null'}">
			<img style="max-width:600px;" src="<c:url value='${list.boardImg1}'/>"/>
		</c:if>
		<c:if test="${list.boardImg2 != 'null'}">
			<img style="max-width:600px;" src="<c:url value='${list.boardImg2}'/>"/>
		</c:if>
		<c:if test="${list.boardImg3 != 'null'}">
			<img style="max-width:600px;" src="<c:url value='${list.boardImg3}'/>"/>
		</c:if>
	    
	    </div>
	  </li>
	  </c:forEach>
	</ul>

	<c:choose>
	<c:when test="${selectBoard eq null}">
		<ul class="pagination" style="float:left;margin-top:0px">
			<li class="page-item">
				<a href="/controller/admin/totalBoard?page=<%=pVO.getPreviPage()%>">
			    <i class="material-icons">chevron_left</i>
			     </a>
			   </li>
			   <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
			   <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/admin/totalBoard?page=<%=i%>"><%=i %></a></li>
			   <%} %>
			   <li class="page-item">
				<a href="/controller/admin/totalBoard?page=<%=pVO.getNextPage()%>">
			    <i class="material-icons">chevron_right</i>
		       </a>
		   </li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul class="pagination" style="float:left;margin-top:0px">
			<li class="page-item">
				<a href="/controller/admin/selectBoard?page=<%=pVO.getPreviPage()%>&boardState=${selectBoard}">
			    <i class="material-icons">chevron_left</i>
			     </a>
			   </li>
			   <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
			   <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/admin/selectBoard?page=<%=i%>&boardState=${selectBoard}"><%=i %></a></li>
			   <%} %>
			   <li class="page-item">
				<a href="/controller/admin/selectBoard?page=<%=pVO.getNextPage()%>&boardState=${selectBoard}">
			    <i class="material-icons">chevron_right</i>
		       </a>
		   </li>
		</ul>
	</c:otherwise>
	</c:choose>
	 											
	
	</div>	<!-- container -->
	
	
	</main>
	<div style="margin-left: 307px;">
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
	</body>
</html>