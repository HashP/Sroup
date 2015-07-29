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
	/* margin-top: 50px; */
}

.study-list {
	/* border: 1px dotted #DDD; */
	overflow: hidden;
	margin-top: 20px;
	display: none;
}

.nav-tabs {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
 	background-color: #3072ab; 
	/* background-image: linear-gradient(to bottom, white, #3072ab); */
	padding: 20px 0px 0px 5px;
	
}

.nav-tabs>li>a {
	color: #EBF5FF;

}

.nav-tabs>li>a:hover {
	color: #333;
	
}

</style>

	<div class="panel panel-default">
		<div class="panel-body">
		
			<h1 class="panel-title" id="mystudytitle">나의 스터디</h1>
			<br>
			<div id="mystudy">
				<ul class="nav nav-tabs">
				  <li role="presentation"><a href="#create">내가 개설한</a></li>
				  <li role="presentation"><a href="#attend">내가 참여한</a></li>
				</ul>
				<div class="study-list " id="create">
					<table class="table table-hover">
						<colgroup>
							<col width="*">
							<col width="50px">
						</colgroup>
						<tbody>
							<tr>
								<td><span class="label label-default">종료</span> 영어회화 스터디</td>
								<td><a href="#" class="btn btn-default btn-xs">모임페이지로 이동</a></td>
							</tr>			
							<tr>
								<td><span class="label label-default">종료</span> OPIC IL 공략 스터디</td>
								<td><a href="#" class="btn btn-default btn-xs">모임페이지로 이동</a></td>
							</tr>			
							<tr>
								<td><span class="label label-default">종료</span> 취업스터디</td>
								<td><a href="#" class="btn btn-default btn-xs">모임페이지로 이동</a></td>
							</tr>			
					
						</tbody>
					</table>
				</div>	
				<div class="study-list" id="attend" >
					<table class="table table-hover">
						<colgroup>
							<col width="*">
							<col width="50px">
						</colgroup>
						<tbody>
							<tr>
								<td><span class="label label-default">종료</span> 토익 스터디</td>
								<td><a href="#" class="btn btn-default btn-xs">모임페이지로 이동</a></td>
							</tr>			
							<tr>
								<td><span class="label label-default">종료</span> JAVA스터디</td>
								<td><a href="#" class="btn btn-default btn-xs">모임페이지로 이동</a></td>
							</tr>			
					
						</tbody>
					</table>
				</div>	
			</div>
			<!-- 
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
			</div> -->
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