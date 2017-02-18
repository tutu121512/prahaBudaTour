<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	    <script>
	    function submit()
	    {
	    document.getElementById("shuttleInsertForm").submit();
	    }
	    </script>
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/shuttle.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/shuttleLogo.jpg"/>'>
		</div>
		<form id="shuttleInsertForm" method="post" action="/controller/shuttle/praha/ShuttleInsert">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate">
							<label for="writer">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-bottom:-30px">
						<div class="input-field col s12">
							<i class="material-icons prefix">mode_edit</i>
							<textarea id="icon_prefix2" class="materialize-textarea" name="content" placeholder="카카오톡 ID를 남겨주시면 연락이 편합니다."></textarea>
							<label for="icon_prefix2">문의 내용 (입력창이 자동으로 늘어납니다.)</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="password" name="password" type="password" class="validate" placeholder="4자리만 입력가능" maxlength="4">
							<label for="password">Password</label>
						</div>
					</div>
				</td></tr>
				<tr><td style="text-align:center">
					<div class="row">
						<a onClick="submit();return false;" class="waves-effect waves-light btn" style="width:100%">문의</a>
					</div>
				</td></tr>
			</table>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
