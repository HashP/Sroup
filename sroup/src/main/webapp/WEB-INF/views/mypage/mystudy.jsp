<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">


#mystudytitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}



#mystudy {
	width: 600px;
	margin: 50px auto 50px auto;
}

.study-list {
	border-radius: 25px;
	border: 1px dotted #DDD;
	
	overflow: hidden;
}

</style>


<div id="page-content-wrapper">

	<div  id="mystudy">
		<h1 class="text-left" id="mystudytitle">나의 스터디</h1>
		
		
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#create">내가 개설한</a></li>
		  <li role="presentation"><a href="#attend">내가 참여한</a></li>
		</ul>
		<br>
		<div class="study-list " id="create">
			<table class="table table-hover">
				<tbody>
					<tr>
						<td>[취미]하스스턴 전설을 노리는 모임</td>
					</tr>			
					<tr>
						<td>OPIC IL 공략 스터디</td>
					</tr>			
					<tr>
						<td>하스 투기장 12승가기</td>
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


	});

});
</script>