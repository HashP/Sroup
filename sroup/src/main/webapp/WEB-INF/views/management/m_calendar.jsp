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
     href="resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
<link rel="stylesheet" href="resources/simplecolorpicker/jquery.simplecolorpicker.css">
<link rel="stylesheet" href="resources/simplecolorpicker/jquery.simplecolorpicker-regularfont.css">
<link rel="stylesheet" href="resources/simplecolorpicker/jquery.simplecolorpicker-glyphicons.css">
<link rel="stylesheet" href="resources/simplecolorpicker/jquery.simplecolorpicker-fontawesome.css">
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

#start_d {
	height: 30px;
	width: 218px;
}

#end_d {
	height: 30px;
	width: 218px;
}

.input-group .input-group-addon {
	width: 28px;
	height: 30px;
}

label[for="start_d"] {
	display: inline-block;
	padding-right: 10px;
	margin: 6px 0;
}

label[for="end_d"] {
	display: inline-block;
	padding-right: 10px;
	margin: 6px 0;
}

.inline_div {
	display: inline-block;
}

textarea {
	resize: none
}

#calendarblock {
	width: 910px;
	height: 785px;
}
</style>
<script src='http://code.jquery.com/ui/1.11.1/jquery-ui.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.js"></script>
	

    <script type="text/javascript"
     src="resources/datetimepicker/js/bootstrap-datetimepicker.min.js">
    </script>
   
    

<script src="resources/simplecolorpicker/jquery.simplecolorpicker.js"></script>
<div class="container">
	<h1 id="bordname" class="bordname1" onclick='removeClick();'>스터디 일정</h1>
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

// 달력 이벤트 x표 클릭했을 시
function removeClick(calEvent_id){
	
	event.stopPropagation ();	
	
	  $.ajax({              
          url: "calEventDel.do",
          data:{"calEvent_id":calEvent_id},             
          success: function (data) {        	  
        	  $('#calendar').fullCalendar('removeEvents', calEvent_id);
          }                  
  
	  });
}

$(document).ready(function()
{
	
	
	 $('select[name="colorpicker-picker-delay"]').simplecolorpicker({picker: true, theme: 'glyphicons', pickerDelay: 1000});
	
	 $('#datetimepicker1').datetimepicker({
		 locale: 'ko'
	 });
     $('#datetimepicker2').datetimepicker({
    	 locale: 'ko',
         useCurrent: false //Important! See issue #1075
     });
	  $("#datetimepicker1").on("dp.change", function (e) {
          $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
      });
      $("#datetimepicker2").on("dp.change", function (e) {
          $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
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
    	  $("#ModalAdd input").val("");
   		$("#ModalAdd textarea").val("");
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
              title: "일정등록",
              width: 660,
              modal: true,
              buttons: {
                  "확인": function () {
                      var event = new Object(), eventToSave = new Object(); ;
                      eventToSave.EventID = event.id = Math.floor(200 * Math.random());
                      event.start = new Date($("#StartDt").val());
                      eventToSave.StartDate = $("#StartDt").val();
                      eventToSave.EndDate = $("#EndDt").val();
                      eventToSave.EventName = event.title = eventToSave.title = $("#Name").val();
                     
                      var allData = {"event_start":$("#start_d").val(),"event_end":$("#end_d").val(),"event_title":$("#e_title").val(),"event_content":$("#e_memo").val(),"event_color":$("#e_color").select().val()}
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
                                          event.id =  item.event_id;
                                          event.start = new Date(item.event_start);
                                          event.end = new Date(item.event_end);
                                          event.title = item.event_title;
                                          event.content = item.event_content;
                                          event.color = item.event_color;
                                          event.allDay = false;
                                          events.push(event);
                                          
                                      });                                  	 
                              		$('div[id*=calendar]').fullCalendar('refetchEvents');                             		
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
          //element.attr('href', 'javascript:void(0);');
          element.click(function() {
              $("#eventContent").dialog({ modal: true, title: event.title, width:330});
              $("#startTime").html(moment(event.start).format('YYYY년MM월DD일   h:mm A'));
              $("#endTime").html(moment(event.end).format('YYYY년MM월DD일\t\th:mm A'));
              $("#s_content").html(event.content);
              $("#eventInfo").html(event.description);
              //$("#eventLink").attr('href', event.url);
          });
          element.hover(function(){        	  
        	  $(this).children().append("<span class='glyphicon glyphicon-remove' id="+event.id+" onclick='removeClick("+event.id+");' style='float:right;'></span>");        	  
          },function(){
        	  
        	 $(".glyphicon-remove").remove();        	  
          });
      },
      eventDrop:function(event, delta, revertFunc){
    	var start=event.start._i
    	var end = event.end._i
    	 $.ajax({      
    		 type: "POST",
             url: "changeCalEvent.do",
             data :  {"calEvent_id":event.id,"event_start":start,"event_end":end},                         
             success: function (data) {	            	 
            	 
           	  	alert("성공")
             }     
	})
      },
      
      
      //removeEvents : function()
      
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
                      event.id =  item.event_id;
                      event.start = new Date(item.event_start);
                      event.end = new Date(item.event_end);
                      event.title = item.event_title;
                      event.content = item.event_content;
                      event.color = item.event_color;
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
	시작 : <span id="startTime"></span><br> 종료 : <span id="endTime"></span><br>
	<hr>
	 <textarea id="s_content" style="width: 291px;" disabled="disabled" ></textarea>	
	<br> <br>
	<p id="eventInfo"></p>

	<!-- 이 부분을 이용해 원하는 곳으 링크 가능 -->
	<!--<p><strong><a id="eventLink" href="" target="_blank">Read More</a></strong></p>-->
</div>

<div id="ModalAdd" style="display: none; width: 600px;">
	<div id="AddEvent" style="width: 620px; text-align: center;">
	<div class="inline_div addEvent_div"><strong>제목</strong> <input id="e_title" type="text"  style="width: 564px; height: 30px;"></div>
	<div class="addEvent_div">
	<div class='input-group date inline_div' id='datetimepicker1'>
	<strong style="float: left; padding-right : 5px; margin: 6px 0;">시작</strong>
                    <input id="start_d"  type='text' class="form-control" />
                    <span class="input-group-addon" style="float: left; width: 39px;">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
    </div>
	<div class='input-group date inline_div ' id='datetimepicker2'>
	<strong style="float: left; padding-left:10px; padding-right: 5px;
    margin: 6px 0;">종료</strong> 
                    <input id="end_d" type='text' class="form-control" />
                    <span class="input-group-addon" style="float: left; width: 39px;">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
	</div> 
	<div  class="addEvent_div" style="height: 34px;  padding-top: 2px;">
	<strong>색상</strong>
<select name="colorpicker-picker-delay" id="e_color">
  <option value="#7bd148">Green</option>
  <option value="#5484ed">Bold blue</option>
  <option value="#a4bdfc">Blue</option>
  <option value="#46d6db">Turquoise</option>
  <option value="#7ae7bf">Light green</option>
  <option value="#51b749">Bold green</option>
  <option value="#fbd75b">Yellow</option>
  <option value="#ffb878">Orange</option>
  <option value="#ff887c">Red</option>
  <option value="#dc2127">Bold red</option>
  <option value="#dbadff">Purple</option>
  <option value="#e1e1e1">Gray</option>
</select>
</div>
	<div class="addEvent_div">
		<strong>메모</strong> <textarea id="e_memo" style="width :564px; height: 240px;"></textarea>
	</div>	
	</div>
	
	<br />


</div>
<script>

</script>

