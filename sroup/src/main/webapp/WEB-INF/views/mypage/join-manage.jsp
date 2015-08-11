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

td strong {
	color: #4d98ee;
}
</style>
	
	<div class="panel panel-default" >
		<div class="panel-body">
			<h1 class="panel-title" id="mypagetitle">스터디 신청관리</h1>
		</div>
	</div>

	<div class="panel panel-default" id="join-manage">
		<div class="panel-body">
			<h5>[스터디제목] 의 스터디 신청 관리 페이지 입니다.</h5>
		
			<div id="list-box">
				<table class="table table-hover" id="application-list">
					<colgroup>
						<col width="80px">
						<col width="*">
						<col width="120px">
					</colgroup>
					
					<thead>
						<tr>
							<th><input type="checkbox" class="joincheck"  data-toggle="tooltip" data-placement="left" title="전체선택 / 해제" /></th>
							<th> 신청한 회원 </th>
							<th>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="선택한 회원의 가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="선택한 회원의 가입신청을 거절">거절</a>
							</th>
						</tr>	
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>홍길동</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>강감찬</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>김유신</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
						<tr>
							<td><input type="checkbox" class="joincheck"/></td>
							<td>홍길동</td>
							<td>
								<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="가입을 승인하기">승인</a>
								<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="가입신청을 거절">거절</a>
							</td>
						</tr>				
				
			
					</tbody>				
				</table>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();


});
</script>	
	
	
	
	
	
	
	
	