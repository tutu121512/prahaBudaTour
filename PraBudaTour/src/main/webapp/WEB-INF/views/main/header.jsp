<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<script>
$(".dropdown-button").dropdown();
</script>
<style>
.dropdown-content li a{
	line-height:10px;
}
</style>

<ul id="roomShow" class="dropdown-content">
	<li><a href="#!" style="background-color:brown;color:white;font-size:15px">프라하1호점</a></li>
	<li><a href="/controller/praha/prahaRoomInfo/karelRoom" >까르를교</a></li>
	<li><a href="/controller/praha/prahaRoomInfo/prahaRoom" >프라하성</a></li>
	<li><a href="/controller/praha/prahaRoomInfo/bachlRoom" >바츨라프</a></li>
	<li><a href="/controller/praha/prahaRoomInfo/publicRoom" >공용공간</a></li>
	<li><a href="#!" style="background-color:orangered;color:white">부다패스트</a></li>
	<li><a href="/controller/praha/budapestRoomInfo/budaRoom" >부다</a></li>
	<li><a href="/controller/praha/budapestRoomInfo/pestRoom" >페스트</a></li>
	<li><a href="/controller/praha/budapestRoomInfo/publicRoomT" >공용공간</a></li>
	<li><a href="#!" style="background-color:tomato;color:white">프라하 별관</a></li>
	<li><a href="/controller/praha/annexRoomInfo/annexRoom" >별관 룸</a></li>
	<li><a href="/controller/praha/annexRoomInfo/publicRoomA" >공용공간</a></li>
</ul>

<ul id="guide" class="dropdown-content">
	<li><a href="#!" style="background-color:brown;color:white;font-size:15px">프라하1호점</a></li>
	<li><a href="/controller/userBenefit/praha/userBenefitBoard?location=P" >이용혜택</a></li>
	<li><a href="/controller/praha/prahaUseGuide/onTheRoad" >오시는길</a></li>
	<li><a href="#!" style="background-color:orangered;color:white">부다페스트</a></li>
	<li><a href="/controller/userBenefit/praha/userBenefitBoard?location=B" >이용혜택</a></li>
	<li><a href="#" onclick="alert('준비중입니다. 카카오톡으로 연락주세요');" >오시는길</a></li>
	<li><a href="#!" style="background-color:tomato;color:white">프라하 별관</a></li>
	<li><a href="/controller/userBenefit/praha/userBenefitBoard?location=A" >이용혜택</a></li>
	<li><a href="#" onclick="alert('준비중입니다. 카카오톡으로 연락주세요');" >오시는길</a></li>	
</ul>

<ul id="reserve" class="dropdown-content">
	<li><a href="/controller/praha/prahaReserve/usePrice" >예약안내</a></li>
	<li><a href="/controller/praha/reserveBoard" >예약문의</a></li>
	<li><a href="/controller/complete/praha/completeBoard" >예약확정</a></li>
	<li style="display:none"><a href="/controller/complete/praha/completeCalendar" >예약현황</a></li>
</ul>

<ul id="tourInfo" class="dropdown-content">
	<li><a href="/controller/tourInfo/tourInfoSelect?location=P" style="line-height:13px;background-color:brown;color:white">1호점/별관</a></li>
	<li><a href="/controller/tourInfo/tourInfoSelect?location=B" style="line-height:13px;background-color:orangered;color:white">부다페스트</a></li>
</ul>

<ul id="community" class="dropdown-content">
	<li><a href="/controller/notice/praha/noticeBoard" >공지사항</a></li>
	<li><a href="/controller/review/praha/reviewBoard" >후 기</a></li>
</ul>						

<nav>
  <div class="nav-wrapper">
	<a href="/controller/praha/prahaMain"><img src='<c:url value="/resources/images/logo.jpg"/>' id="logo"></a>
    <ul class="right hide-on-med-and-down">
	  <li><a href="/controller/praha/prahaGreetings/prahaGreetings">인사말</a></li>
      <li><a class="dropdown-button" href="#" data-activates="roomShow">둘러보기<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="guide">이용안내<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="reserve">예&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#" data-activates="tourInfo">여행정보<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a class="dropdown-button" href="#"  data-activates="community">커뮤니티<i class="material-icons right">arrow_drop_down</i></a></li>
      <li><a href="/controller/shuttle/praha/shuttleBoard">셔틀문의</a></li>
      <li><a href="#"></a></li>
    </ul>
  </div>
</nav>

<span id="carbonads" class="carbon-wrap" style="position:fixed;top:50%;z-index:9999;margin-right:-200px;left:90%">
<img src='<c:url value="/resources/images/navigatorLogo.gif"/>' style="width:45%">
</span>
