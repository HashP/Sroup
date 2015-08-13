<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test - 출석부 </title>
<link rel="shortcut icon" href="/sroup/resources/images/favicon/favicon.png" />
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/sroup/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
	body {
		background-color: #EBF5FF;
		font-size: 12px;
	}
	
	.content {
		padding: 20px;
		width: 980px;
		margin: 40px auto 0 auto;
	}
	
	.rollbook-box {
		background-color: white;
		margin-top: 20px;
		padding: 40px;
	}
	
	#rolldate {
		margin-bottom: 20px;
	}

	.rollbook {
		width: 600px;
		margin-bottom: 0px;
		display: inline-block; 
	}

	.rollbook img {
		width: 50px;
		height: 50px;
	}
	
	.rollbook tbody tr td {
		height: 71px;
		vertical-align: middle;
		font-size: 14px;
		padding: 10px;
	}
	
	.input-roll, #btn-save{
		display: none;
	}
	


	#datepicker {
		background-color: white;
		/* width: 200px; */
		display: inline-block;
		margin-right: 20px;
		vertical-align: top;
	}
	
	.table-condensed td:not(.disabled) {
		background-color: #EBF5FF;
		color: #337ab7;
		font-weight: bold;
	}
	
	.bootstrap-datetimepicker-widget .table-condensed td.disabled, .bootstrap-datetimepicker-widget .table-condensed td.disabled:hover {
		cursor: default;
		color: #aaa;
	}
	
</style>
<script type="text/javascript" src="/sroup/resources/jquery/jquery-1.11.3.js"></script>
<script src="/sroup/resources/fullcalendar/lib/moment.min.js"></script>
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="/sroup/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<c:set var="arraySize" value="${fn:length(scheduleList) }"></c:set>
<script type="text/javascript">

// scheduleDateList 를 가져와 담기(List<schedule>)
//var array = [moment("2015-08-14"), moment("2015-08-15"),moment("2015-08-26")];

$(function() {
	
//****************************************************************
//					출석부 수정작업 method;
//****************************************************************
	$(".rollbook td:nth-child(2)").on("dblclick", function() {
		if($(this).find(".input-roll").css("display") != "none") {
			return;
		}
		$(this).find(".input-roll").show();
		$(this).find(".view-roll").hide();
		
		var value = $(this).find("img").attr("alt");
		$(this).find("select").val(value).prop("selected", true);
	});
	
	$(".rollbook td:nth-child(3)").on("dblclick", function() {
		if($(this).find(".input-roll").css("display") != "none") {
			return;
		}
		
		$(this).find(".input-roll").show();
		$(this).find(".view-roll").hide();
		
		var value = $(this).find("p").text();
		$(this).find("input[type=text]").val(value);
	});
	
	$(".rollbook td:nth-child(2) select").on("change", function() {
		$(this).parent().find(".input-roll").hide();
		$(this).parent().find(".view-roll").show();
		
		var value = $(this).parent().find("select option:selected").val();
		console.log(value);
		$(this).siblings("img").attr("src", "/sroup/resources/images/test/" + value + ".png");
		$(this).siblings("img").attr("alt", value);
	});
	
	$(".rollbook td:nth-child(3) button").on("click", function() {
		$(this).parent().find(".input-roll").hide();
		$(this).parent().find(".view-roll").show();
		
		var value = $(this).siblings("input").val();
		$(this).siblings("p").text(value);
	});

	
//*********************************************************************
//			datepicker 설정과 날짜변경 event 등
//*********************************************************************
	function fillRollbook(date) {
	//ajax요청으로 해당 날짜의 출석부의 내용을 채움 
		
	
	}

	$.getJSON("getSchedules.do", function(result) {
		
		$("#datepicker").datetimepicker({
			locale: 'ko',
			inline: true,
			format: 'MM/dd/YYYY',
			enabledDates: result.scheduleList,
			defaultDate: result.scheduleList[0]
		});
		fillRollbook(array[0]);	
		
	});
	

	$("#datepicker").on("dp.change", function(e) {
		//console.log(e.date);
		$("#rolldate").text(e.date.format('YYYY년 MM월 DD일'));
		
		fillRollbook(e.date)		
	});
	
});
</script>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />

	<div class="content">
		<h1><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Study 출석부</h1>
		
		<div class="rollbook-box">
			
			<h3 id="rolldate"><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일"/></h3>
			<div>
				<div id="datepicker"></div>
				<table class="table table-default table-hover rollbook">
					<colgroup>
						<col width="100px"/>
						<col width="100px"/>
						<col width="300px"/>
						<col width="100px"/>
					</colgroup>
					<thead>
						<tr>	
							<th>이름</th>
							<th>출석</th>
							<th>비고</th>
							<th>출석률</th>
						</tr>
					</thead>		
					<tbody>
						<tr>
							<td>
								<p>최창진</p>
							</td>
							<td>
								<img class="view-roll" src="/sroup/resources/images/test/absence.png" alt="absence"/>
								<select class="input-roll">
									<option value="attend">출석</option>
									<option value="absence">결석</option>
								</select>
							</td>
							<td>
								<p class="view-roll">성실한데 불참</p>
								<input type="text" class="input-roll" />
								<button class="btn btn-default input-roll">완료</button>
							</td>
							<td>50 %</td>
						</tr>
						<tr>
							<td>유성현</td>
							<td>
								<img class="view-roll" src="/sroup/resources/images/test/attend.png" alt="attend"/>
								<select class="input-roll">
									<option value="attend">출석</option>
									<option value="absence">결석</option>
								</select>
							</td>
							<td>
								<p class="view-roll"></p>
								<input type="text" class="input-roll" />
								<button class="btn btn-default input-roll">완료</button>
							</td>
							<td>95 %</td>
						</tr>
						<tr>
							<td>박진</td>
							<td>
								<img class="view-roll" src="/sroup/resources/images/test/attend.png" alt="attend"/>
								<select class="input-roll">
									<option value="attend">출석</option>
									<option value="absence">결석</option>
								</select>
							</td>
							<td>
								<p class="view-roll"></p>
								<input type="text" class="input-roll" />
								<button class="btn btn-default input-roll">완료</button>
							</td>
							<td>100 %</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>