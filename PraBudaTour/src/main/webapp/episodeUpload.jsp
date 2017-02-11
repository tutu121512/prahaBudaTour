<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="StyleSheet" href="<c:url value='/resources/css/webtoon.css'/>">
<script type="text/javascript">
	$(function() {
		
		//에피소드 제목
		$("#episode-title").keyup(function (e) {
			if($(this).val().length >= 20){
				  $(this).val($(this).val().substring(0, 20));
			  }
		})
		
		//작가의 말
		$("#author-word").keyup(function (e) {
			if($(this).val().length >= 50){
				  $(this).val($(this).val().substring(0, 50));
			  }
		})
		
		
		$("form").submit(function() {
			if ($("#episode-title").val() == "") { // 에피소드 제목 미입력  검사
				Materialize.toast('에피소드 제목을 입력해 주세요.', 2000, 'rounded');
		        var width = $("#toast-container").width();
		        $("#toast-container").css("margin-left", (width*-1)+209);
		        $("#episode-title").focus();
				return false;
			}else if ($("#author-word").val() == "") { // 작가의 말 미입력  검사
				Materialize.toast('작가의 말을 입력해 주세요.', 2000, 'rounded');
		        var width = $("#toast-container").width();
		        $("#toast-container").css("margin-left", (width*-1)+209);
		        $("#author-word").focus();
				return false;
			}else if ($("input[name='image[0]']").val() == "") { // 그림 이미지가 비어있을 때  검사
				Materialize.toast('에피소드 그림 이미지를 추가해 주세요.', 2000, 'rounded');
		        var width = $("#toast-container").width();
		        $("#toast-container").css("margin-left", (width*-1)+209);
				return false;
			}else if ($("#thumbnail").val() == "") { // 그림 이미지가 비어있을 때  검사
				Materialize.toast('에피소드 썸네일 이미지를 추가해 주세요.', 2000, 'rounded');
		        var width = $("#toast-container").width();
		        $("#toast-container").css("margin-left", (width*-1)+209);
				return false;
			}
		});
		
		var count = $("input[type=file]").length - 1;
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
			if(count < 10) {
				var str = "<div class='file-field input-field'>";
				str += "<input type='file' name='image["+count+"]'>";
				str += "<div class='file-path-wrapper'>";
				str += "<input class='file-path validate' type='text' placeholder='이미지 파일을 추가해주세요.'>";
				str += "</div></div>";
				$('div.image-file').append(str);
				str = "<input id='image["+count+"]' name='imageSize' type='text' class='validate' placeholder='이미지 크기' readonly>"; 
				$('div.image-file-size').append(str);
				count++;
			}else {
				Materialize.toast('이미지 파일은 10개까지 올릴 수 있습니다.', 3000, 'rounded');
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
</head>
<body>
	<div class="row title-box z-depth-1">
		<div class="col s3 webtoon-sumbnail-box">
			<img src="<c:url value='/resources/'/>${webtoonDTO.webtoonThumbnail}">
		</div>
		<div class="title-content-box">
			<div class="row" style="margin: 0">
				<div class="col s4 webtoon-title-row">
					
				</div>
				<div class="col s8">
					<p class="">${webtoonDTO.nickname}<p>
					<p>${webtoonDTO.summary}</p>
				</div>
				<i id="scription-btn" class=" small material-icons scription-a-webtoon">grade</i>
			</div>
		</div>
	</div>
	<div class="row tab-row  z-depth-1">
		<div class="col s12">
			<ul class="tabs mywebtoon-tab">
				<li class="tab col s6 m12 l4 offset-l4"><a class="active" href="#episode-list">에피소드 업로드</a></li>
			</ul>
		</div>
	</div>
	<div class="z-depth-2 episode-upload-content" style="margin-bottom:70px;">

		<form method="post" action="<c:url value='/author/episodeUpload'/>" encType="multipart/form-data">
		<div class="row">
			<div class="input-field col s6">
				<input id="episode-title" type="text" class="validate" name="episodeTitle"> 
				<label for="episode-title">에피소드 제목</label>
			</div>
			<div class="input-field col s6">
				<input id="author-word" type="text" class="validate" name="authorWord"> 
				<label for="author-word">작가의 말</label>
			</div>
		</div>
		
		<div class="row">
			<div class="col s6">
				<p class="">그림 이미지를 등록해주세요.</p>
				<a class="waves-effect waves-light btn color-500" id="add">이미지 추가</a>
				<a class="waves-effect waves-light btn color-500" id="delete">이미지 삭제</a>
				<div class="row">
					<div class="input-field col s6 image-file">
						<div class="file-field input-field">
							<input type="file" name="image[0]">
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text"
									placeholder="이미지 파일을 추가해주세요.">
							</div>
						</div>
					</div>
					<div class="input-field col s6 image-file-size">
						<input id="image[0]" type="text" class="validate" placeholder="이미지 크기" readonly>
					</div>
				</div>
			</div>
		
			<div class="input-field col s6">
				<div class="file-field input-field">
					<div class="btn color-500">
						<span>File</span> <input id="thumbnail" type="file" name="thumbnailFile">
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text">
					</div>
				</div>

				<div class="row thumbnail-box">
					<div class="col s4">
						<div class="preview">
							<div class="inner">
								<p class="" id="thumbnail-text">썸네일 미리보기</p>
								<img id='preview-image' src='' />
							</div>
						</div>
					</div>
					<div class="col s8">
						<p class="">썸네일 미리보기 이미지입니다.</p>
						<input id="thumbnail-preview" type="text" class="validate"
							name="thumbnail-preview" readonly> <label
							for="thumbnail-preview"></label>
					</div>
				</div>
				
				<div class="row btn-box">
					<input type="hidden" value="${webtoonDTO.webtoonCode }" name="webtoonCode"/>
					<input type="hidden" value="${requestScope.episodeNumber }" name="episodeNumber"/>
					<button class="btn waves-effect waves-light color-500" type="submit" name="action">업로드하기
					</button>
					<a class="waves-effect waves-light btn color-500">돌아가기</a>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>