<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="../resources/css/panel-tab.css">
<style type="text/css">


#mymessagetitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin: 0px;
}



#mymessage {
	width: 100%;
	/* margin-top: 50px;  */
}

.message-box {
	/* border: 1px dotted #DDD; */
	overflow: auto;
	margin-top: 20px;
	display: none;
}

.nav-tabs {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	margin-bottom: 0px;
 	/* background-color: #3072ab; */ 
	/* background-image: linear-gradient(to bottom, white, #3072ab); */
	/* padding: 20px 0px 0px 5px; */
	
}

.nav-tabs>li>a {
	color: #666;

}

.nav-tabs>li>a:hover {
	color: #333;
	
}

.tab-content {
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    padding: 10px;
}

.table>tbody>tr>td {
    border-top: 0px;
}

td small {
	color: #aaa;
}

td strong {
	color: #4d98ee;
}
</style>

	
	
	<div class="panel panel-default" id="message-box">
		<div class="panel-body">
			<h1 class="panel-title" id="mymessagetitle"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>   메시지함</h1>
		</div>
	</div>


	<div class="panel panel-default" id="mymessage">
		<div class="panel-body">
			<div>
				<ul class="nav nav-tabs">
				  <li role="presentation"><a href="#all">전체 메시지</a></li>
				  <li role="presentation"><a href="#not-read">안읽은 메시지</a></li>
				  <li role="presentation"><a href="#join">스터디 신청</a></li>
				  <li role="presentation"><a href="#result">승인/거절 메시지</a></li>
				</ul>
				
				<div class="tab-content">
					<div class="message-box tab-pane fade" id="all">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<strong>JAVA스터디</strong> 참여 신청이 승인되었습니다. <br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>강감찬</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>김유신</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>취없스터디</strong> 신청이 거절되었습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="상세 페이지로 이동">go</a></td>
								</tr>
								
							</tbody>
						</table>
					</div>	
					<div class="message-box tab-pane fade" id="not-read">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<strong>JAVA스터디</strong> 참여 신청이 승인되었습니다. <br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>강감찬</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>김유신</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>취없스터디</strong> 신청이 거절되었습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="상세 페이지로 이동">go</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="message-box tab-pane fade" id="join">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<strong>강감찬</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>김유신</strong> 님께서 <strong>영어회화 스터디</strong> 참여 신청을 하셨습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">go</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="message-box tab-pane fade" id="result">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<strong>JAVA스터디</strong> 참여 신청이 승인되었습니다. <br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">go</a></td>
								</tr>
								<tr>
									<td>
										<strong>취없스터디</strong> 신청이 거절되었습니다.<br>
										<small><span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM</small>
									</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="상세 페이지로 이동">go</a></td>
								</tr>
							</tbody>
						</table>
					</div>
									
				</div>
			</div>
	
		</div>
	</div>

<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
	$(".nav-tabs li a").on("click", function(event) {
		event.preventDefault();
		
		//$(".nav-tabs li").removeClass("active");
		//$(this).parent().addClass("active");
		//스터디 목록 숨기고 클릭된 것 보여주기
		//$(".study-list").hide();
		//클릭된 것 href
		//$clicked = $(this).attr("href");
		//$($clicked).show();
		
		// 사실 저위에꺼 이 한줄로 정리됨; ㅡㅡ
		$(this).tab("show");
	});
	
	$(".nav-tabs li:first() a").click();

});
</script>