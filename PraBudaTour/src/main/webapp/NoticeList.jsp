<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />

	<main>
	<div class="container">
		<h3>Notice</h3>
		<table class="responsive-table centered bordered">
			<thead>
				<tr>
					<th data-field="id">No</th>
					<th data-field="id">Name</th>
					<th data-field="name">Title</th>
					<th data-field="price">Date</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
				<tr>
					<td>4</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
				<tr>
					<td>5</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
				<tr>
					<td>6</td>
					<td>Name</td>
					<td>공지사항 예시입니다.</td>
					<td>2017.02.09</td>
				</tr>
			</tbody>
		</table>

		<div class="fixed-action-btn horizontal">
			<a class="btn-floating btn-large red"> <i
				class="large material-icons">mode_edit</i>
			</a>
			<ul>
				<li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
				<li><a class="btn-floating yellow darken-1"><i
						class="material-icons">format_quote</i></a></li>
				<li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
				<li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
			</ul>
		</div>


	</div>
	</main>


</body>
</html>