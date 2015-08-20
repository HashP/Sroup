<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style type="text/css">
#left_nav {
	height: 100%;
	width: 133px;
	background: url('../../resources/images/bg_aside.png') right top repeat-y;
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
	position:fixed;
	background-color: #c84d2e;
	background-repeat: repeat-x;
	
}
#side_nav{
	height: 100%;
	
	
	
}

.nav-sidebar li{
height:40px;
display:block; /* a태그의 display속성을 block으로 설정 */	
	margin-bottom:1px; /* 하단에 외부여백 1px */	
	background-color:#292929; /* 바탕색 */	
	color:#BBB; /* 글자색 */	
	font:12px Verdana; /* 폰트 속성 순서대로 크기 글꼴 */
	text-transform:uppercase; /* 폰트를 대문자로 바꿔준다. */
}
.nav-sidebar li:hover{
	padding-left:10px; /* 왼쪽 여백을 기존 15px에서 10px으로 줄여준다. */
	border-left:5px solid #b6e24c; /* 줄어든 여백만큼 border로 5px을 지정해 준다. */
	color:#FFF; /* 폰트 색상 */
}
</style>

<div id="side_nav">
	
	<nav id="left-nav2" class="sidebar, nav nav-pills nav-stacked nav-fixed-side left">
	<nav id="left_nav" class="col-md-2 sidebar, nav nav-pills nav-stacked">
	<div style="width: 130px; height: 140px;">
		<img id="loginuser_profileName" alt="프로필" src=""
			style="width: 130px; height: 130px; margin-bottom: 5px; margin-top: 5px;">
	</div>
	<ul class="nav nav-sidebar">		
		<li><a href="m_main.do" style="padding: 12.5px 15px;">공지사항</a></li>
		<li><a href="testrollbook.do" style="padding: 12.5px 15px;">출석부</a></li>
		<li><a href="m_calendar.do" style="padding: 12.5px 15px;">캘린더</a></li>
		<li><a href="m_album.do" style="padding: 12.5px 15px;">갤러리</a></li>
		<li><a href="m_comment.do" style="padding: 12.5px 15px;">회원한마디</a></li>
		<li><a href="m_border.do" style="padding: 12.5px 15px;">게시판</a></li>
	</ul>
	</nav>		
		<p>내 정보 표시 구간</p>		
		<p>카페 정보 표시 구간</p>	
	<button type="button" class="btn btn-default btn-xs">관리</button>
	</nav>
</div>	
