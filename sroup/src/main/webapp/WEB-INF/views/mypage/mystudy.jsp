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
	margin: 0px;
}



#mystudy {
	width: 100%;
	/* margin-top: 50px;  */
}

.study-list {
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
</style>

	<jsp:useBean id="now" class="java.util.Date" scope="request" />
	<div class="panel panel-default" id="mystudy">
		<div class="panel-body">

			<h1 class="panel-title" id="mystudytitle">나의 스터디</h1>
			<hr/>
			<div>
				<ul class="nav nav-tabs">
				  <li role="presentation"><a href="#create">내가 개설한</a></li>
				  <li role="presentation"><a href="#attend">내가 참여한</a></li>
				</ul>
				
				<div class="tab-content">
					<div class="study-list tab-pane fade" id="create">
						<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<tbody>
								
								<c:forEach var="study" items="${createStudy }">
									<tr>
										<td>${study.study.study_name }
										<c:choose>
											<c:when test="${study.study.s_application_period lt now}">
												<span class="label label-success">진행중</span>
											</c:when>
											<c:otherwise>
												<span class="label label-warning">모집중</span>
											</c:otherwise>
										</c:choose>
										</td>
										<td>
											<c:if test="${!(study.study.s_application_period lt now)}">
												<a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a>
											</c:if>
										</td>
										<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(createStudy) == 0 }">
									<tr>
										<td colspan="3" class="text-center">참여한 스터디가 없습니다. </td>
									</tr>
								</c:if>
								<!-- 
								<tr>
									<td>영어회화 스터디 <span class="label label-warning">모집중</span></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td>OPIC IL 공략 스터디 <span class="label label-warning">모집중</span></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td>취업스터디 <span class="label label-success">진행중</span></td>
									<td></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>
								-->	
						
							</tbody>
						</table>
					</div>	
					<div class="study-list tab-pane fade" id="attend" >
					
					<table class="table table-hover">
							<colgroup>
								<col width="*">
								<col width="50px">
								<col width="50px">
							</colgroup>
							<tbody>
								<c:forEach var="study" items="${attendStudy }">
									<tr>
										<td>${study.study.study_name }
											<c:choose>
												<c:when test="${study.study.s_application_period lt now}">
													<span class="label label-success">진행중</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">모집중</span>
												</c:otherwise>
											</c:choose>
										</td>
										
										
										<td>
										<c:if test="${!(study.study.s_application_period lt now)}">
											<a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a>
										</c:if>
										</td>
										<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
									</tr>
								</c:forEach>
								
								<c:if test="${fn:length(attendStudy) == 0 }">
									<tr>
										<td colspan="3" class="text-center">참여한 스터디가 없습니다. </td>
									</tr>
								</c:if>
								
								<!-- 
								<tr>
									<td>토익 스터디 <span class="label label-success">진행중</span></td>
									<td></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>			
								<tr>
									<td>JAVA스터디 <span class="label label-warning">모집중</span></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="모집 페이지로 이동">detail</a></td>
									<td><a href="#" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="left" title="스터디 페이지로 이동">study</a></td>
								</tr>
								-->		
						
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
		$(".list-group-item").removeClass("current-page");
		
		var current = $(this).attr("href") + "study";
		console.log(current);
		$(current).parent().addClass("current-page");

	});

	$(".nav-tabs li a").filter("[href=#${cate}]").click();
});
</script>