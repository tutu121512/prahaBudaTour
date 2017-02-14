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


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout</title>
</head>
<body>
<% session.invalidate(); %>
<p align="center">로그아웃되었습니다.</p>
<p align="center"><a href="admin.jsp">로그인하기</a>
</body>
</html>