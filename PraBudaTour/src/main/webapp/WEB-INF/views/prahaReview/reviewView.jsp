<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% BoardDTO bto = (BoardDTO)request.getAttribute("reviewViewInfo"); %>
<!DOCTYPE html>
<html>
	<head>
		<!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
	    <!--Let browser know website is optimized for mobile-->
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>

	<script type="text/javascript">
	$(function(){		
		
		var count = 0;
		$("#imgbtn").hide();		
		$("#updateComplete").hide();
		$("#deletebtn").hide();
		var preheight = $("#icon_prefix2").height();
		
		$("#delete").click(function(){
			
			var str ='<div class="input-field col s4" style="margin-bottom:-20px; width: 20%;">'
				str +='<i class="material-icons prefix">security</i>'
				str +='<input id="password" name="password" type="password" class="validate" placeholder="비밀번호 입력">'
				str +='<label for="password">Password</label>'
				str +='</div>'
			$("#pass").append(str);													
			$(this).hide();
			$("#deletebtn").show();
		});
		
		$("#deletebtn").click(function(){
		var result = confirm('이 글을 삭제 하시겠습니까?');
			if(result) { 
				location.href="/controller/review/praha/reviewDelete?boardNo="+$("#boardNo").val()+"&password="+$("#password").val();
			}	
		});
		
		
		$("#update").click(function(){
			var result = confirm('이 글을 수정 하시겠습니까?');
			var str ='<div class="input-field col s4" style="margin-bottom:-20px; width: 20%;">'
				str +='<i class="material-icons prefix">security</i>'
				str +='<input id="password" name="password" type="password" class="validate" placeholder="비밀번호 입력">'
				str +='<label for="password">Password</label>'
				str +='</div>'
			if(result) { 
				$(".updateform").removeAttr("readonly");
				$("#icon_prefix2").contents().unwrap().wrap('<textarea id="icon_prefix2" class="materialize-textarea updateform" name="content" style="color:black; font-size:1.4em;margin-left:45px;margin-top:0px"></textarea>');
				$("#icon_prefix2").css("height",preheight);
				$(this).parent().hide();
				$("#imgbtn").show();
				$("#pass").append(str);
				$("#update").hide();
				$("#updateComplete").parent().show();
				$("#updateComplete").show();
			}
		});
	
		$("#list").click(function(){
			location.href="/controller/review/praha/reviewBoard";
		});
		
		$('.image-file').on("change", "input[type=file]", function() {
			var size = fileSize(this).toFixed(2)+"KB";
			var index = "#boardImg"+$(this).attr("class").substr(8,1);
			$(index).val(size);
		});
		
		$('#imgAdd').on("click", function() {
			if(count < 10) {
				var str = "<div class='file-field input-field'>";
				str += "<input type='file' name='file' class='boardImg"+count+"''>";
				str += "<div class='file-path-wrapper'>";
				str += "<input class='file-path validate' type='text' placeholder='이미지 파일을 추가해주세요.'>";
				str += "</div></div>";
				$('div.image-file').append(str);
				
				str = "<div  style='margin-top:14px'><input id='boardImg"+count+"' name='imageSize' type='text' class='validate' placeholder='이미지 크기' readonly></div>"; 
				$('div.image-file-size').append(str);
				count++;
			}else {
				Materialize.toast('이미지 파일은 10개까지 올릴 수 있습니다.', 3000, 'rounded');
		        var width = $("#toast-container").width();
		        $("#toast-container").css("margin-left", (width*-1)+209);
			}
		});
		
		$("#imgDelete").on("click", function() {
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
	
	
	function submit()
	{
	document.getElementById("reviewForm").submit();
	}
	
	</script>
	
	<jsp:include page="/WEB-INF/views/main/header.jsp"/>
	
	<main>
		<div class="container" style="margin-bottom:15px">
		<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notebook.png"/>' style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reviewLogo.jpg"/>'>
		</div>

		<form id="reviewForm" method="post" action="/controller/review/praha/reviewUpdate" enctype="multipart/form-data">
		<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s10">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate updateform" readonly="readonly" value="${reviewViewInfo.title}"style="font-size:28px;text-align:center;color:crimson;">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s2">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate updateform" readonly="readonly" value="${reviewViewInfo.writer}" >
							<label for="writer">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-top:-20px;margin-bottom:-15px">
				        <div class="input-field col s12">
				        <i class="material-icons prefix">mode_edit</i>
					        <pre id="icon_prefix2" class="materialize-textarea updateform" name="content" 
					         readonly="readonly" style="color:black; font-size:1.2rem;margin-left:45px;margin-top:0px">${reviewViewInfo.content}</pre>
				        </div>
			    	</div>
				</td></tr>
				<tr><td>
				<div class="row">
					<div>
					<c:if test="${reviewViewInfo.boardImg0 != 'null'}">
					<div class="input-field col s12" style="text-align:center">
					       <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg0}'/>"/>
					</div>
					</c:if>
				
					<c:if test="${reviewViewInfo.boardImg1 != 'null'}">
					<div class="input-field col s12" style="text-align:center">
					       <img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg1}'/>"/>
					</div>
					</c:if>
				
					<c:if test="${reviewViewInfo.boardImg2 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
					    	<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg2}'/>"/>
						</div>
					</c:if>

					<c:if test="${reviewViewInfo.boardImg3 != 'null'}">
			        	<div class="input-field col s12" style="text-align:center">
			            	<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg3}'/>"/>
						</div>
					</c:if>
					
					<c:if test="${reviewViewInfo.boardImg4 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg4}'/>"/>
						</div>
					</c:if>
						
					<c:if test="${reviewViewInfo.boardImg5 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg5}'/>"/>
						</div>
					</c:if>
						
					<c:if test="${reviewViewInfo.boardImg6 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg6}'/>"/>
						</div>
					</c:if>
						
					<c:if test="${reviewViewInfo.boardImg7 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg7}'/>"/>
						</div>
					</c:if>
						
					<c:if test="${reviewViewInfo.boardImg8 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg8}'/>"/>
						</div>
					</c:if>
						
					<c:if test="${reviewViewInfo.boardImg9 != 'null'}">
						<div class="input-field col s12" style="text-align:center">
							<img style="max-width:600px;" src="<c:url value='${reviewViewInfo.boardImg9}'/>"/>
						</div>
					</c:if>					
				</div>
			</div>
				</td></tr>
				<tr><td id="pass">

				</td></tr>
				<tr><td style="text-align:center">
				<div class="col s9" id="imgbtn" style="padding-bottom: 15px;">
				<a class="waves-effect waves-light btn color-500" id="imgAdd">이미지 추가</a>
				<a class="waves-effect waves-light btn color-500" id="imgDelete">이미지 삭제</a>
				</div>
				<div class="row">
				<div class="input-field col s8 image-file"></div>
				<div class="input-field col s4 image-file-size"></div>
				</div>
				</td></tr>
				<tr><td>
				<div class="row">
					<input type="hidden" id="boardNo" name="boardNo" value="${reviewViewInfo.boardNo}">
					<a class="waves-effect waves-light btn" type="button" id="list" >목록보기</a>
					<a class="waves-effect waves-light btn" type="button" id="delete">삭제</a>
					<a class="waves-effect waves-light btn" type="button" id="deletebtn">삭제</a>
					<a class="waves-effect waves-light btn" type="button" id="update">수정</a>
					<a href="#" onClick="submit(); return false;" class="waves-effect waves-light btn" id="updateComplete">완료</a>
				</div>	<!--  button -->
			</td></tr>
			</table>
		</form>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	
	</body>
