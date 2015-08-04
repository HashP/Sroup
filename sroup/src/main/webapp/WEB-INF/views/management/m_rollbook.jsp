<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
	padding-bottom: 50px;
}

.container-fluid {
	height: 100%;
}

.row {
	height: 100%;
}

#left_nav {
	height: 100%;
	width: 136px;
	background-image: linear-gradient(to bottom, #3c3c3c 0, #222 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3c3c3c',
		endColorstr='#ff222222', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	background-repeat: repeat-x;
	border: #;
	border-color: #;
}

#left-nav2 {
	height: 100%;
	width: 145px;
	background-color: orange;
	background-repeat: repeat-x;
}

#side_nav {
	height: 100%;
	position: fixed;
}

#footer-nav {
	border-style: hidden;
	border-color: red;
}

#page-wrapper {
	height: 80%;
}

#notice_content {
	
}

</style>
<script type="text/javascript">	
$(document).ready(function(){
  /*  $(".notice").hover(function(){
    	var $id = $(this).attr('id');    	
    	 $("#"+$id+" h1").append("<a href=\"#\" class=\"btn btn-default\"><span class=\"glyphicon glyphicon-wrench\"></span></a>");
    	
    });*/
});
</script>
<title>Insert title here</title>
</head>
<body>
<!-- 네비부분 -->
	<div id="side_nav">
	<nav id="left_nav" class="col-md-2 sidebar, nav nav-pills nav-stacked">
	<div style="width: 136px; height: 135px;">
		<img alt="프로필" src="resources/images/p.png"
			style="width: 136px; height: 135px; margin-bottom: 5px; margin-top: 5px;">
	</div>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
		<li><a href="/sroup/m_main.do">공지사항</a></li>
		<li><a href="#">출석부</a></li>
		<li><a href="#">캘린더</a></li>
		<li><a href="/sroup/m_album.do">갤러리</a></li>
		<li><a href="/sroup/m_memberspeak.do">회원한마디</a></li>
		<li><a href="/sroup/m_border.do">게시판</a></li>
	</ul>
	</nav>
	<nav id="left-nav2" class="col-md-2 sidebar, nav nav-pills nav-stacked">
	<ul class="nav nav-sidebar">
		<li><a href="#">공지사항</a></li>
		<li><a href="#">공지사항2</a></li>
		<li>내 정보 표시 구간</li>
		<li>카페 정보 표시 구간</li>
	</ul>
	</nav>
	</div>


	<nav id="footer-nav" class="navbar navbar-inverse navbar-fixed-bottom">
	
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="font-family: '나눔고딕';">SROUP</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>

<!-- content 부분 -->
	<div class="container">
		
	</div>


</body>
</html>