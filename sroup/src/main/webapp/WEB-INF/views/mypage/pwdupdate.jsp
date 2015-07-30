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

.control-label {
	width: 100px;
}
.form-control, input[type=file]  {
	width: 400px;
	display: inline-block;
}

.error-message {
	display: none;
	color: #a94442;
	margin-left:100px;
}

.btn-area {
	margin-right: 60px;
}


</style>


<div  id="updateform" class="panel panel-default">
	<div class="panel-body">
	<form class="form">
		<h1 class="panel-title" id="updatetitle">비밀번호 변경</h1>
		<hr>
		<div class="form-group">
			<label for="pwd" class="control-label">현재 비밀번호</label>
			<input type="password" class="form-control not-null" placeholder="이전의 비밀번호" name="pwd" id="pwd">
			<p class="error-message">비밀번호를 입력해주세요</p>
		</div>
		<div class="form-group">
			<label for="newpwd" class="control-label">새 비밀번호</label>
			<input type="password" class="form-control not-null" placeholder="새로운 비밀번호 " name="newpwd" id="newpwd">
			<p class="error-message">비밀번호를 입력해주세요</p>
		</div>
		<div class="form-group">
			<label for="pwdcheck" class="control-label">비밀번호 확인</label>
			<input type="password" class="form-control not-null" placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
			<p class="error-message">비밀번호를 입력해주세요</p>
		</div>
		<div class="form-group pull-right btn-area">
			<input type="submit" class="btn btn-primary" value="변경하기">
		</div>
	</form>
	</div>
</div>

<script>
$(function() {
	$(".form").on("submit", function(event) {
		console.log('submit');
		$(".error-message").hide();
		$(".not-null").parent().removeClass("has-error")
		
		var check_null = $(".not-null").filter(function(index, el){  

			if($(el).val()===''){
				$(el).siblings(".error-message").show();	
				return true;
			}
		}).parent().addClass("has-error");
			
		if(check_null.length) {
			event.preventDefault();
			return false;
		}
			
		return true;
	
	});
})
</script>
