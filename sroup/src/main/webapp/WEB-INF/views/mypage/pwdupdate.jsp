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
.form-inline .form-group {
	margin-bottom: 15px;
}
/* .form-control, input[type=file]  {
	width: 400px;
	display: inline-block;
} */

.error-message {
	display: none;
	color: #a94442;
	margin-left:100px;
	margin-bottom: 0px;
}

.btn-area {
	margin-right: 60px;
}


</style>


<div  id="updateform" class="panel panel-default">
	<div class="panel-body">
		<h1 class="panel-title" id="updatetitle">비밀번호 변경</h1>
		<hr>
		<form class="form-inline" method="post">
			<div class="form-group">
				<label for="pwd" class="control-label">현재 비밀번호</label>
				<input type="password" class="form-control not-null" placeholder="이전의 비밀번호" name="pwd" id="pwd">
				<p class="error-message">현재 비밀번호를 입력해주세요</p>
			</div>
			<div class="form-group">
				<label for="newpwd" class="control-label">새 비밀번호</label>
				<input type="password" class="form-control not-null" placeholder="새로운 비밀번호 " name="newpwd" id="newpwd">
				<p class="error-message">새 비밀번호를 입력해주세요</p>
			</div>
			<div class="form-group">
				<label for="pwdcheck" class="control-label">비밀번호 확인</label>
				<input type="password" class="form-control not-null" placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
				<p class="error-message">새 비밀번호를 입력해주세요</p>
			</div>
			<br>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="변경하기">
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="../resources/js/form-validation.js"></script>
<script>
$(function() {
	$(".form-inline").on("submit", function(event) {
		console.log('submit');
		form.clear($(".not-null"));
		
		var check_null = $(".not-null").filter(function(index, el){  
			
			console.log("[" + $(el).val() + "]");
			if($(el).val()==''){
				form.error($(el));	
				return true;
			}
		});
			
		if(check_null.length) {
			event.preventDefault();
			return false;
		}
			
		return true;
	
	});
})
</script>
