<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
<script type="text/javascript">
	$(function(){
		$("#parent").click(function(){
			window.opener.location.href="/controller/notice/praha/noticeView?boardNo="+$("#boardNo").val();
			window.close();
		});
	});
</script>
<body>
	<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}">
	<img style="position: fixed;top: 0;left: 0;" width="400" height="450" id="parent" src="<c:url value='/resources/images/1.jpg'/>"/>
		
</body>
</html>