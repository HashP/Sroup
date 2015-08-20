<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/sroup/resources/css/navbar.css" />
<style type="text/css">
.navbar {
	min-height: 30px;
	margin: 0px;
}

.navbar-nav > li > a{
    padding-top:4px !important; 
    padding-bottom:0 !important;
    height: 28px;
}

.navbar-inverse .navbar-nav>li>a:hover {
	text-decoration: underline;
}

.navbar .divider-vertical {
height: 12px;
margin-top: 8px;
border-left: 1px solid #666;
}

@media (min-width: 980px) {
	.container {
		width: 980px;
		padding-left: 0px;
		padding-right: 0px;
	}
}

.message-dropdown {
	width: 300px;
	max-height: 200px;
	overflow-y: auto;
	overflow-x: hidden;
}

li.message-preview {
    border-bottom: 1px solid #EEE;
}

li.message-preview .media p {
	white-space: normal;
	margin-bottom: 0px;
	font-size: 14px;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}

li.message-preview .media p.small {
	font-size: 12px;
}
</style>

<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div>
      <ul class="nav navbar-nav">
        <li><a href="/sroup/list.do">모임 <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${sessionScope.LOGIN_ID != null }">
	        <li class="dropdown">
        	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-bell"></span> 알림 <span class="caret"></span></a>
			<ul class="dropdown-menu message-dropdown">
				<c:forEach var="message" items="${navmsgList }">
					<li class="message-preview"><a href="#">
						<div class="media">
							<h5 class="media-heading">
								<strong>${message.study.study_name }</strong>
							</h5>
							
							<c:choose>
								<c:when test="${message.type == 'REQUEST'}">
									<p class="small text-muted">
										<span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/>
									</p>
									<p>${message.sender.nickname } 님께서 스터디 참여 신청을 하셨습니다.</p>
								</c:when>
								
								<c:when test="${message.type == 'REJECT'}">
									<p class="small text-muted">
										<span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/>
									</p>
									<p>스터디 신청이 거절되었습니다.</p>
								</c:when>
								
								<c:when test="${message.type == 'ACCEPT'}">
									<p class="small text-muted">
										<span class="glyphicon glyphicon-time"></span> <fmt:formatDate value="${message.writeDate }" pattern="hh:mm a yy/MM/dd"/>
									</p>
									<p>스터디 참여 신청이 승인되었습니다.</p>
								</c:when>
								
							</c:choose>
						</div>
					</a></li>
				</c:forEach>
				<c:if test="${fn:length(navmsgList) == 0 }">
					<li class="message-preview">
						<div class="media" style="margin-top: 10px">
							<p class="text-center">메시지가 없습니다. </p>
						<div class="media">
					</li>
				</c:if>
				<!-- 
				<li class="message-preview"><a href="#">
					<div class="media">
						<h5 class="media-heading">
							<strong>영어회화스터디</strong>
						</h5>
						<p class="small text-muted">
							<span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM
						</p>
						<p>김유신 님께서 모임신청을 하셨습니다.</p>
					</div>
				</a></li>
				<li class="message-preview"><a href="#">
					<div class="media">
						<h5 class="media-heading">
							<strong>영어회화스터디</strong>
						</h5>
						<p class="small text-muted">
							<span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM
						</p>
						<p>강감찬 님께서 모임신청을 하셨습니다.</p>
					</div>
				</a></li>
				<li class="message-preview"><a href="#">
					<div class="media">
						<h5 class="media-heading">
							<strong>중국어 스터디</strong>
						</h5>
						<p class="small text-muted">
							<span class="glyphicon glyphicon-time"></span> Yesterday at 4:32 PM
						</p>
						<p>모임신청이 거절 당하였습니다.</p>
					</div>
				</a></li>
				-->
				<li class="message-footer"><a href="/sroup/mypage/messagebox.do">Read All New
						Messages</a></li>
				</ul></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		          		<span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${sessionScope.LOGIN_NAME } 님 <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="/sroup/mypage/profileupdate.do">마이페이지</a></li>
		            <li><a href="/sroup/mypage/profileupdate.do">회원정보수정</a></li>
		            <li><a href="/sroup/mypage/mystudy.do">나의 스터디</a></li>
		            <li class="divider"></li>
		            <li><a href="/sroup/login/logout.do">로그아웃</a></li>
		          </ul>
		        </li>
			</c:when>
			<c:otherwise>
				<li><a href="/sroup/login/login.do">로그인</a></li>
				<li class="divider-vertical"> </li>
				<li><a href="/sroup/login/signup.do">회원가입</a></li>
			</c:otherwise>
		</c:choose>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
