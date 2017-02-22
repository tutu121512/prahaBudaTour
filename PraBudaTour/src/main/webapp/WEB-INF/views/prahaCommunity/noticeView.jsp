<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="prahaBuda.tour.dto.*"%>

<%
	//페이징 클래스 받아오기
	PageDTO pVO = (PageDTO) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link
	href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>'
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href='<c:url value="/resources/css/materialize.css"/>'
	media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/materialize.min.js"/>'></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<main>
	<div class="container">
		<div class="centered row" style="margin-top: 5px;">
			<img src='<c:url value="/resources/images/notice.png"/>'
				style="width: 5%; margin-left: 100px; margin-top: 20px;"> <img
				src='<c:url value="/resources/images/noticeLogo.jpg"/>'>
		</div>

		제목 :
		<h5>${noticeViewInfo.title}</h5>
		${noticeViewInfo.boardDate}
		<hr style="margin-bottom: 10px;">
		<table>
			<tbody id="bodyContent">
				<tr>
					<td rowspan="3"><pre class="materialize-textarea"
							style="word-break: break-all; white-space: pre-wrap;">${noticeViewInfo.content}</pre>
					</td>
				</tr>
			</tbody>
		</table>

		<table class="centered">
			<tr>
				<td class="centered"><c:if test="${noticeViewInfo.boardImg0 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg0}'/>" />
						<%-- ${fn:split(fn:substring(noticeViewInfo.boardImg1,33,fn:length(noticeViewInfo.boardImg1)),'.')[0]} --%>
					</c:if> <c:if test="${noticeViewInfo.boardImg1 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg1}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg2 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg2}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg3 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg3}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg4 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg4}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg5 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg5}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg6 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg6}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg7 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg7}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg8 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg8}'/>" />
					</c:if> <c:if test="${noticeViewInfo.boardImg9 != 'null'}">
						<img height="130px" style="max-heigth: 600px;"
							class="materialboxed" src="<c:url value='${noticeViewInfo.boardImg9}'/>" />
					</c:if></td>
			</tr>
		</table>

	</div>
	</main>

	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>