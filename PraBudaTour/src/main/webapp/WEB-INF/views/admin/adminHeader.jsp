<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
</head>
<title>저희를 관리해 주세요</title>
	<body>
  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.js"/>'></script>
  <!-- <script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/js/materialize.min.js"></script>
  
  <ul id="nav-mobile" class="side-nav fixed" style="transform:translateX(-50px);background-color:black;width:135px;font-family:'배달의민족 도현'">
        <li class="logo">
			<img src="<c:url value='/resources/images/adminLogo.png'/>">
            </li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:15px; color:white" href="/controller/admin/totalBoard" class="collapsible-header waves-effect waves-teal">게시판 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a href="/controller/admin/adminReserveComplete" style="font-size:10px;color:white" class="collapsible-header  waves-effect waves-teal">예약 관리/확정</a>
            </li>
          </ul>
        </li>
        
        <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a href="/controller/admin/adminReserveCompleteInsert" style="font-size:10px;color:white" class="collapsible-header  waves-effect waves-teal">예약 확정(수기)</a>
            </li>
          </ul>
        </li>
        

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a href="/controller/admin/adminTourInfo?location=P" style="font-size:10px;color:white" class="collapsible-header  waves-effect waves-teal">여행정보 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a href="/controller/admin/adminNoticeList" style="font-size:10px;color:white" class="collapsible-header  waves-effect waves-teal">공지사항 관리</a>
            </li>
          </ul>
        </li>
        
       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">											
            <a style="font-size:10px;color:white" href="/controller/admin/adminUserBenefit?location=P" class="collapsible-header  waves-effect waves-teal">이용혜택 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">											
            <a style="font-size:10px;color:white" href="/controller/admin/adminPopup" class="collapsible-header  waves-effect waves-teal">팝업 관리</a>
            </li>
          </ul>
        </li>

      </ul>
      </body>
 </html>