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
<script type="text/javascript">
$(function(){
	
	var count = $("input[type=file]").length;
	$('#thumbnail').on("change", function() {
		readURL(this);
		$('#thumbnail-text').hide();
	});
	
	$('.image-file').on("change", "input[type=file]", function() {
		var size = fileSize(this).toFixed(2)+"KB";
		var index = "#image\\["+$(this).attr("name").substr(6,1)+"\\]";
		$(index).val(size);
	});
	
	$('#add').on("click", function() {
		if(count < 4) {
			var str = "<div class='file-field input-field'>";
			str += "<input type='file' name='board_img"+count+"'>";
			str += "<div class='file-path-wrapper'>";
			str += "<input class='file-path validate' type='text' placeholder='이미지 파일을 추가해주세요.'>";
			str += "</div></div>";
			$('div.image-file').append(str);
			
			str = "<div  style='margin-top:15px'><input id='board_img"+count+"' name='imageSize' type='text' class='validate' placeholder='이미지 크기' readonly></div>"; 
			$('div.image-file-size').append(str);
			count++;
		}else {
			Materialize.toast('이미지 파일은 4개까지 올릴 수 있습니다.', 3000, 'rounded');
	        var width = $("#toast-container").width();
	        $("#toast-container").css("margin-left", (width*-1)+209);
		}
	});
	
	$("#delete").on("click", function() {
		if(count > 0) {
			$(".image-file").children(":last").remove();
			$(".image-file-size").children(":last").remove();
			count--;
		}
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('.inner').html("<img id='preview-image' src='"+e.target.result+"'/>");
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
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<main>
		<div class="container">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/edit.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reserveLogo.jpg"/>'>
		</div>
		<form method="post" action="/controller/praha/prahaReserveInsert">
			<div id="main_content" style="margin-top: 16px;">
				<div class="row" style="margin-left:12%;margin-top:-25px">
			        <div class="input-field col s7" style="margin-bottom:-20px">
			          <input id="title" name="title" type="password" class="validate">
			          <label for="title">문의 제목</label>
			        </div>
					<div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="writer" name="writer" type="password" class="validate">
			          <label for="writer">작성자</label>
			        </div>
			    </div>
				<div class="row" style="margin-left:12%">
			    <form class="col s12">
					<div class="row" >
				        <div class="input-field col s10">
					        <i class="material-icons prefix">mode_edit</i>
					        <textarea id="icon_prefix2" class="materialize-textarea" name="content" 
					        placeholder="카카오톡 ID를 남겨주시면 연락이 편합니다."></textarea>
					        <label for="icon_prefix2">문의 내용 (입력창이 자동으로 늘어납니다.)</label>
				        </div>
			    	</div>
			    </form>
				</div>
				<div class="row" style="margin-left:12%;margin-top:-40px">
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="password" name="password" type="password" class="validate">
			          <label for="password">Password</label>
			        </div>
			        <div class="input-field col s3" style="margin-bottom:-20px">
			          <input id="phone" name="phone" type="password" class="validate">
			          <label for="phone">전화번호</label>
			        </div>
			        <div class="input-field col s3">
			          <input id="kakaoId" name="kakaoId" type="password" class="validate">
			          <label for="kakaoId">카카오톡 아이디</label>
			        </div>
			        <a class="waves-effect waves-light btn">문의</a>
				</div>
			</div>
			<div class="col s9" style="margin-right:116px">
				<a class="waves-effect waves-light btn color-500" id="add">이미지 추가</a>
				<a class="waves-effect waves-light btn color-500" id="delete">이미지 삭제</a>
				<div class="row">
					<div class="input-field col s6 image-file">
						<div class="file-field input-field">
							<input type="file" name="board_img0">
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text"
									placeholder="이미지 파일을 추가해주세요.">
							</div>
						</div>
					</div>
					<div class="input-field col s3 image-file-size" style="margin-top:29px">
						<input id="board_img0" type="text" class="validate" placeholder="이미지 크기" readonly>
					</div>
				</div>
			</div>
			
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	</body>
