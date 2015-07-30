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
      defaultView: 'agendaWeek',
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
         /*
            after selection user will be promted for enter title for event.
         */
         var title = prompt('Event Title:');
         /*
            if title is enterd calendar will add title and event into fullCalendar.
         */
         if (title)
         {
            calendar.fullCalendar('renderEvent',
               {
                  title: title,
                  start: start,
                  end: end,
                  allDay: allDay
               },
               true // make the event "stick"
            );
         }
         calendar.fullCalendar('unselect');
      },
      /*
         editable: true allow user to edit events.
      */
      editable: true,
      /*
         events is the main option for calendar.
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