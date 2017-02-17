<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<ul id="nav-mobile" class="side-nav fixed" style="transform: translateX(0px);">
        <li class="logo">
            <object id="front-page-logo" type="image/svg+xml" data="res/materialize.svg">
			<img width="300px;" src="<c:url value='/resources/images/logo.jpg'/>">
            </object>
            </li>
        <li class="no-padding" style="margin-bottom: 30px; margin-top: 10px;">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a style="font-size: 35px;" href="/controller/admin/totalBoard" class="collapsible-header  waves-effect waves-teal">게시판 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding" style="margin-bottom: 30px; margin-top: 10px;">
           <ul class="collapsible collapsible-accordion">
            <li class="bold"><a style="font-size: 35px;" class="collapsible-header  waves-effect waves-teal">예약 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding" style="margin-bottom: 30px; margin-top: 10px;">
           <ul class="collapsible collapsible-accordion">
            <li class="bold"><a style="font-size: 35px;" class="collapsible-header  waves-effect waves-teal">여행정보 관리</a>
            </li>
          </ul>
        </li>

       <li class="no-padding" style="margin-bottom: 30px; margin-top: 10px;">
           <ul class="collapsible collapsible-accordion">
            <li class="bold"><a style="font-size: 35px;" class="collapsible-header  waves-effect waves-teal">공지사항 관리</a>
            </li>
          </ul>
        </li>
        
       <li class="no-padding" style="margin-bottom: 30px; margin-top: 10px;">
           <ul class="collapsible collapsible-accordion">
            <li class="bold"><a style="font-size: 35px;" href="/controller/admin/AdminUserBenefit" class="collapsible-header  waves-effect waves-teal">이용혜택 관리</a>
            </li>
          </ul>
        </li>

      </ul>
 