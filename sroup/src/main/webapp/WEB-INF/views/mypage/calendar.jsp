<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link href='../resources/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='../resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' media='print' />
<style type="text/css">

#calendartitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#calendarblock {
	width: 100%;
}

/* .fc-sat {color:blue;}
.fc-sun {color:red;} */

</style>
<script type="text/javascript">
var bootstrapTooltip = $.fn.tooltip.noConflict();
$.fn.bstooltip = bootstrapTooltip;
</script>

<script src="../resources/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.js"></script>

<div class="panel panel-default" >
	<div class="panel-body">
		<h1 class="panel-title" id="calendartitle">스터디 캘린더</h1>
	</div>
</div>

<div  id="calendarblock" class="panel panel-default">
	<div class="panel-body">

		<div id="calendar"></div>
		
	</div>
</div>

<script type="text/javascript">
$(function(){
	
	var color = ["#f0ad4e", "#3a87ad", "#ed4e7d", "#CC00FF", "#009999", "#800000", "#669900"];
	
	var date = new Date(); 
    var d = date.getDate(); 
    var m = date.getMonth(); 
    var y = date.getFullYear(); 

    $.getJSON("getCalendarEvent.do", function(result) {
    	
    	result.events;
    	var events = [];
    	
    	$.each(result.events, function(index, element) {
	    	
    		events.push({
                title: element.study.study_name, 
                start: new Date(element.eventStart),
                end: new Date(element.eventEnd), 
                allDay: false,
                url: '/sroup/m_study/'+ element.study.p_address +'/m_main.do',
                tooltip:element.eventTitle,
                className:'study'+element.study.study_no		
	    	});
    		
    	});
    	
    	//console.log(events);
    	
	    var calendar = $('#calendar').fullCalendar({ 
	        header: { 
	            left: 'prev,next,today', 
	            center: 'title', 
	            right: 'month,agendaWeek' 
	        }, 
	        editable: false, 
	        dayClick: function(date, allDay, jsEvent, view) 
	        { 
	            
	        }, 
	        eventAfterAllRender: function(view) { 
	        	$(window).resize();
	        	coloring(result.studyNoList); 
				$(".fc-toolbar h2").css("font-size", "20px");
	        },
	        eventRender: function (event, element) {
	        	var tooltip = event.tooltip;
	        	/* $(element).attr("title", tooltip);
	        	$(element).attr("data-placement", "top");
	        	$(element).attr("data-toggle", "tooltip"); */
	        	console.log(tooltip);
	        	$(element).bstooltip({title: tooltip});  
	        }	       
	        ,events: events
	    });
    	
    	
    });
    
	    
    
    
    
    
	function coloring(list) {
	    //for문으로 처리 , 색깔은 색깔코드 미리 저장해서 몇개 배열로 넣어놓자
	    
	    $.each(list, function(index, element) {
		//	console.log(element);
			var colori = index % color.length;
			
			$(".study"+element).css({"border":"1px solid " + color[colori],"background-color": color[colori]});
	    });
	    
	   /* 	$(".study999").css({"border":"1px solid #f0ad4e","background-color":"#f0ad4e"});
	   	$(".study133").css({"border":"1px solid #3a87ad","background-color":"#3a87ad"});
	   	$(".study450").css({"border":"1px solid #ed4e7d","background-color":"#ed4e7d"}); */
	}

});
</script> 