<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link href='resources/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='resources/fullcalendar/fullcalendar.min.css'
	rel='stylesheet' media='print' />
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
#title {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#calendarblock {
	margin: auto;
	width: 800px;
	height: 720px;
}

.fc-sat {
	color: blue;
}

.fc-sun {
	color: red;
}
input[type='text']{
	height: 30px;
	width: 218px;
}
.input-append .add-on{
	width: 28px;	
	height: 30px;
}
label[for="start_d"]{
	display: inline-block;
	padding-right : 10px;
	margin: 6px 0;	
	
}
label[for="end_d"]{
	display: inline-block;
	padding-right : 10px;
	margin: 6px 0;
}
</style>
<script src='http://code.jquery.com/ui/1.11.1/jquery-ui.js'></script>
<script src="resources/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.js"></script>
<script type="text/javascript"
	src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
<script type="text/javascript"
	src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
<div class="container">
	<h1 id="bordname">스터디 일정</h1>
	<hr>

	<div id="calendarblock" class="panel panel-default">
		<div class="panel-body">

			<h1 class="panel-title" id="title">스터디 캘린더</h1>
			<hr>

			<div id="calendar"></div>

		</div>
	</div>
</div>
<script type="text/javascript">

/*
   jQuery document ready
*/

$(document).ready(function()
{
	
	
	 $('#datetimepicker1').datetimepicker({
	      language: 'en',
	      format: 'yyyy-MM-dd hh:mm PP',
	      pick12HourFormat: true
	    });
	 $('#datetimepicker2').datetimepicker({
	      language: 'en',
	      format: 'yyyy-MM-dd hh:mm PP',
	      pick12HourFormat: true
	    });
	 $("#datetimepicker1").on("changeDate", function (e) {
		 alert("!");
         $('#datetimepicker2').data("DateTimePicker").minViewMode(e.date);
     });      
	  $("#datetimepicker2").on("changeDate", function (e) {
          $('#datetimepicker1').data("DateTimePicker").maxViewMode(e.date);
      });
	
	   
    $('#chkRec').click(function () {
	        if ($(this).is(':checked')) {
	            $('#RecEvent').show();
	        }
	        else {
	            $('#RecEvent').hide();
	        }
	   
	});
   /*
      date store today date.
      d store today date.
      m store current month.
      y store current year.
   */
   var date = new Date();
   var d = date.getDate();
   var m = date.getMonth();
   var y = date.getFullYear();
   
   /*
      Initialize fullCalendar and store into variable.
      Why in variable?
      Because doing so we can use it inside other function.
      In order to modify its option later.
   */
   
   var calendar = $('#calendar').fullCalendar(
   {
	  
      /*
         header option will define our calendar header.
         left define what will be at left position in calendar
         center define what will be at center position in calendar
         right define what will be at right position in calendar
      */
      header:
      {
         left: 'prev,next today',
         center: 'title',
         right: 'month,agendaWeek,agendaDay'
      },
      /*
         defaultView option used to define which view to show by default,
         for example we have used agendaWeek.
      */
      defaultView: 'month',
      /*
         selectable:true will enable user to select datetime slot
         selectHelper will add helpers for selectable.
      */
      selectable: true,
      selectHelper: true,
      /*
         when user select timeslot this option code will execute.
         It has three arguments. Start,end and allDay.
         Start means starting time of event.
         End means ending time of event.
         allDay means if events is for entire day or not.
      */
      select: function(start, end, allDay)
      {
    	  var startdate = new Date(start);
    	  var enddate = new Date(end);
    	  var startval = startdate.getFullYear()+"/"+startdate.getMonth()+"/"+startdate.getDate()+" "+startdate.toTimeString();
    	  var endval = enddate.getFullYear()+"/"+enddate.getMonth()+"/"+enddate.getDate()+" "+enddate.toTimeString();
    	  $("#StartDt").val("" + startval.substr(0, 18) );
          $("#EvtStartDt").val("" + start.toLocaleString());

          $("#EndDt").val("" + endval.substr(0, 18));
          $("#EvtEndDt").val("" + end.toLocaleString());

          $("#ModalAdd").dialog(
          {
              title: "Add event",
              width: 500,
              modal: true,
              buttons: {
                  "Add": function () {
                      var event = new Object(), eventToSave = new Object(); ;
                      eventToSave.EventID = event.id = Math.floor(200 * Math.random());
                      event.start = new Date($("#StartDt").val());
                      eventToSave.StartDate = $("#StartDt").val();
                      eventToSave.EndDate = $("#EndDt").val();
                      eventToSave.EventName = event.title = eventToSave.title = $("#Name").val();
                      if ($('#chkRec').is(':checked')) {
                          eventToSave.title += " (Recurring)";
                          eventToSave.IsRecurring = true;
                          eventToSave.Freq = "Daily";
                          eventToSave.Count = $("#txtCount").val();
                          eventToSave.Interval = $("#txtInterval").val();
                      }
                      var allData = {"cal_start":$("#start_d").val(),"cal_end":$("#end_d").val(),"cal_title":$("#e_title").val(),"cal_content":$("#e_memo").val()}
                      $.ajax({              
                          url: "calEventAdd.do",
                          data : allData,                                       
                          success: function (data) {
                        	  // add 클릭시 바로 달력에 표시 이벤트 재 로드
                        	  $.ajax({              
                                  url: "calEvent.do",
                                  dataType: 'json',             
                                  success: function (data) {
                                	  var events = new Array();
                                	  $.each(data.eventList, function (i, item) {
                                          var event = new Object();
                                          event.id =  Math.floor(200 * Math.random());
                                          event.start = new Date(item.cal_start);
                                          event.end = new Date(item.cal_end);
                                          event.title = item.cal_title;
                                          event.content = item.cal_content;
                                          event.allDay = false;
                                          events.push(event);
                                          
                                      });    
                                	 
                              		$('div[id*=calendar]').fullCalendar('addEventSource', events);
                             		$("#ModalAdd").dialog("close");
                                  }                  
                          
                        	  });
                          },
                          error: function (XMLHttpRequest, textStatus, errorThrown) {
                              debugger;
                          }
                      });
                  }
              }
          });
          calendar.fullCalendar('unselect');
      },
      eventRender: function (event, element) {
          element.attr('href', 'javascript:void(0);');
          element.click(function() {
              $("#eventContent").dialog({ modal: true, title: event.title, width:350});
              $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
              $("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
              $("#s_content").html(event.content);
              $("#eventInfo").html(event.description);
              //$("#eventLink").attr('href', event.url);
          });
      },
      
      /*
         editable: true allow user to edit events.
      */
      editable: true,
      /*
         for demo we have added predefined events in json object.
      */
     
// 초기 이벤트 리스트
      events: function (start, end, timezone, callback)  {
    	  $.ajax({              
              url: "calEvent.do",
              dataType: 'json',             
              success: function (data) {
            	  var events = new Array();
            	  $.each(data.eventList, function (i, item) {
                      var event = new Object();
                      event.id =  Math.floor(200 * Math.random());
                      event.start = new Date(item.cal_start);
                      event.end = new Date(item.cal_end);
                      event.title = item.cal_title;
                      event.content = item.cal_content;
                      event.allDay = false;
                      events.push(event);
                      
                  });    
            	  callback(events);
              }                  
      
    	  });
   }
   
});
});
</script>
<div id="eventContent" title="Event Details" style="display: none;">
	시작 시간: <span id="startTime"></span><br> 종료 시간: <span id="endTime"></span><br>
	<br> 스터디 내용 :
	<sapn id="s_content"></sapn>
	<br> <br>
	<p id="eventInfo"></p>

	<!-- 이 부분을 이용해 원하는 곳으 링크 가능 -->
	<!--<p><strong><a id="eventLink" href="" target="_blank">Read More</a></strong></p>-->
</div>

<div id="ModalAdd" style="display: none; width: 400px;">
	<div id="AddEvent" style="width: 400px;">
	<div>제목 <input id="e_title" type="text" ></div>
	<div id="datetimepicker1" class="input-append">
		<label for="start_d"><strong>시작</strong> </label> <input id="start_d" data-format="MM/dd/yyyy HH:mm:ss PP" type="text"></input> <span class="add-on"> <i data-time-icon="icon-time" data-date-icon="icon-calendar"> </i></span>
		</div>
	</div>
	
	<div id="datetimepicker2" class="input-append">
	<label for="end_d"><strong>종료</strong> </label>
		<input id="end_d" data-format="MM/dd/yyyy HH:mm:ss PP" type="text"></input> <span
			class="add-on"> <i data-time-icon="icon-time"
			data-date-icon="icon-calendar"> </i>
		</span>
	</div>
	<div>
		메모 <textarea id="e_memo" style="width :246px; height: 100px;"></textarea>
	</div>
	<br /> <br />



		Recurrence: <input type="checkbox" id="chkRec" /> <br />
	

	<div id="RecEvent" style="display: none; width: 400px;">
		<hr />
		<b>Repeat:</b><br /> Daily: | &nbsp;&nbsp;&nbsp; Every <input
			id="txtInterval" type="text" style="width: 30px;" /> day(s). <br />
		<br /> End after <input id="txtCount" type="text"
			style="width: 30px;" /> occurences.<br />
	</div>
</div>


