<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link href='resources/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' media='print' />
<style type="text/css">

#title {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#calendarblock {
margin : auto;
	width: 800px;
	height: 720px;
}
.fc-sat {color:blue;}
.fc-sun {color:red;}


</style>
<script src='http://code.jquery.com/ui/1.11.1/jquery-ui.js'></script>
<script src="resources/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.3.2/fullcalendar.min.js"></script>
<div class="container">  
  <h1 id="bordname">스터디 일정</h1>
  <hr>  
  
<div  id="calendarblock" class="panel panel-default">
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
    	  $("#StartDt").val("" + start.toLocaleString());
          $("#EvtStartDt").val("" + start.toLocaleString());

          $("#EndDt").val("" + end.toLocaleString());
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
                      $.ajax({
                          type: "POST",
                          contentType: "application/json",
                          data: "{eventdata:" + JSON.stringify(eventToSave) + "}",
                          url: "Test2.aspx/AddEvents",
                          dataType: "json",
                          success: function (data) {
                              var events = new Array();
                              $.map(data.d, function (item, i) {
                                  var event = new Object();
                                  event.id = item.EventID;
                                  event.start = new Date(item.StartDate);
                                  event.end = new Date(item.EndDate);
                                  event.title = item.EventName;
                                  event.allDay = false;
                                  events.push(event);
                              })
                              $('div[id*=calendar]').fullCalendar('addEventSource', events);
                              $("#ModalAdd").dialog("close");
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
              $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
              $("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
              $("#eventInfo").html(event.description);
              //$("#eventLink").attr('href', event.url);
              $("#eventContent").dialog({ modal: true, title: event.title, width:350});
          });
      },
      
      /*
         editable: true allow user to edit events.
      */
      editable: true,
      /*
         for demo we have added predefined events in json object.
      */
      events: [
         {
            title: 'All Day Event',
            start: new Date(y, m, 1)
         },
         {
            title: 'Long Event',
            start: new Date(y, m, d-5),
            end: new Date(y, m, d-2)
         },
         {
            id: 999,
            title: 'Repeating Event',
            start: new Date(y, m, d-3, 16, 0),
            allDay: false
         },
         {
            id: 999,
            title: 'Repeating Event',
            start: new Date(y, m, d+4, 16, 0),
            allDay: false
         },
         {
            title: 'Meeting',
            start: new Date(y, m, d, 10, 30),
            allDay: false
         },
         {
            title: 'Lunch',
            start: new Date(y, m, d, 12, 0),
            end: new Date(y, m, d, 14, 0),
            allDay: false
         },
         {
            title: 'Birthday Party',
            start: new Date(y, m, d+1, 19, 0),
            end: new Date(y, m, d+1, 22, 30),
            allDay: false
         },
         {
            title: 'Click for Google',
            start: new Date(y, m, 28),
            end: new Date(y, m, 29),
            url: 'http://google.com/'
         }
      ]
   });
   
});
</script> 
<div id="eventContent" title="Event Details" style="display:none;">
    Start: <span id="startTime"></span><br>
    End: <span id="endTime"></span><br><br>
    <p id="eventInfo"></p>
    
    <!-- 이 부분을 이용해 원하는 곳으 링크 가능 -->
    <!--<p><strong><a id="eventLink" href="" target="_blank">Read More</a></strong></p>-->
</div>

<div id="ModalAdd" style="display:none;width:400px;">
<div id="AddEvent" style="width:400px;" >
    Event Name:&nbsp;
    <input id="Name" type="text" style="width:200px;" /><br /><br />
    Start date:&nbsp;&nbsp;
    <input id="StartDt" type="text" style="width:360px;" /><br /><br />
    End date:&nbsp;&nbsp;
    <input id="EndDt" type="text" style="width:360px;" /><br /><br />
    Recurrence: <input type="checkbox" id="chkRec" />
    <br />
</div>

<div id="RecEvent" style="display: none; width:400px;">
    <hr />
    <b>Repeat:</b><br />
    Daily:   | &nbsp;&nbsp;&nbsp; Every <input id="txtInterval" type="text" style="width:30px;" /> day(s).
    <br /><br />
    End after <input id="txtCount" type="text" style="width:30px;" /> occurences.<br />
</div>        
</div>
