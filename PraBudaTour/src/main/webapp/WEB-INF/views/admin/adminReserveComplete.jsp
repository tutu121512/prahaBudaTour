<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="prahaBuda.tour.dto.*" %>
<% 
	PageDTO qpVO = (PageDTO)request.getAttribute("Qpage");
	PageDTO cpVO = (PageDTO)request.getAttribute("Cpage");

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
	
	$(".reserveNo").click(function(){
		$("#boardNo").val($(this).attr("id"));
		$.ajax({
			url : '/controller/admin/adminSelect',
			type : 'post',
			data : ({
				boardNo : $(this).attr("id"),
				boardState : $(this).attr("name")
			}),
			dataType : "text", // html / xml / json / jsonp / text
			success : function(data) {
				var boardDTO = eval("("+data+")");
				$("#title").val(boardDTO.writer+"님이 예약을 확정하셨습니다.");
				$("#writer").val(boardDTO.writer);
				$("#icon_prefix2").val(boardDTO.content);
				$("#startDate").val(boardDTO.startDate);
				$("#endDate").val(boardDTO.endDate);
				$("#product").val(boardDTO.product);
				$("#reserveBoardNo").val(boardDTO.boardNo);
				var str ='<input type="submit" value="확정하기" class="waves-effect waves-light btn" style="width:100%">'
				$("#writer").attr("name","reserveName");
				$("#submitBtn").empty();
				$("#submitBtn").append(str);
			},
			error : function(data) {
				console.log("에러발생");
			}
		});
	});	
	$("#delete").on("click", function() {
			if(count > 0) {
				$(".image-file").children(":last").remove();
				$(".image-file-size").children(":last").remove();
				count--;
			}
		});
		

		$(".questionDeleteBtn").click(function(){

			var result = confirm('이 글을 삭제 하시겠습니까?');
					
			if(result) { 
				alert("삭제되었습니다.");
				location.href="/controller/praha/adminReserveDelete?boardNo="+$(this).attr("id");				
				}
			});

		$(".completeDeleteBtn").click(function(){
			var result = confirm('이 글을 삭제 하시겠습니까?');
			
			if(result) { 
				alert("삭제되었습니다.");
				location.href="/controller/complete/praha/CompleteDelete?boardNo="+$(this).attr("id");				
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
	
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<main>
	  <div class="container">
	  <table style="margin-top:30px"><tr><td>
		<h2 style="padding-top:10px;margin:0px;padding-left:40px;">예약관리/확정등록</h2>
			<h5 style="float:right;color:darkorchid;">왼쪽 목록 ( 예약 문의 받은 요청 ) 을 눌러주시면 내용이 자동 완성됩니다.</h5>
	  </td></tr></table>
		<form method="post" action="/controller/complete/praha/CompleteInsert">
			<table style="margin-bottom:10px">
				<tr><td>
					<div class="row" style="margin-bottom:-20px">
						<div class="input-field col s8">
							<i class="material-icons prefix">title</i>
							<input id="title" name="title" type="text" class="validate" placeholder=" ">
							<label for="title">문의 제목</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">supervisor_account</i>
							<input id="writer" name="writer" type="text" class="validate" placeholder=" " disabled="disabled">
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
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_takeoff</i>
							<input id="startDate" name="startDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160213">
							<label for="startDate">희망 입실날짜</label>
				        </div>
				        <div class="input-field col s6" style="margin-bottom:-20px">
							<i class="material-icons prefix">flight_land</i>
							<input id="endDate" name="endDate" type="text" class="validate" placeholder="입력예시 : 17년 2월 17일 => 160217">
							<label for="endDate">퇴실날짜</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
						<div class="input-field col s8">
							<i class="material-icons prefix">card_giftcard</i>
							<input id="product" name="product" type="text" class="validate" placeholder="프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요 - 100자이내">	
							<label for="product">신청상품(프라하만의 혜택 상품들!! 공지사항을 꼭 확인해주세요) - 100자이내</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="password" name="password" type="password" class="validate" placeholder="4자리만 입력가능" maxlength="4">
							<label for="password">Password</label>
						</div>
					</div>
				</td></tr>
				<tr><td>
					<div class="row">
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="peopleNumber" name="peopleNumber" type="text" class="validate" placeholder="인원수" maxlength="4" value='0'>
							<label for="peopleNumber">인원수</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="price" name="price" type="text" class="validate" placeholder="금액">
							<label for="price">금액</label>
						</div>
						<div class="input-field col s4" style="margin-bottom:-20px">
							<i class="material-icons prefix">security</i>
							<input id="roomName" name="roomName" type="text" class="validate" placeholder="방이름">
							<label for="roomName">방이름</label>
						</div>
					</div>
				</td>
				</tr>				
				<tr><td style="text-align:center">
					<div class="row" id="submitBtn">
					</div>
				</td></tr>
			</table>
			<input type="hidden" name="boardNo" id="boardNo" value="">
			<input type="hidden" name="reserveBoardNo" id="reserveBoardNo" value="">
		</form>
		
		
		<!-- 왼쪽 목록  -->
		<div style="width:48%;float:left;">
		 <ul id="ListandView" class="collapsible" data-collapsible="accordion" style="border-style:hidden;box-shadow:none;">
		 <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:brown;border-radius:27px;height:45px;color:aliceblue;">
			  	<table class="centered">
			  	<tbody id="collection-item">
			    <tr><td style="width:85%;padding-top:2px" class="centered">
			    	에약 문의 받은 요청
			    </td></tr>
			    </tbody>
			    </table>
			    </div>
			  </li>  
		 <c:forEach items="${list}" var="list">
			  <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:coral;border-radius:27px;height:55px;">
			  	<table>
			  	<tbody id="collection-item">
			  	<tr class="reserveNo" id="${list.boardNo}" name="${list.boardState}"><td style="width:10%;padding-bottom:0px;">
			    <img src="<c:url value='/resources/images/logo.jpg'/>" style="max-width:75px;">
			    </td><td style="width:85%;padding-top:2px">
			    <div>${list.title}</div>
			    </td><td style="padding-top:3px;">
			    <a href="#"><i class="material-icons prefix questionDeleteBtn" id="${list.boardNo}" style="color:white">delete</i></a></td></tr>
			    </tbody>
			    </table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
		
		<ul class="pagination" style="float:left;margin-top:0px;padding-left:30%">
			<li class="page-item">
				<a href="/controller/admin/adminReserveComplete?Qpage=<%=qpVO.getPreviPage()%>&boardState=reserveQuestion">
			    <i class="material-icons">chevron_left</i>
			     </a>
			   </li>
			   <%for(int i=qpVO.getStartPage(); i <= qpVO.getEndPage() ; i++) {%>
			   <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/admin/adminReserveComplete?Qpage=<%=i%>&boardState=reserveQuestion"><%=i %></a></li>
			   <%} %>
			   <li class="page-item">
				<a href="/controller/admin/adminReserveComplete?Qpage=<%=qpVO.getNextPage()%>&boardState=reserveQuestion">
			    <i class="material-icons">chevron_right</i>
		       </a>
		   </li>
		</ul>
		</div>
		
		<!-- ----------------------------------------------------------------------------------------------------- -->

		<div style="width: 48%; float: right;">
		 <ul id="ListandView" class="collapsible" data-collapsible="accordion" style="border-style:hidden;box-shadow:none">  
			 <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:slateblue;border-radius:27px;height:45px;color:aliceblue;">
			  	<table class="centered">
			  	<tbody id="collection-item">
			    <tr><td style="width:85%;padding-top:2px" class="centered">
			    	예약 확정 리스트
			    </td></tr>
			    </tbody>
			    </table>
			    </div>
			  </li>
		 <c:forEach items="${completelist}" var="completelist">
			  <li style="margin-bottom:6px">
			    <div class="collapsible-header" style="font-size:20px;background-color:darkorange;border-radius:27px;">
			  	<table>
			  	<tbody id="headerContent">
			  	<tr><td style="width:10%;padding-bottom:0px;padding-top:1rem">
			    <img src="<c:url value='/resources/images/logo.jpg'/>" style="max-width:75px">
			    </td><td style="width:85%">
			    <div>${completelist.title}</div>
			    </td><td>
			    <a href="#"><i class="material-icons prefix completeDeleteBtn" id="${completelist.boardNo}">delete</i></a></td></tr>
			    </tbody>
			    </table>
			    </div>
			    
			    <div class="collapsible-body" style="background-color:antiquewhite;border-radius:25px;">
			    <table>
			    <tbody id="bodyContent">
			    <tr>
			    <td><pre>${completelist.reserveName} 님
즐겨찾기 게스트하우스에 관심가져 주셔서 감사합니다.
문의 하신 ${completelist.startDate}~${completelist.endDate} 날짜에 예약확정 되셨습니다.
예약사항을 확인하시고 변경사항이 있으시면 언제든지 카톡남겨주시기 바랍니다.
아름다운 프라하에서 즐겨찾기와 함께 행복한 시간이 되기를 바랍니다 ^^
			    </pre>
			    <img style="padding-left:22%" src="<c:url value='/resources/images/favicon.png'/>">
			    </td>
			    </tr>
			    </tbody>
			    </table>
			    </div>
			  </li>
		  </c:forEach>
		</ul>
		
		<ul class="pagination" style="float:left;margin-top:0px;padding-left:35%;">
			<li class="page-item">
				<a href="/controller/admin/adminReserveComplete?Cpage=<%=cpVO.getPreviPage()%>">
			    <i class="material-icons">chevron_left</i>
			     </a>
			   </li>
			   <%for(int i=cpVO.getStartPage(); i <= cpVO.getEndPage() ; i++) {%>
			   <li class="waves-effect" id="page<%=i%>"><a class="page-link" href="/controller/admin/adminReserveComplete?Cpage=<%=i%>"><%=i %></a></li>
			   <%} %>
			   <li class="page-item">
				<a href="/controller/admin/adminReserveComplete?Cpage=<%=cpVO.getNextPage()%>">
			    <i class="material-icons">chevron_right</i>
		       </a>
		   </li>
		</ul>
		</div>


		
	  </div>	<!-- container -->
	
	
	</main>
	</body>
</html>