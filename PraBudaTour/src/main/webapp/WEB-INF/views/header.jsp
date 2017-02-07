<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<script>
$(".dropdown-button").dropdown();
</script>

<ul id="roomShow" class="dropdown-content">
  <li><a href="#!">까르를교</a></li>
  <li><a href="#!">프라하성</a></li>
  <li><a href="#!">바츨라프</a></li>
  <li><a href="#!">공용공간</a></li>
</ul>

<ul id="guide" class="dropdown-content">
  <li><a href="#!">이용금액</a></li>
  <li><a href="#!">이용혜택</a></li>
  <li><a href="#!">오시는길</a></li>
</ul>

<ul id="reserve" class="dropdown-content">
  <li><a href="#!">예약안내</a></li>
  <li><a href="#!">예약현황</a></li>
  <li><a href="#!">예약문의</a></li>
  <li><a href="#!">예약확정</a></li>
</ul>

<ul id="community" class="dropdown-content">
  <li><a href="#!">공지사항</a></li>
  <li><a href="#!">자유게시판</a></li>
  <li><a href="#!">후 기</a></li>
</ul>

<nav>
  <div class="nav-wrapper">
	<img src='<c:url value="/resources/images/logo.jpg"/>' id="logo">
    <ul class="right hide-on-med-and-down">
	  <li><a href="/" class="brand-logo center">Praha</a></li>
      <li><a href="sass.html">메인</a></li>
      <li><a class="dropdown-button" href="#" data-activates="roomShow">둘러보기<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="guide">이용안내<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="reserve">예 약<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="community">커뮤니티<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a href="badges.html">셔틀문의</a></li>
      <li><a href="#">   </a></li>
    </ul>
  </div>
</nav>