<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO pVO = (PageDTO)request.getAttribute("page");
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
	<script type="text/javascript">
	$(function(){
		var deleteStr = "";
		
		$(".reply").click(function(){
			$(this).parents().find('#'+$(this).attr("id")).submit(); 
		});
		
		$(".replyUpdate").click(function(){
			$(this).css("display","none");
			$(this).next().removeAttr("style");
			$(this).parents().find("#boardReply").contents().unwrap().wrap('<textarea name="boardReply" class="materialize-textarea" placeholder="답변을 달아주세요""></textarea>');
		});
		
		$("#deletebtn").click(function(){
			var result = confirm("삭제하시겠습니까?");
			if(result){
				location.href="/controller/admin/adminDelete?deleteArry="+deleteStr;
			}
		});
		
		$(".chk").click(function(){
			if($(this).is(":checked")){
				deleteStr += $(this).val() +"/"
			}else{
				deleteStr = "";
				$(".chk").each(function(){
					if($(this).is(":checked")){
						deleteStr += $(this).val() +"/"
					}
				});
			}
		})
		
	});
	</script>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>

	  <div class="container" style="margin-left:25%">
	 <div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/manageBoard.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/manageBoardLogo.jpg"/>'>
	<a href="/controller/admin/selectBoard?boardState=shuttle" class="waves-effect waves-light btn"><input type="button" value="셔틀문의"></a>
	<a href="/controller/admin/selectBoard?boardState=reserveQuestion" class="waves-effect waves-light btn"><input type="button" value="예약문의"></a>
	<a href="/controller/admin/selectBoard?boardState=review" class="waves-effect waves-light btn"><input type="button" value="후기"></a>
	<a href="/controller/admin/selectBoard?boardState=notice" class="waves-effect waves-light btn"><input type="button" value="공지사항"></a>
	<a href="/controller/admin/selectBoard?boardState=tourInfo" class="waves-effect waves-light btn"><input type="button" value="여행정보"></a>
	<a href="/controller/admin/selectBoard?boardState=userBenefit" class="waves-effect waves-light btn"><input type="button" value="이용혜택"></a>
	<a href="/controller/admin/selectBoard?boardState=reserveComplete" class="waves-effect waves-light btn"><input type="button" value="예약확정"></a>
		       <input type="button" value="삭제" id="deletebtn" name="deletebtn" class="waves-effect waves-light btn">
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
			    	<input type="checkbox" class="filled-in chk" id="${list.boardNo}" value="${list.boardNo},${list.boardState}" />
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
		       			<c:when test="${list.boardState eq 'tourInfo'}">여행정보</c:when>
		       			<c:when test="${list.boardState eq 'userBenefit'}">이용혜택</c:when>
		       			<c:when test="${list.boardState eq 'reserveComplete'}">예약확정</c:when>
	    			</c:choose>
	    			</label>
	    		</td>
	    	</tr>
	    </table>
	    </div>
	    <div class="collapsible-body">
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
							<c:if test="${list.boardImg0 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg0}'/>"/>
								<%-- ${fn:split(fn:substring(list.boardImg1,33,fn:length(list.boardImg1)),'.')[0]} --%>
							</c:if>
							<c:if test="${list.boardImg1 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg1}'/>"/>
							</c:if>
							<c:if test="${list.boardImg2 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg2}'/>"/>
							</c:if>
							<c:if test="${list.boardImg3 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg3}'/>"/>
							</c:if>
							<c:if test="${list.boardImg4 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg4}'/>"/>
							</c:if>
							<c:if test="${list.boardImg5 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg5}'/>"/>
							</c:if>
							<c:if test="${list.boardImg6 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg6}'/>"/>
							</c:if>
							<c:if test="${list.boardImg7 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg7}'/>"/>
							</c:if>
							<c:if test="${list.boardImg8 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg8}'/>"/>
							</c:if>
							<c:if test="${list.boardImg9 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg9}'/>"/>
							</c:if>
						</td>
						</tr>
					</table>
		
	    <c:if test="${list.boardState eq 'reserveQuestion' or list.boardState eq 'shuttle'}">
			<div class="col s12">
					<form id="${list.boardNo}" method="post" action="/controller/admin/adminBoardReply">
					<input type="hidden" name="boardState" id="boardState" value="${list.boardState}">
					<input type="hidden" name="boardNo" id="boardNo" value="${list.boardNo}">
					<table class="centered" style="background-color: blanchedalmond; border-radius: 30px;"><tr><td class="centered">
	    	<c:choose>
	    	<c:when test="${list.boardReply eq null}">
					<tr><td width="80%"><textarea id="boardReply" name="boardReply" class="materialize-textarea" placeholder="답변을 달아주세요"></textarea></td>
					<td><a id="${list.boardNo}" class="waves-effect waves-light btn reply">답변하기</a></td></tr>
	    	</c:when>
			<c:otherwise>
					<tr><td width="80%"><pre id="boardReply" name="boardReply" class="materialize-textarea">${list.boardReply}</pre></td>
					<td><a id="${list.boardNo}" class="waves-effect waves-light btn replyUpdate">답변 수정</a>
						<a id="${list.boardNo}" class="waves-effect waves-light btn reply" style="display: none">답변 수정</a></td></tr>
			</c:otherwise>
			</c:choose> 
					</table>
					</form>
			</div><!-- 댓글 -->	   
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
	</body>
</html>