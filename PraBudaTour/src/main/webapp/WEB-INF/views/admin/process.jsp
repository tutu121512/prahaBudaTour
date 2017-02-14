<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>

<%! 
boolean isset(String str)
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
if(!isset(request.getParameter("admin_Id")))
{
	out.println("<p align=\"center\">ID가 입력되지 않았습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">로그인하기</a></p>");
	return;
}

if(!isset(request.getParameter("admin_Password")))
{
	out.println("<p align=\"center\">암호가 입력되지 않았습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">로그인하기</a></p>");
	return;
}

//미리 정의된 ID와 암호
String admin_Id = "admin";
String admin_Password ="password";

//ID 잘못 입력 시
if(!request.getParameter("admin_Id").equals(admin_Id))
{
	out.println("<p align=\"center\">ID가 일치하지 않습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">다시 로그인하기</a></p>");
	return;
}

//암호 잘못 입력 시
else if(!request.getParameter("admin_Password").equals(admin_Password))
{
	out.println("<p align=\"center\">암호가 일치하지 않습니다.</p>");
	out.println("<p align=\"center\"><a href=\"admin.jsp\">다시 로그인하기</a></p>");
	return;
}
//로그인 성공
else
{
	out.println("<p align=\"center\">로그인 성공</p>");
	out.println("<p align=\"center\"><a href=\"NoticeList.jsp\">회원 페이지</a></p>");

    session.setAttribute("admin_id", request.getParameter("admin_id"));
    session.setAttribute("admin_password",request.getParameter("admin_password"));
}
   %>


</body>
</html>