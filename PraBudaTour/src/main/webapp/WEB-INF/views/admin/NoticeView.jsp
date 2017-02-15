<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
       <!--Import Google Icon Font-->
       <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>'rel="stylesheet">
       <!--Import materialize.css-->
       <link type="text/css" rel="stylesheet"href='<c:url value="/resources/css/materialize.css"/>'media="screen,projection" />
       <!--Let browser know website is optimized for mobile-->
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   </head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
	<script type="text/javascript">
	$(function(){
		$("#updateComplete").hide();
	    $("delete").click(function(){
	    	var result = confirm('이 글을 삭제하시겠습니까?');
	    
	        if(result) {
	        	alert("삭제되었습니다.");
	        	location.href="/controller/praha/prahaNoticeDelete?boardNo="+$("#boardNo").val()
	        }
	    });
	    
	    $("#update").click(function(){
		    var result = confirm('이 글을 수정하시겠습니까?');
		    
		    if(result){
		    	$(".updateform").removeAttr("disabled");
		    	$(this).hide();
		    	$("#updateComplete").show();
		    }
	});
	
	    $("#list").click(function(){
	    	location.href="controller/praha/noticeBoard"
	    });
	
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	    
<main>
	<div class="container">
		<h3>Notice</h3>
		제목 : <input type="text" readonly="readonly">
		<pre style="border: none; border: 2px solid #000; height: 300px">글작성 부분입니다.</pre>
		<div style="float: right">
			<a class="waves-effect waves-light btn" style="float:right; margin-top:30px; margin-left:20px;">수정하기</a>
			<a class="waves-effect waves-light btn" style="float:right; margin-top:30px; ">삭제하기</a>
		</div>
		<br/>파일 : <input type="file"><br/>
	</div>
</main> 


</body>
</html>