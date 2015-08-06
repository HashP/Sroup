<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">


#updatetitle {
	padding-left: 10px;
	font-family: '나눔고딕';
	margin-top: 0px;
}

#updateform {
	width: 100%;
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

.form-inline .form-group .input {
	width: 450px;
}

.btn-area {
	margin-right: 60px;
}

.result-message {
	padding: 15px;
}


</style>


<div  id="updateform" class="panel panel-default">
	<div class="panel-body">
		<h1 class="panel-title" id="updatetitle">비밀번호 변경</h1>
		<hr>
		
		<c:if test="${!empty updateResult }">
			<c:choose>
				<c:when test="${updateResult}">
					<div class="alert alert-success alert-dismissible" role="alert">
						비밀번호가 성공적으로 변경되었습니다.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-warning alert-dismissible" role="alert">
						입력하신 비밀번호가 틀립니다. 다른 비밀번호를 입력하십시오.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<form class="form-inline" method="post" action="pwdupdate.do">
			<div class="form-group">
				<label for="pwd" class="control-label">현재 비밀번호</label>
				<input type="password" class="form-control input" placeholder="이전의 비밀번호" name="oldpwd" id="oldpwd">
				<p class="error-message">현재 비밀번호를 입력해주세요</p>
			</div>
			<div class="form-group">
				<label for="newpwd" class="control-label">새 비밀번호</label>
				<input type="password" class="form-control input" placeholder="새로운 비밀번호 " name="newpwd" id="newpwd">
				<p class="error-message">비밀번호는 영문, 숫자를 혼용하여 6~20자 이내로 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="pwdcheck" class="control-label">비밀번호 확인</label>
				<input type="password" class="form-control input" placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
				<p class="error-message">비밀번호가 일치하지 않습니다. </p>
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
	
	var passwordReg = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

	$("#oldpwd").on("blur", function() {
		var pwd = $("#oldpwd").val();
		
		if(pwd.trim() == "") {
			form.error($(this));
			return false;
		}
		form.clear($(this));
		return true;
		
		
	})
	
	$("#newpwd").on("blur", function() {
		var pwd = $("#newpwd").val();
		
		if(!passwordReg.test(pwd)) {
			form.error($(this));
			return false;
		} else {
			form.success($(this));
			return true;
		}
	});
	
	function pwdcheck() {
		
		if($(".has-success #newpwd").length == 0) {
			form.error($("#newpwd"));
			$("#newpwd").focus();
			return false;
		} 
		
		var pwd = $(".has-success #newpwd").val();
		var pwdck = $("#pwdcheck").val();
		
		if(pwd != pwdck) {
			form.error($("#pwdcheck"));
			return false;
		}
		
		form.success($("#pwdcheck"));
		return true;		
		
	};
	
	$("#pwdcheck").on("blur", pwdcheck);

	
	$(".form-inline").on("submit", function(event) {
		console.log('submit');
		
		$("#oldpwd").blur();
		pwdcheck();
		
		if($(".has-error").length > 0) {
			event.preventDefault();
			$(".has-error > input").first().focus();
			return false;
		}
		return true;
	
	});
})
</script>
