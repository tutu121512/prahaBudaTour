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
	
	   <title>login_box</title>
	   <style type="text/css">
	   body,div,ol,li,from,filedset,legend,input{margin:0; padding:0}
	   fieldset{border:0}
	   a{text-decoration:none;}
	   ol{list-style:none;}
	  
	   body{font-family:"배달의민족 주아",sans-serif; font-size:14px; color:#333;}
	   #login_wrap{width:504px; height:250px; border:1px solid red; position:absolute; left:50%; top:50%; margin:-140px 0 0 -292px; padding:22px 40px 8px;}
	   #login_wrap h1{width:102px; height:20px; background: no-repeat; text-indent:-9999px; margin-bottom:9px;}
	  
	    legend{text-indent:-9999px;}
	   .form_box{width:400px; height:162px; border-top:1px dotted #888; border-bottom:1px dotted #888; position:relative;}
	   .form_box.id_area{width:250px; height:10px; position:absolute; top:10px; left:70px;}
	   .form_box.pw_area{width:250px; height:10px; position:absolute; top:30px; left:70px;}
	   .form_box.save_id{position:relative; top:60px; left:130px;}
	   .form_box.login_area{position:absolute; top:20px; left:300px;}
	   .form_box.id_area label{display:block; float:left; width:34px; height:11px; background: no-repeat; text-indent:-9999px; margin:7px 27px 00;}
	   .form_box.pw_area label{display:block; float:left; width:39px; height:11px; background: no-repeat; text-indent:-9999px; margin:7px 27px 00;}
	   .form_box.id_area input{width:20px; height:100px; border:1px; }
	   .form_box.pw_area input{width:20px; height:100px; border:1px; }
	   .form_box.save_id label{position:relative; top:-2px; left:25px;}
	   .form_box.login_area input{width:86; height:54px; border:0; }
	   
 	   .others{margin-top:140px;} 
	   .others li{width:504px; height:24px; margin-bottom:1px; position:relative;} 
 	   .others li span{position:absolute; left:100px; top:1px;} 
	 
	  
	   </style>
	</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<jsp:include page="/WEB-INF/views/adminHeader.jsp" />
<br><br><br>

<div id="login_wrap">
<h5>관리자 로그인</h5>
<hr>
  <form action="#" method="post">
  	<div class="row">
			<div class="input-field col s6" style="margin-bottom:-20px">
					<input id="adminId" name="adminId" type="text" class="validate">
					<label for="adminId">ID</label>
			</div>
			<div class="input-field col s6" style="margin-bottom:-20px">
					<input id="adminPassword" name="adminPassword" type="password" class="validate">
					<label for="adminPassword">비밀번호</label>
			</div>
			<div class="input-field col s12">
			<input class="waves-effect waves-light btn waves-input-wrapper" type="submit" name="login" id="login" value="로그인" style="width:400px"/>
			</div>
			<ol>
			<hr>
   <li class="others1"><span>관리자ID를 잊으셨나요?</span><a href="#">아이디찾기</a></li>
   <li class="others2"><span>관리자 PassWord를 잊으셨나요?</span><a href="#">비밀번호 찾기</a></li>
</ol>
  </div>
  </form>
</div>   
</body>
</html>