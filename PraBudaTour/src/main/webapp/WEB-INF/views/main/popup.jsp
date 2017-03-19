<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
<script type="text/javascript">
	$(function(){
		$("#parent").click(function(){
			window.opener.location.href="/controller/notice/praha/noticeBoard";
			window.close();
		});
	});

	
	function setCookie(name, value, expiredays){
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}

	function closePop(){
		setCookie("close20150406","close20150406",1);
		window.close();
	}


	</script>
	<body>
	<input type="hidden" id="boardNo" name="boardNo" value="${popup.boardNo}">
	<table style="position: fixed;top:-3px;left: -3px; ">
	<tr>
	<td colspan="2">
		<img style="cursor: pointer;" width="400" height="450" id="parent" src="<c:url value='${popup.popupImg}'/>"/>
	</td>
	</tr>
 	<tr>
    <td width="250" height="23" valign="top" >
 		<input type="checkbox" onClick="closePop();">오늘 하루 동안 열지 않음
	</td></tr>
	</table>
</body>
</html>