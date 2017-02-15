<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	   <!--Import Google Icon Font-->
	   <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	   <!--Import materialize.css-->
	   <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
	   <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>	    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>

<!DOCTYPE html>
<html>
	<ul id="nav-mobile" class="side-nav fixed" style="transform: translateX(0px);">
        <li class="logo"><a id="logo-container" href="http://materializecss.com/" class="brand-logo">
            <object id="front-page-logo" type="image/svg+xml" data="res/materialize.svg">Your browser does not support SVG</object></a></li>
        <li class="search">
          <div class="search-wrapper card">
            <input id="search"><i class="material-icons">search</i>
            <div class="search-results"></div>
          </div>
        </li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">게시판</a>
            </li>
          </ul>
        </li>

        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">여행정보</a>
            </li>
          </ul>
        </li>


        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a class="collapsible-header  waves-effect waves-teal">공지사항</a>
            </li>
          </ul>
        </li>
      </ul>
      
    <div class="container" style="margin-left: 25%">
  <ul class="collapsible popout" data-collapsible="accordion">  
  
  <li>
    <div style="padding:0px">
    <table class="centered">
    	<tr>
    		<td class="centered" style="width:5%">
    			<label style="font-size:1.3rem">선택</label>
    		</td>
    		<td class="centered" style="width:5%">
    			<label style="font-size:1.3rem">번호</label>
    		</td>
    		<td class="centered" style="width:55%">
    			<label style="font-size:1.3rem">제목</label>
    		</td>
			<td class="centered" style="width:10%">
    			<label style="font-size:1.3rem">작성자</label>
    		</td>
			<td class="centered" style="width:15%">
    			<label style="font-size:1.3rem">작성일자</label>
    		</td>
    		<td class="centered" style="width:10%">
    			<label style="font-size:1.3rem">종류</label>
    		</td>
    	</tr>
    </table>
    </div>
  </li>

	<c:forEach items="${totalList}" var ="list">
	<li>
    <div class="collapsible-header" style="padding:0px">
    <table class="centered">
    	<tr>
    		<td class="centered" style="width:5%">
		    	<input type="checkbox" class="filled-in" id="filled-in-box" checked="checked"/>
    			<label style="font-size:0rem;margin-left: 9px;margin-right: -8px;"></label>
    		</td>
    		<td class="centered" style="width:5%">
    			<label style="font-size:1.3rem">${list.boardNo}</label>
    		</td>
    		<td class="centered" style="width:55%">
    			<label style="font-size:1.3rem">${list.title}</label>
    		</td>
			<td class="centered" style="width:10%">
    			<label style="font-size:1.3rem">${list.writer}</label>
    		</td>
			<td class="centered" style="width:15%">
    			<label style="font-size:1.3rem">${list.boardDate}</label>
    		</td>
    		<td class="centered" style="width:10%">
    			<label style="font-size:1.3rem">
    			<c:choose>    			
    			<c:when test="${list.boardState eq 'notice'}">
    			후기
    			</c:when>
    			</c:choose>
    			</label>
    		</td>
    	</tr>
    </table>
    </div>
    <div class="collapsible-body"><p>${list.content}</p></div>
  </li>
  </c:forEach>
</ul>
</div>
</html>