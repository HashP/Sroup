<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.navbar {
	min-height: 30px;
	margin: 0px;
}

.navbar-nav > li > a, .navbar-brand{
    padding-top:4px !important; 
    padding-bottom:0 !important;
    height: 28px;
}

.navbar-brand {
	font-family: '나눔고딕';
	font-weight: bold; 
}

.message-dropdown {
	width: 300px;
	height: 200px;
	overflow-y: auto;
	overflow-x: hidden;
}

</style>

<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" style="color: #0099CC;" href="#">SROUP</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">모임 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
        	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-bell"></span> 알림 <span class="caret"></span></a>
			<ul class="dropdown-menu message-dropdown">
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
				<li class="divider"></li>
				<li class="message-footer"><a href="#">Read All New
						Messages</a></li>
			</ul>
			
			</li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          		<span class="glyphicon glyphicon-user" aria-hidden="true"></span> 홍길동 님 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/sroup/mypage/profileupdate.do">마이페이지</a></li>
            <li><a href="/sroup/mypage/profileupdate.do">회원정보수정</a></li>
            <li><a href="#">나의 스터디</a></li>
            <li class="divider"></li>
            <li><a href="/sroup/login/logout.do">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
