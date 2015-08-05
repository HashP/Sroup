<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#left_nav {
	height: 100%;
	width: 133px;
	background: url('resources/images/bg_aside.png') right top repeat-y;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3c3c3c',
		endColorstr='#ff222222', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	padding-right:3px;
	border: #;
	border-color: #;
	
}

#left-nav2 {
	height: 100%;
	width: 278px;
	background-color: #c84d2e;
	background-repeat: repeat-x;
}
#side_nav{
	height: 100%;
	position: fixed;
}
</style> 
<div id="side_nav">
	<nav id="left_nav" class="col-md-2 sidebar, nav nav-pills nav-stacked">
	<div style="width: 130px; height: 130px;">
		<img alt="프로필" src="resources/images/woo.jpg"
			style="width: 130px; height: 130px; margin-bottom: 5px; margin-top: 5px;">
	</div>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
		<li><a href="/sroup/m_main.do">공지사항</a></li>
		<li><a href="#">출석부</a></li>
		<li><a href="/sroup/m_calendar.do">캘린더</a></li>
		<li><a href="/sroup/m_album.do">갤러리</a></li>
		<li><a href="/sroup/m_comment.do">회원한마디</a></li>
		<li><a href="/sroup/m_border.do">게시판</a></li>
	</ul>
	</nav>
	<nav id="left-nav2" class="sidebar, nav nav-pills nav-stacked">
	<ul class="nav nav-sidebar">
		<li><a href="#">공지사항</a></li>
		<li><a href="#">공지사항2</a></li>
		<li>내 정보 표시 구간</li>
		<li>카페 정보 표시 구간</li>
	</ul>
	</nav>
</div>

	