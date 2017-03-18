<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO pVO = (PageDTO)request.getAttribute("page");
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
			str += "<input class='file-path validate' type='text' placeholder='이미지 파일 추가 (이 부분을 클릭하세요.)'>";
			str += "</div></div>";
			$('div.image-file').append(str);
			
			str = "<div  style='margin-top:14px'><input id='boardImg"+count+"' name='imageSize' type='text' class='validate' placeholder='이미지 크기 (자동으로 보여지는 부분입니다)' readonly></div>"; 
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
		
		$(".deleteBtn").click(function(){
			var result = confirm('이 글을 삭제 하시겠습니까?');
			
			if(result) { 
				alert("삭제되었습니다.");
				location.href="/controller/notice/praha/NoticeDelete?boardNo="+$(this).attr("id")+"&page="+$(this).attr("name");
			}
		});
		
		$(".updateBtn").click(function(){
			var boardNo = $(this).attr("id");
			var boardState = $(this).attr("name");
			$("#noticeInsert").attr("action","/controller/admin/adminUpdate");
			
			$.ajax({
				url : '/controller/admin/adminSelect',
				type : 'post',
				data : ({
					boardNo : boardNo,
					boardState : boardState
				}),
				dataType : "text", // html / xml / json / jsonp / text
				success : function(data) {
					var boardDTO = eval("("+data+")");
					$("#title").val(boardDTO.title);
					$("#writer").val(boardDTO.writer);
					$("#icon_prefix2").val(boardDTO.content);
					$("#boardNo").val(boardDTO.boardNo);
					$("#boardState").val(boardDTO.boardState);
				},
				error : function(data) {
					console.log("에러발생");
				}
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

	  <div class="container">
	  <table style="margin-top:30px"><tr><td>
			<img src='<c:url value="/resources/images/noticePlus.png"/>' style="width:28%">
	  </td></tr></table>
		<form id="noticeInsert" action="/controller/notice/praha/NoticeInsert" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="boardNo" id="boardNo">
		
		<input type="hidden" name="boardState" id="boardState">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate" placeholder="관심을 끌수 있는 제목으로 적어주세요">
							<label for="title" style="font-size: large;">혜택 타이틀</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate" value="관리자">
							<label for="writer" style="font-size: large;">작성자</label>
				        </div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row" style="margin-bottom:-30px">
						<div class="input-field col s12">
							<i class="material-icons prefix">mode_edit</i>
							<textarea id="icon_prefix2" class="materialize-textarea" name="content" placeholder="방문자들이 이해하기 쉽게 설명해주세요"></textarea>
							<label for="icon_prefix2" style="font-size: large;">혜택 내용 (자세하게 입력해주세요)</label>
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
						<input class="waves-effect waves-light btn" style="width:100%" type="submit" value="추가">
					</div>
				</td></tr>
			</table>
		</form>
	
		 <ul id="ListandView" class="collapsible" data-collapsible="accordion" style="border-style:hidden;box-shadow:none">  
		 <c:forEach items="${noticeList}" var="list">
			  <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:burlywood;border-radius:27px;">
			  	<table>
			  	<tbody id="headerContent">
			  	<tr><td style="width:10%;padding-bottom:0px;padding-top:1rem">
			  	<c:if test="${list.boardImg0 ne 'null'}">
			    <img src="<c:url value='${list.boardImg0}'/>" style="max-width:75px">
			    </c:if>
			    </td><td style="width:85%">
			    <div>${list.title}</div>
			    </td><td>
			    <a href="#"><i class="material-icons prefix deleteBtn" id="${list.boardNo}" name="<%=pVO.getCurPage()%>">delete</i></a></td></tr>
			    </tbody>
			    </table>
			    </div>
			    
			    
			    <div class="collapsible-body" style="background-color:antiquewhite;border-radius:25px;">
			     <table>
			    <tbody id="bodyContent">
			    <tr>
			    <td rowspan="3">
			    	<pre  class="materialize-textarea" style="word-break:break-all; white-space:pre-wrap;">${list.content}</pre>
			    </td>
				</tr>
			    </tbody>
			    </table>
			    
			    <table class="centered">
						<tr>
						<td class="centered">
							<c:if test="${list.boardImg0 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg0}'/>"/>
								<%-- ${fn:split(fn:substring(list.boardImg1,33,fn:length(list.boardImg1)),'.')[0]} --%>
							</c:if>
							<c:if test="${list.boardImg1 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg1}'/>"/>
							</c:if>
							<c:if test="${list.boardImg2 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg2}'/>"/>
							</c:if>
							<c:if test="${list.boardImg3 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg3}'/>"/>
							</c:if>
							<c:if test="${list.boardImg4 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg4}'/>"/>
							</c:if>
							<c:if test="${list.boardImg5 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg5}'/>"/>
							</c:if>
							<c:if test="${list.boardImg6 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg6}'/>"/>
							</c:if>
							<c:if test="${list.boardImg7 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg7}'/>"/>
							</c:if>
							<c:if test="${list.boardImg8 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg8}'/>"/>
							</c:if>
							<c:if test="${list.boardImg9 ne 'null'}">
								<img height="130px" style="max-heigth:600px;" class="materialboxed"  src="<c:url value='${list.boardImg9}'/>"/>
							</c:if>
						</td>
						</tr>
						<tr><td><input type="button" id="${list.boardNo}" name="${list.boardState}" class="waves-effect waves-light btn updateBtn" value="수정"></td></tr>
					</table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
	
	<ul class="pagination" style="float:left;margin-top:0px;padding-left:35%;">
			<li class="page-item">
				<a href="/controller/admin/adminNoticeList?page=<%=pVO.getPreviPage()%>">
			    <i class="material-icons">chevron_left</i>
			     </a>
			   </li>
			   <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
			   <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/admin/adminNoticeList?page=<%=i%>"><%=i %></a></li>
			   <%} %>
			   <li class="page-item">
				<a href="/controller/admin/adminNoticeList?page=<%=pVO.getNextPage()%>">
			    <i class="material-icons">chevron_right</i>
		       </a>
		   </li>
		</ul>
	
	  </div>	<!-- container -->
	
	
	</main>
	</body>
</html>