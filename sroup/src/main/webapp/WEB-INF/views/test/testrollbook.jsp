<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test - 출석부 </title>
<link rel="shortcut icon" href="/sroup/resources/images/favicon/favicon.png" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	body {
		background-color: #EBF5FF;
		font-size: 12px;
	}
	
	.content {
		margin-top: 20px;
		padding: 20px;
		width: 980px;
		margin: 0 auto 0 auto;
	}
	
	.rollbook-box {
		background-color: white;
		margin-top: 20px;
		padding: 40px;
	}
	
	.rollbook img {
		width: 50px;
		height: 50px;
	}
	
	.rollbook tbody tr td {
		vertical-align: middle;
		font-size: 14px;
		padding: 10px;
	}
	
	.input-roll, #btn-save, #datepicker {
		display: none;
	
	}
	
	#box-header {
		position: relative;
	}
	
	#datepicker {
		position: absolute;
	}
</style>
<script type="text/javascript" src="/sroup/resources/jquery/jquery-1.11.3.js"></script>
<script src="../resources/fullcalendar/lib/moment.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var array = ["2015-08-14","2015-08-15","2015-08-26"];

	//출석부 수정작업 method;
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

	$("#datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		onSelect: function(dateStr) {
			console.log("asdfsadfas");
			$("#rolldate").text($.datepicker.formatDate('yy년 m월 d일', $(this).datepicker('getDate')));
			$("#datepicker").fadeOut(300);
		},
		beforeShowDay: function(date) {
			var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
			return [array.indexOf(string) != -1];
			
		}
		
		
	});
	
	$("#rolldate").on("dblclick", function() {
		$("#datepicker").fadeToggle(300);
	});
	
});
</script>
</head>
<body>

	<div class="content">
		<h1>Study 출석부</h1>
		
		<div class="rollbook-box">
			
			<div class="box-header">
				<h3 id="rolldate">2015년 8월 12일</h3>
				<div id="datepicker"></div>
			</div>
			
			<table class="table table-default table-hover rollbook">
				<colgroup>
					<col width="200px"/>
					<col width="100px"/>
					<col width="*"/>
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

</body>
</html>