<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	position: relative;
	width: 600px;
	margin: auto;
	margin-top: 25px;
}

.alert {
	position: absolute;
	top: -15px;
	width: 100%;
	
}
</style>


<div id="page-wrapper">
	<div id="loginform">
		
		<c:if test="${!empty loginResult }">
			<c:choose>
				<c:when test="${loginResult == 'FAILED'}">
					<div class="alert alert-danger alert-dismissible" role="alert">
						아이디 혹은 비밀번호가 맞지 않습니다. 다시 시도해 주십시오
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${!empty signResult }">
			<c:choose>
				<c:when test="${signResult == 'SUCCESS'}">
					<div class="alert alert-success alert-dismissible" role="alert">
						회원가입이 성공적으로 완료되었습니다.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${!empty needLogin }">
			<c:choose>
				<c:when test="${needLogin == 'NEED'}">
					<div class="alert alert-warning alert-dismissible" role="alert">
						로그인이 필요한 서비스 입니다.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:when>
			</c:choose>
		</c:if>
		
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

<script>
$(function() {
	$(".form").on("submit", function(event) {
		
		// null검사
		$(".form input").filter(function(index, el){  

			if($(el).val().trim() == ''){
				event.preventDefault();
				return true;
			}
			return false;
		})[0].focus();
		
	});
	
});

</script>