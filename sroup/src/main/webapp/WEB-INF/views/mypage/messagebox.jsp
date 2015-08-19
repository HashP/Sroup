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
	margin-top: 10px;
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
/*     
	border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd; 
*/
    padding: 10px;
	border: 1px solid #ddd;
	margin-top: 10px;
}

.table>tbody>tr>td {
    border-top: 0px;
    vertical-align: middle;
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
			<h1 class="panel-title" id="mymessagetitle">메시지함</h1>
		</div>
	</div>


	<div class="panel panel-default" id="mymessage">
		<div class="panel-body">
			<div>
				<ul class="nav nav-pills messagenav">
				  <li role="presentation"><a href="#all">전체 메시지</a></li>
				  <li role="presentation"><a href="#join">스터디 신청</a></li>
				  <li role="presentation"><a href="#result">승인/거절 메시지</a></li>
				</ul>
				
				<div class="tab-content">
					<div class="message-box" id="all">
						<table class="table table-hover">
							<colgroup>
								<col width="80px">
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" class="msgcheck" id="allcheck"  data-toggle="tooltip" data-placement="left" title="전체선택 / 해제" /></th>
									<th> 메시지 </th>
									<th>
									</th><th>
										<a href="#" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="선택한 메시지 삭제하기">삭제</a>
									</th>
								</tr>	
							</thead>
							<tbody>
								<c:forEach var="message" items="${messageList }">
									<c:choose>
										<c:when test="${message.type == 'REQUEST'}">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.sender.nickname }</strong> 님께서 <strong>${message.study.study_name }</strong> 참여 신청을 하셨습니다.<br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td>
													<form id="moveto_${message.sender.id }${message.study.study_no}" method="post" action="join-manage.do" style="padding: 0; margin: 0;">
														<input type="hidden" name="studyno" value="${message.study.study_no}">
														<%-- <a href="join-manage.do?studyno=${message.study.study_no }" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">이동</a> --%>
														<a onclick="document.getElementById('moveto_${message.sender.id }${message.study.study_no}').submit();" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">이동</a>
													</form>
												</td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>				
										</c:when>
										<c:when test="${message.type == 'REJECT' }">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.study.study_name }</strong> 신청이 거절되었습니다.<br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td><a href="/sroup/detail.do?no=${message.study.study_no }" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="상세 페이지로 이동">이동</a></td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>
										</c:when>
										<c:when test="${message.type == 'ACCEPT' }">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.study.study_name }</strong> 참여 신청이 승인되었습니다. <br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td><a href="/sroup/m_study/${message.study.p_address}/m_main.do" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">이동</a></td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>
										</c:when>								
									</c:choose>								
								</c:forEach>
								<!-- 
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
								 -->
							</tbody>
						</table>
					</div>	
					<div class="message-box" id="join">
						<table class="table table-hover">
							<colgroup>
								<col width="80px">
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" class="msgcheck" id="allcheck"  data-toggle="tooltip" data-placement="left" title="전체선택 / 해제" /></th>
									<th> 메시지 </th>
									<th>
									</th><th>
										<a href="#" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="선택한 메시지 삭제하기">삭제</a>
									</th>
								</tr>	
							</thead>
							<tbody>
								<c:forEach var="message" items="${messageList }">
									<c:choose>
										<c:when test="${message.type == 'REQUEST'}">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.sender.nickname }</strong> 님께서 <strong>${message.study.study_name }</strong> 참여 신청을 하셨습니다.<br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td>
													<form id="moveto_${message.sender.id }${message.study.study_no}" method="post" action="join-manage.do" style="padding: 0; margin: 0;">
														<input type="hidden" name="studyno" value="${message.study.study_no}">
														<%-- <a href="join-manage.do?studyno=${message.study.study_no }" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">이동</a> --%>
														<a onclick="document.getElementById('moveto_${message.sender.id }${message.study.study_no}').submit();" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="신청 관리 페이지로 이동">이동</a>
													</form>
												</td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>				
										</c:when>
									</c:choose>								
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="message-box" id="result">
						<table class="table table-hover">
							<colgroup>
								<col width="80px">
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" class="msgcheck" id="allcheck"  data-toggle="tooltip" data-placement="left" title="전체선택 / 해제" /></th>
									<th> 메시지 </th>
									<th>
									</th><th>
										<a href="#" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="선택한 메시지 삭제하기">삭제</a>
									</th>
								</tr>	
							</thead>
							<tbody>
								<c:forEach var="message" items="${messageList }">
									<c:choose>
										<c:when test="${message.type == 'REJECT' }">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.study.study_name }</strong> 신청이 거절되었습니다.<br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td><a href="/sroup/detail.do?no=${message.study.study_no }" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="상세 페이지로 이동">이동</a></td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>
										</c:when>
										<c:when test="${message.type == 'ACCEPT' }">
											<tr>
												<td><input type="checkbox" class="msgcheck"/></td>
												<td>
													<strong>${message.study.study_name }</strong> 참여 신청이 승인되었습니다. <br>
													<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/></small>
												</td>
												<td><a href="/sroup/m_study/${message.study.p_address}/m_main.do" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">이동</a></td>
												<td><a href="${message.no }" class="btn btn-danger btn-xs del-btn" data-toggle="tooltip" data-placement="left" title="이 메시지 삭제하기">삭제</a></td>
											</tr>
										</c:when>								
									</c:choose>								
								</c:forEach>
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
	$(".messagenav li a").on("click", function(event) {
		event.preventDefault();
		$(".messagenav li").removeClass("active");
		$(this).parent().addClass("active");
		//스터디 목록 숨기고 클릭된 것 보여주기
		$(".message-box").hide();
		//클릭된 것 href
		$clicked = $(this).attr("href");
		$($clicked).fadeIn(500);
		//$(this).tab("show");
		
		$(window).resize();
	});
	
	$(".messagenav li:first() a").click();
	
	function emptytable() {
		
		var empty_msg = "<tr>	<td colspan='2' class='text-center'>메시지가 없습니다. </td></tr>";
		$("tbody").filter(function(index) {
			//console.log($(this).text().trim());
			return $(this).text().trim() == "";
		}).append(empty_msg);
	}
	emptytable();
	
	$("tbody tr").on("click", function() {
		var target = $(this).find(":checkbox");
		//console.log(target);
		var status = target.prop("checked");
		target.prop("checked", !status);
	});
	
	$("tbody .msgcheck").on("click", function() {
		event.stopPropagation();
	});
	
	$("thead #allcheck").on("click", function() {
		var status = $(this).prop("checked");
		//console.log(status);
		$(this).parent().parent().parent().parent().		
		find("tbody .msgcheck").prop("checked", status);
	});
	
	
	$("tbody .del-btn").on("click", function(event) {
		event.preventDefault();
		var msgNo = $(this).attr("href");		
		//console.log(msgNo);
		
		$.ajax({
			url:"ajax/remove-message.do",
			data:{msgNo:msgNo},
			success: function() {
				$("a[href="+msgNo+"]").parent().parent().remove();
				emptytable();
				$(window).resize();
			}
		})
		
	});
	
	$("thead .del-btn").on("click", function(event) {
		//event.preventDefault();
		// 선택한 회원들의 가입을 승인
		var $currentTable = $(this).parent().parent().parent().parent();
		
	//	console.log($currentTable);
		$currentTable.find("tbody :checkbox:checked").parent().parent().find(".del-btn").click();
		
		$(this).blur();
	});
	
});
</script>