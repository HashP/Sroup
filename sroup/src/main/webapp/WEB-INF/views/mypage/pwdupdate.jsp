<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">


#updatetitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}



#updateform {
	width: 600px;
}

</style>


<div  id="updateform" class="panel panel-default">
	<div class="panel-body">
	<form class="form">
		<h1 class="panel-title" id="updatetitle">비밀번호 변경</h1>
		<hr>
		<div class="form-group">
			<label for="pwd">기존의 비밀번호</label>
			<input type="password" class="form-control" placeholder="이전의 비밀번호" name="pwd" id="pwd">
		</div>
		<div class="form-group">
			<label for="newpwd">새로운 비밀번호</label>
			<input type="password" class="form-control" placeholder="새로운 비밀번호 " name="newpwd" id="newpwd">
		</div>
		<div class="form-group">
			<label for="pwdcheck">비밀번호확인</label>
			<input type="password" class="form-control" placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
		</div>
		<div class="form-group">
			<button class="btn btn-primary">변경하기</button>
		</div>
	</form>
	</div>
</div>
