<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/sroup/resources/bootstrap/bootstrap-theme.css">
<style type="text/css">
.navbar {
	vertical-align: top;
	height: 33px;
	border-radius: 0;
}

.navbar-inverse .menubar {
	margin: auto;
	width: 980px;
	height: 34px;
	
}

.navbar-inverse .navbar-nav>li {
	margin-top: 5px;
	height: 26px;
}

.navbar-inverse .navbar-nav>li>a {
	background: url("http://static.onoffmix.com/images3/global/bulRightBar.gif") no-repeat 100% 1px;
	background-position-x: 100%;
    background-position-y: 1px;
    background-size: initial;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
    line-height: 0.9em;
	letter-spacing:-1px;
	display: block;
	padding: 0 15px;
	margin: 4px -2px 0px 0px;
	height: 14px;
}
.navbar-inverse .navbar-nav>li>a:hover {
	text-decoration: underline;
}

.navbar-inverse .navbar-nav>li.last>a {
	background: none;
}

.navbar-inverse .siteMenu {
	float: left;
	height: 34px;
}

.navbar-inverse .serviceMenu {
	float: right;
	height: 34px;
}
</style>
<nav class="navbar navbar-inverse">
	<div class="menubar">
		<div class="siteMenu">
			<ul class="nav navbar-nav">
				<li class="first"><a href="#">모임</a></li>
				<li><a href="#">미정</a></li>
				<li class="last"><a href="#">미정</a></li>
			</ul>
		</div>
		<div class="serviceMenu">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">로그인</a></li>
				<li class="last"><a href="#">미정</a></li>
			</ul>
		</div>
	</div>
</nav>
