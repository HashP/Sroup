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
<script src='http://code.jquery.com/ui/1.11.1/jquery-ui.js'></script>
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
        	coloring(); 
			$(".fc-toolbar h2").css("font-size", "20px");
        },
       
        events: [ 
             
            { 
                id: 999, 
                title: '취업 스터디', 
                start: new Date(y, m, 2, 16, 0), 
                allDay: false,
                url: '../m_main.do',
                className:'study999'
            }, 
            { 
                id: 999, 
                title: '취업 스터디', 
                start: new Date(y, m, 14, 16, 0), 
                allDay: false,
                url: '../m_main.do',
                className:'study999'
            }, 
            { 
            	id:133,
                title: '토익 스터디', 
                start: new Date(y, m, d, 10, 30), 
                end: new Date(y, m, d, 12, 0), 
                allDay: false,
                url: '../m_main.do',
                className:'study133'
            }, 
            { 
            	id:133,
                title: '토익 스터디', 
                start: new Date(y, m, d-7, 12, 0), 
                end: new Date(y, m, d-7, 14, 0), 
                allDay: false,
                url: '../m_main.do',
                className:'study133'
            }, 
            { 
            	id:450,
                title: 'JAVA', 
                start: new Date(y, m, 10, 19, 0), 
                end: new Date(y, m, 10, 22, 30), 
                allDay: false,
                url: '../m_main.do',
                className:'study450'
            }, 
            { 
            	id:450,
                title: 'JAVA', 
                start: new Date(y, m, 28, 15, 0), 
                start: new Date(y, m, 28, 17, 0), 
                url: '../m_main.do',
                className:'study450'
                
            } 
        ] 
    });
	    
    
    
    
    
	function coloring() {
	    //for문으로 처리 , 색깔은 색깔코드 미리 저장해서 몇개 배열로 넣어놓자
	   	$(".study999").css({"border":"1px solid #f0ad4e","background-color":"#f0ad4e"});
	   	$(".study133").css({"border":"1px solid #3a87ad","background-color":"#3a87ad"});
	   	$(".study450").css({"border":"1px solid #ed4e7d","background-color":"#ed4e7d"});
	}

});
</script> 