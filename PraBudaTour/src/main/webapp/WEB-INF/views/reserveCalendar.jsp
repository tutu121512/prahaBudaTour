<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="prahaBuda.tour.dto.*" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Object obj = request.getAttribute("CalendarList");
	List<ReserveCompleteDTO> reserveCompleteDTO=null;
	if(obj!=null){
	reserveCompleteDTO = (List<ReserveCompleteDTO>)obj; 
	}
%>  

<!DOCTYPE html>
<html>
	<head>
	    <!--Import Google Icon Font-->
	    <link href='<c:url value="http://fonts.googleapis.com/icon?family=Material+Icons"/>' rel="stylesheet">
	    <!--Import materialize.css-->
	    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/materialize.css"/>' media="screen,projection"/>
		<!-- fullcalendar css -->
		<link href="<c:url value='/resources/calrendar/fullcalendar.css'/>" rel='stylesheet' />
		<link href="<c:url value='/resources/calrendar/fullcalendar.print.css'/>" rel='stylesheet' media='print' />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src='<c:url value="/resources/js/jquery-2.2.4.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/js/materialize.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/calrendar/moment.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/calrendar/fullcalendar.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/calrendar/locale-all.js"/>'></script>
   	   <script>

   	   
	$(document).ready(function() {

		var initialLocaleCode = 'ko';

		var d = new Date();
		var day = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
		
		$('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: '',
				right : 'prev,next today' 
			},
			defaultDate: day,
			locale: initialLocaleCode,
			buttonIcons: false, // show the prev/next text
			navLinks: true, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
				<%for(ReserveCompleteDTO list : reserveCompleteDTO){%>
				{
					title: '<%=list.getReserveName()%> - <%=list.getRoomName()%>',
					start: '<%=list.getStartDate()%>',
					end : '<%=list.getEndDate()%>',
					<%if(list.getRoomName().equals("바츨라프")){%>
					color : '#ff9f89'
					<%}%>
					<%if(list.getRoomName().equals("까를르교")){%>
					color : '#257e4a'
					<%}%>
				},
				<%}%>
			]
		});

		// build the locale selector's options
		$.each($.fullCalendar.locales, function(localeCode) {
			$('#locale-selector').append(
				$('<option/>')
					.attr('value', localeCode)
					.prop('selected', localeCode == initialLocaleCode)
					.text(localeCode)
			);
		});

		// when the selected option changes, dynamically change the calendar option
		$('#locale-selector').on('change', function() {
			if (this.value) {
				$('#calendar').fullCalendar('option', 'locale', this.value);
			}
		});
	});

</script>
<style>
	body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#top {
		background: #eee;
		border-bottom: 1px solid #ddd;
		padding: 0 10px;
		line-height: 40px;
		font-size: 12px;
	}

	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	}


</style>
	</head>
	<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<main>
	<div class="container">
	<div class="centered row" style="margin-top:5px;">
			<img src='<c:url value="/resources/images/notebook.png"/>' 
				style="width: 5%;margin-left: 100px;margin-top: 20px;">
			<img src='<c:url value="/resources/images/reviewLogo.jpg"/>'> 나 예약 현황이야 바꿔쥬
		</div>
	<div id='calendar'></div>
	</div>
</main>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
