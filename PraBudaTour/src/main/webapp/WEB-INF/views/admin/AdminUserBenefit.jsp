<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO pVO = (PageDTO)request.getAttribute("page");
	List<BoardDTO> review = (List<BoardDTO>)request.getAttribute("reviewList");
	List<BoardDTO> reserve = (List<BoardDTO>)request.getAttribute("reserveList");
	List<BoardDTO> notice = (List<BoardDTO>)request.getAttribute("noticetList");
%>
<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
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
		var index = "#boardImg"+$(this).attr("class").substr(8,1);
		$(index).val(size);
	});
	
	$('#add').on("click", function() {
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
	
		$("#delete").on("click", function() {
			if(count > 0) {
				$(".image-file").children(":last").remove();
				$(".image-file-size").children(":last").remove();
				count--;
			}
		});
		
		$("#InsertBtn").click(function(){
			var form = $('form')[0];
	        var formData = new FormData(form);
			 $.ajax({
	 					type : "POST",
	 		            processData: false,
	 	                contentType: false,
	 					url : "/controller/userBenefit/praha/serviceInsert",
	 					enctype: "multipart/form-data",
	 					data : formData,
	 					success : alert("성공"),
	 					error : alert("실패")
			}); 
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
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>

	  <div class="container" style="margin-left:25%">
		<form id="serviceInsert" method="post" enctype="multipart/form-data">
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
				<tr><td style="text-align:center">
					<div class="col s9">
						<a class="waves-effect waves-light btn color-500" id="add">이미지 추가</a>
						<a class="waves-effect waves-light btn color-500" id="delete">이미지 삭제</a>
					</div>
				</td></tr>
				<tr><td class="centered">
				<div class="row">
					<div class="input-field col s8 image-file">
					</div>
					<div class="input-field col s4 image-file-size">
					</div>
				</div>
					<div class="row">
						<input id="InsertBtn" type="button" value="추가" class="waves-effect waves-light btn" style="width:100%">
					</div>
				</td></tr>
			</table>
		</form>
	
		 <ul class="collapsible" data-collapsible="accordion">  
		 <c:forEach items="${userBenefitList}" var="list">
			  <li>
			    <div class="collapsible-header" style="height: 65px;font-size: 30px;">
			    <i class="material-icons" style="width:80px;">
			    <img style="width:100%" src="<c:url value='${list.boardImg0}'/>">
			    </i><div style="padding-top:10px;">${list.title}</div></div>
			    <div class="collapsible-body">
			    <table>
			    <tr>
			    <td rowspan="3" width="70%"><pre>${list.content}</pre></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    
			    <tr>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    
			    <tr>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    <td width="10%"><img width="100%" src="<c:url value='/resources/images/logo.jpg'/>"></td>
			    </tr>
			    </table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
	
	  </div>	<!-- container -->
	
	
	</main>
	<div style="margin-left: 307px;">
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
	</body>
</html>