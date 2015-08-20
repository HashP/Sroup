<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="../resources/css/panel-tab.css">
<style type="text/css">

#mystudytitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#mystudy {
	width: 100%;
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
 	/* background-color: #3072ab; */ 
	/* background-image: linear-gradient(to bottom, white, #3072ab); */
	/* padding: 20px 0px 0px 5px; */
    margin-bottom: 0;
}

.nav-tabs>li>a {
	color: #555;

}

.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
	/* background-color: #EBF5FF; */
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
   /*  background-color: #EBF5FF; */
}

.table>tbody>tr>td {
    border-top: 0px;
}
</style>

	<div class="panel panel-default" >
		<div class="panel-body">
			<h1 class="panel-title" id="mystudytitle">종료된 스터디</h1>
		</div>
	</div>

	<div class="panel panel-default" id="mystudy">
		<div class="panel-body">
		
			<div>
				<ul class="nav nav-pills studymenu">
				  <li role="presentation"><a href="#create">내가 개설한</a></li>
				  <li role="presentation"><a href="#attend">내가 참여한</a></li>
				</ul>
				<div class="tab-content">
					<div class="study-list" id="create">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<tbody>
								<c:forEach var="study" items="${createStudy }">
									<tr>
										<td><span class="label label-default">종료</span> ${study.study.study_name }</td>
										<td>											
											<a href="/sroup/detail.do?no=${study.study.study_no }" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a>
										</td>
										<td><a href="/sroup/m_study/${study.study.p_address}/m_main.do" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(createStudy) == 0 }">
									<tr>
										<td colspan="3" class="text-center">종료된 스터디가 없습니다. </td>
									</tr>
								</c:if>
								
								<!-- 
								<tr>
									<td><span class="label label-default">종료</span> 영어회화 스터디</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td><span class="label label-default">종료</span> OPIC IL 공략 스터디</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td><span class="label label-default">종료</span> 취업스터디</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>
								 -->			
						
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
								<c:forEach var="study" items="${attendStudy }">
									<tr>
										<td><span class="label label-default">종료</span> ${study.study.study_name }</td>
										<td><a href="/sroup/m_study/${study.study.p_address}/m_main.do" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(attendStudy) == 0 }">
									<tr>
										<td colspan="3" class="text-center">종료된 스터디가 없습니다. </td>
									</tr>
								</c:if>
								
								<!-- 
								<tr>
									<td><span class="label label-default">종료</span> 토익 스터디</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td><span class="label label-default">종료</span> JAVA스터디</td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>
								-->		
						
							</tbody>
						</table>
					</div>	
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
	$('[data-toggle="tooltip"]').tooltip();
	
	$(".studymenu li a").on("click", function(event) {
		event.preventDefault();
		
		$(".studymenu li").removeClass("active");
		$(this).parent().addClass("active");
		
		
		//스터디 목록 숨기고 클릭된 것 보여주기
		$(".study-list").hide();
				
		//클릭된 것 href
		$clicked = $(this).attr("href");
		$($clicked).fadeIn(500);
		
		$(window).resize();
		//$(this).tab("show");

	});
	
	$(".studymenu li a").filter("[href=#create]").click();
});
</script>