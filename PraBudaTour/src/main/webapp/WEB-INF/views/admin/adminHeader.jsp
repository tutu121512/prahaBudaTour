<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<ul id="nav-mobile" class="side-nav fixed" style="transform: translateX(0px);">
        <li class="logo"><a id="logo-container" href="http://materializecss.com/" class="brand-logo">
            <object id="front-page-logo" type="image/svg+xml" data="res/materialize.svg">Your browser does not support SVG</object></a></li>
        <li class="no-padding">
          <ul class="collapsible collapsible-accordion">
            <li class="bold"><a href="/controller/admin/totalBoard" class="collapsible-header  waves-effect waves-teal">게시판</a>
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
 