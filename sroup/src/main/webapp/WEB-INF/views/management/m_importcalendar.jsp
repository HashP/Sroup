<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel=stylesheet href="resources/calendarPicker/jquery.calendarPicker.css" type="text/css" media="screen">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript" src="../resources/calendarPicker/jquery.calendarPicker.js"></script>
<script type="text/javascript" src="../resources/calendarPicker/test/jquery.mousewheel.js"></script>
<div id="dsel2" style="width:1105px">efefef</div>
<script>
var calendarPicker = $("#dsel2").calendarPicker({
    monthNames:["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    useWheel:true,
    //callbackDelay:500,
    years:1,
    months:5,
    days:10,
    showDayArrows:false,
    callback:function(cal) {
      
    }});
</script>