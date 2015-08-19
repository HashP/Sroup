<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="../resources/css/panel-tab.css">
<style type="text/css">


#mypagetitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin: 0px;
}

#join-manage {
	width: 100%;
	padding-top: 20px;
	/* margin-top: 50px;  */
}

#list-box {
	margin-top: 30px;
	border: 1px solid #ddd;
	padding-top: 10px;

}
.table>tbody>tr>td, .table>thead>tr>th{
    border-top: 0px;
    vertical-align: middle;
   /*  padding: 10px; */
}

#application-list td:first-child,  #application-list th:first-child{
	text-align: center;
}

td small {
	color: #aaa;
}

td strong, a strong {
	color: #4d98ee;
}

.profilephoto {
	width: 50px;
	height: 50px;
}

.msguserinfo div {
	display: inline-block;
	vertical-align: middle;
}

</style>
	
	<div class="panel panel-default" >
		<div class="panel-body">
			<h1 class="panel-title" id="mypagetitle">스터디 신청관리</h1>
		</div>
	</div>

	<div class="panel panel-default" id="join-manage">
		<div class="panel-body">
			<div style="padding: 1px;">
				<h5><a href="/sroup/detail.do?no=${study.study_no }"><strong>${study.study_name }</strong></a> 의 스터디 신청 관리 페이지 입니다.</h5>
				
				
			</div>
			
			<div id="list-box">
				<table class="table table-hover" id="application-list">
					<colgroup>
						<col width="80px">
						<col width="*">
						<col width="120px">
					</colgroup>
					
					<thead>
						<tr>
							<th><input type="checkbox" class="joincheck" id="allcheck"  data-toggle="tooltip" data-placement="left" title="전체선택 / 해제" /></th>
							<th> 신청한 회원 </th>
							<th>
								<a href="#" class="btn btn-primary btn-xs btn-accept" data-toggle="tooltip" data-placement="left" title="선택한 회원의 가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs btn-reject" data-toggle="tooltip" data-placement="left" title="선택한 회원의 가입신청을 거절">거절</a>
							</th>
						</tr>	
					</thead>
					<tbody>
					
						<c:forEach var="user" items="${applicantList}">
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td class="msguserinfo">
								<div>
									<!-- 나중에 이미지 넣기 -->
									<img class="profilephoto img-rounded" src="/sroup/resources/images/profile/${user.applicant.profilephoto }">
								</div>
								&nbsp;
								<div>
									<strong>${user.applicant.nickname }</strong><br>
									<small><span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${user.regDate }" pattern="hh:mm a yy/MM/dd"/></small>
								</div>
							</td>
							<td>
								<input type="hidden" value="${user.applicant.id }">
								<a href="#" class="btn btn-primary btn-xs btn-accept" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs btn-reject" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>	
						
						</c:forEach>
						<!--
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>홍길동</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs btn-accept" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs btn-reject" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>강감찬</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs btn-accept" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs btn-reject" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>김유신</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs btn-accept" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs btn-reject" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>	 
						-->			
					</tbody>				
				</table>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
$(function() {
	
	var studyno = ${param.studyno};
	
	$('[data-toggle="tooltip"]').tooltip();
	
	function emptytable() {
		
		var empty_msg = "<tr>	<td colspan='3' class='text-center'>메시지가 없습니다. </td></tr>";
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
	
	$("tbody .joincheck").on("click", function() {
		event.stopPropagation();
	});
	
	$("tbody .btn-accept").on("click", function(event) {
		event.stopPropagation();
		var userid = $(this).parent().find("input[type=hidden]").val();
		var $row = $(this).parent().parent();
		
 		$.ajax({
			url:"ajax/accept-member.do",
			data:{
				userid:userid,
				studyno:studyno	
			},
			success:function(result) {
				
				if (result == "success") {
					console.log("true");
					$row.remove();
					emptytable();
				}
			}
			
		}); 
		$(this).blur();	// btn에 focus를 지워주려고 썻음;
	});

	$("tbody .btn-reject").on("click", function(event) {
		event.stopPropagation();
//		console.log(this);
		var userid = $(this).parent().find("input[type=hidden]").val();
		var $row = $(this).parent().parent();
		
 		$.ajax({
			url:"ajax/reject-member.do",
			data:{
				userid:userid,
				studyno:studyno	
			},
			dataType:"text",
			success:function(result) {
				//console.log("result : [" + result + "]")	
				if (result == "success") {
					console.log("true");
					$row.remove();
					emptytable();
				}
			}
			
		});
		$(this).blur();
	});
	
	
	$("thead #allcheck").on("click", function() {
		var status = $(this).prop("checked");
		//console.log(status);
		$("tbody .joincheck").prop("checked", status);
	});

	$("thead .btn-accept").on("click", function(event) {
		//event.preventDefault();
		// 선택한 회원들의 가입을 승인
		$("tbody :checkbox:checked").parent().parent().find(".btn-accept").click();
		
		$(this).blur();
	});
	
	$("thead .btn-reject").on("click", function() {
		// 선택한 회원들의 가입을 거절
		$("tbody :checkbox:checked").parent().parent().find(".btn-reject").click();
		
		$(this).blur();
	});
});
</script>	
	
	
	
	
	
	
	
	