<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../resources/css/panel-tab.css">
<style type="text/css">

#mystudytitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#mystudy {
	width: 600px;
	margin-top: 50px;
}

.study-list {
	/* border: 1px dotted #DDD; */
	overflow: hidden;
	margin-top: 20px;
	display: none;
}

</style>

	<h1 class="text-left" id="mystudytitle">나의 스터디</h1>
	<div  id="mystudy" class="panel panel-primary with-nav-tabs">
		<div class="panel-heading">
			<ul class="nav nav-tabs">
			  <li role="presentation"><a href="#create">내가 개설한</a></li>
			  <li role="presentation"><a href="#attend">내가 참여한</a></li>
			</ul>
		</div>
		<div class="panel-body">
			<div class="study-list " id="create">
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>[종료]영어회화 스터디</td>
						</tr>			
						<tr>
							<td>[종료]OPIC IL 공략 스터디</td>
						</tr>			
						<tr>
							<td>[종료]취업스터디</td>
						</tr>			
				
					</tbody>
				</table>
			</div>	
			<div class="study-list" id="attend" >
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>[종료]토익 스터디</td>
						</tr>			
						<tr>
							<td>[종료]JAVA스터디</td>
						</tr>			
				
					</tbody>
				</table>
			</div>	
		</div>
	</div>

<script type="text/javascript">
$(function() {
	
	$(".nav-tabs li a").on("click", function(event) {
		event.preventDefault();
		
		$(".nav-tabs li").removeClass("active");
		$(this).parent().addClass("active");
		
		
		//스터디 목록 숨기고 클릭된 것 보여주기
		$(".study-list").hide();
				
		//클릭된 것 href
		$clicked = $(this).attr("href");
		$($clicked).show();
		

	});
	
	$(".nav-tabs li a").filter("[href=#create]").click();
});
</script>