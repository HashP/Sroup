<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<style type="text/css">
body {
	background-color: #C2D2D2;
}

hr {
	color: #C2D2D2;
	background-color: #C2D2D2;
	height: 5px;
}

#page-wrapper {
	border-radius: 25px;
	width: 700px;
/* 	height: 1000px; */
	padding: 50px;
	margin: auto;
	margin-top: 120px;
	background-color: white;
}

#logintitle {
	padding-left: 10px;
	font-family: '나눔고딕';
}

#loginform {
	width: 600px;
	margin: auto;
	margin-top: 25px;
}
</style>







<div id="page-wrapper">
	<div id="loginform">
		<form class="form" method="post" action="login.do">
			<h1 class="text-left" id="logintitle">로그인</h1>
			<hr>
			<div class="form-group">
				<input type="text" class="form-control input-lg" placeholder="id" id="id" name="id">
			</div>
			<div class="form-group">
				<input type="password" class="form-control input-lg"
					placeholder="Password" id="pwd" name="pwd">
			</div>
			<div class="form-group">
				<button class="btn btn-primary btn-lg btn-block">Sign In</button>
				<span class="pull-right"><a href="signup.do">회원가입하기</a></span><span><a
					href="#">Need help?</a></span>
			</div>
		</form>
	</div>

</div>
