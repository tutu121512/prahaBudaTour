<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%! boolean isset(String str)
{
	if(str == null) return false;
	if(str.equals("")) return false;
	return true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
if(!isset(request.getParameter("admin_id")))
{
	out.println("<p align=\"center\">ID가 입력되지 않았습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">로그인하기</a></p>");
	return;
	
if(!isset(request.getparameter("admin_password")))
{
	out.println("<p align=\"center\">암호가 입력되지 않았습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">로그인하기</a></p>");
	return;
}

String adminId = "admin";
String adminPassword ="password";

if(!request.getParameter("adminId").equals(adminId))
{
	out.println("<p align=\"center\">ID가 일치하지 않습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">다시 로그인하기</a></p>");
	return;
}
else if(!request.getParameter("adminPassword").equals(adminPassword))
{
	out.println("<p align=\"center\">암호가 일치하지 않습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">다시 로그인하기</a></p>");
	return;
}
}
%>
</body>
</html>