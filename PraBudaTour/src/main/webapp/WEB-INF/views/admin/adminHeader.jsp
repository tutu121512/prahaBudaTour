<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<ul id="nav-mobile" class="side-nav fixed" style="transform:translateX(0px);background-color:black;width:175px;font-family:'배달의민족 도현'">
        <li class="logo">
			<img src="<c:url value='/resources/images/adminLogo.png'/>">
            </li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:20px;color:white" href="/controller/admin/totalBoard" class="collapsible-header waves-effect waves-teal">게시판 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:20px;color:white" class="collapsible-header  waves-effect waves-teal">예약 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:20px;color:white" class="collapsible-header  waves-effect waves-teal">여행정보 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:20px;color:white" class="collapsible-header  waves-effect waves-teal">공지사항 관리</a>
            </li>
          </ul>
        </li>
        
       <li class="no-padding">
           <ul class="collapsible collapsible-accordion">
            <li class="bold">
            <a style="font-size:20px;color:white" href="/controller/admin/AdminUserBenefit" class="collapsible-header  waves-effect waves-teal">이용혜택 관리</a>
            </li>
          </ul>
        </li>

      </ul>
 