<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO pVO = (PageDTO)request.getAttribute("page");
	Object obj = request.getAttribute("popup");
	PopupDTO popup = null;
	if(obj!=null){
	popup=(PopupDTO)obj;
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
		<meta http-neuiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
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
	<%if(obj!=null){%>
		$("#add").hide();
		var imgsrc= '<%=popup.getPopupImg()%>';
		var boardNo = '<%=popup.getBoardNo()%>';
		$("#popupNo").val(boardNo);
		var str ="<img id='jImg' width='500px' height='510px'>";
		$("div.image-file-size").append(str);
        $('#jImg').attr('src', '/controller/'+imgsrc);
        $("#boardNo").val(boardNo).prop("selected", true);
	<%}else{%> 
	$("#popupDelete").hide();
	<%}%>
	
	var count = $("input[type=file]").length;
	
	$('.image-file').on("change", "input[type=file]", function() {
		var size = fileSize(this).toFixed(2)+"KB";
		var index = "#boardImg"+$(this).attr("class").substr(8,1);
    	readURL(this);
		$(index).val(size);
	});
	
		$("#popupDelete").click(function(){
				location.href="/controller/admin/popupDelete";
		});
		
			
		});
		
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				if($("#jImg").length==0){
				var str ="<img id='jImg' width='500px' height='510px'>";
				$("div.image-file-size").append(str);
				}
	            $('#jImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
			var fileSize = input.files[0].size/1024;
			$('#thumbnail-preview').val(fileSize.toFixed(2)+"KB");
		}
	}
	
	function fileSize(input) {
		var fileSize = input.files[0].size/1024;
		
		return fileSize;
	}
	
	</script>
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>

	  <div class="container">
	  <table style="margin-top:30px"><tr><td>
			<!--  <img src='<c:url value="/resources/images/noticePlus.png"/>' style="width:28%">-->
	  </td></tr></table>
		<form id="noticeInsert" action="/controller/admin/popupInsert" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="boardState" id="boardState">
		<input type="hidden" name="popupNo" id="popupNo">	
		<table style="margin-bottom:10px">
			<tr><td class="centered" style="padding-left: 40%;">
				<input class="waves-effect waves-light btn" type="submit" id="add" value="팝업사용">
			    <input class="waves-effect waves-light btn" type="button" id="popupDelete" value="팝업사용안함">
				  
			</td></tr>
				<tr><td class="centered">
				<div class="row">
				<div class="input-field col s7 image-file">
				
				<div class='file-field input-field'>
					<input type='file' name='file' id='InputFile' class='boardImg0'>
				<div class='file-path-wrapper'>
					<input class='file-path validate' type='text' placeholder='이미지 파일 추가 (이 부분을 클릭하세요.)'>
				</div></div>
				
				</div>
					<div class="input-field col s4 image-file-size">
					</div>
				</div>
					<div class="row">
						<div id="submitbtn">
						
						</div>
					</div>
				</td></tr>
			</table>
		</form>
	
	
	
	  </div>	<!-- container -->
	
	
	</main>
	</body>
</html>