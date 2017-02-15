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
	</head>
	<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<div class="row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		<form method="post" action="/controller/praha/prahaReserveInsert">
		<table style="margin-left:70px;margin-top:-22px;">
		<tr><td>
				<div class="row" style="margin-bottom:-20px">
			        <div class="input-field col s7">
			        <i class="material-icons prefix">title</i>
			          <input id="title" name="title" type="text" class="validate">
			          <label for="title">문의 제목</label>
			        </div>
					<div class="input-field col s3">
					<i class="material-icons prefix">supervisor_account</i>
			          <input id="writer" name="writer" type="text" class="validate">
			          <label for="writer">작성자</label>
			        </div>
			    </div>
			    </td></tr>
			    <tr><td>
					<div class="row" style="margin-bottom:-40px">
				        <div class="input-field col s10">
					        <i class="material-icons prefix">mode_edit</i>
					        <textarea id="icon_prefix2" class="materialize-textarea" name="content" 
					        placeholder="카카오톡 ID를 남겨주시면 연락이 편합니다."></textarea>
					        <label for="icon_prefix2">문의 내용 (입력창이 자동으로 늘어납니다.)</label>
				        </div>
				</div>
				</td></tr>
				<tr><td>
				<div class="row" style="margin-bottom:-20px">
			        <div class="input-field col s3" style="margin-bottom:-20px">
			        <i class="material-icons prefix">security</i>
			          <input id="password" name="password" type="password" class="validate" placeholder="4자리만 입력가능" maxlength="4">
			          <label for="password">Password</label>
			        </div>
			        <div class="input-field col s4" style="margin-bottom:-20px">
					<i class="material-icons prefix">phone</i>
			          <input id="phone" name="phone" type="text" class="validate" placeholder="-제외하고 입력해주세요">
			          <label for="phone">전화번호 (ex 01048544515)</label>
			        </div>
			        <div class="input-field col s3">
			        <i class="material-icons prefix">sms</i>
			          <input id="kakaoId" name="kakaoId" type="text" class="validate">
			          <label for="kakaoId">카카오톡 아이디</label>
			        </div>
				</div>
				</td></tr>
				<tr><td style="text-align:center">
					<div class="row">
			        <input type="submit" value="문의" class="waves-effect waves-light btn waves-input-wrapper" style="width:50%">
				</div>
				</td></tr>
		</table>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
