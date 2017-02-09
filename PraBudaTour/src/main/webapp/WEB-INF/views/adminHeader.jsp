<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<nav>
  <div class="nav-wrapper">
	<a href="/controller/praha/prahaMain"><img src='<c:url value="/resources/images/logo.jpg"/>' id="logo"></a>
    <ul class="right hide-on-med-and-down">
	  <li><a href="">1:1 답변</a></li>
      <li><a class="dropdown-button" href="#" data-activates="roomShow">예약 확정</a></li>
      <li><a class="dropdown-button" href="#"  data-activates="guide">여행 정보</a></li>
      <li><a class="dropdown-button" href="#"  data-activates="reserve">공지사항</a></li>
    </ul>
  </div>
</nav>