<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<script>
$(".dropdown-button").dropdown();
</script>

<ul id="roomShow" class="dropdown-content">
	<li><a href="#!" style="background-color:#ee6e73;color:white">둘러보기</a></li>
	<li><a href="/controller/praha/karelRoom">까르를교</a></li>
	<li><a href="/controller/praha/prahaRoom">프라하성</a></li>
	<li><a href="/controller/praha/bachlRoom">바츨라프</a></li>
	<li><a href="/controller/praha/publicRoom">공용공간</a></li>
</ul>

<ul id="guide" class="dropdown-content">
	<li><a href="#!" style="background-color:#ee6e73;color:white">이용안내</a></li>
	<li><a href="/controller/praha/prahaServiceBoard">이용혜택</a></li>
	<li><a href="/controller/praha/onTheRoad">오시는길</a></li>
</ul>

<ul id="reserve" class="dropdown-content">
	<li><a href="#!" style="background-color:#ee6e73;color:white">예약</a></li>
	<li><a href="/controller/praha/usePrice">예약안내</a></li>
	<li><a href="/controller/praha/reserveBoard">예약문의</a></li>
	<li><a href="/controller/complete/praha/completeBoard">예약확정</a></li>
	<li style="display:none"><a href="/controller/complete/praha/completeCalendar">예약현황</a></li>
</ul>

<ul id="community" class="dropdown-content" style="top:25px!important">
	<li><a href="#!" style="background-color:#ee6e73;color:white">커뮤니티</a></li>
	<li><a href="/controller/notice/praha/noticeBoard">공지사항</a></li>
	<li><a href="#!">여행정보</a></li>
	<li><a href="/controller/review/praha/reviewBoard">후 기</a></li>
</ul>						

<nav>
  <div class="nav-wrapper">
	<a href="/controller/praha/prahaMain"><img src='<c:url value="/resources/images/logo.jpg"/>' id="logo"></a>
    <ul class="right hide-on-med-and-down">
	  <li><a href="/controller/praha/prahaGreetings">인사말</a></li>
      <li><a class="dropdown-button" href="#" data-activates="roomShow">둘러보기<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="guide">이용안내<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="reserve">예 약<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="community">커뮤니티<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a href="/controller/shuttle/praha/shuttleBoard">셔틀문의</a></li>
      <li><a href="#">   </a></li>
    </ul>
  </div>
</nav>

<span id="carbonads" class="carbon-wrap" style="max-width: 150px; display: inline-block; position: fixed; text-align: left; -webkit-font-smoothing: antialiased; top: 150px;z-index: 9999;">
<img src='<c:url value="/resources/images/kakao.jpg"/>'height="100" width="130" style="max-width: 130px; ">
</span>
