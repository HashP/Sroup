<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

body {
	background-color: #C2D2D2;
}

hr {
	color: #C2D2D2;
	background-color: #C2D2D2;
	height: 5px;
}
#signuptitle {
	padding-left: 10px;
	font-family: '나눔고딕';
}

#page-wrapper {
	border-radius: 25px;
	width: 60%;
	padding: 50px;
	padding-bottom: 25px;
	margin: 50px auto 50px auto;
	background-color: white;	
}

#signform {

	width: 600px;
/* 	height: 300px; */
	margin: auto;
	margin-top: 25px;
}

.error-message {
	display: none;
	color: #a94442;
}

</style>
 
<div id="page-wrapper">
	<div  id="signform">
		<form class="form">
			<h1 class="text-left" id="signuptitle">회원가입</h1>
			<hr>
			<div class="form-group">
				<label for="id" class="control-label">아이디</label>
				<input type="text" class="form-control " placeholder="아이디" name="id" id="id">
				<p class="error-message">아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.</p>
			</div>
			<div class="form-group">
				<label for="pwd" class="control-label">비밀번호</label>
				<input type="password" class="form-control " placeholder="비밀번호" name="pwd" id="pwd">
			</div>
			<div class="form-group">
				<label for="pwdcheck" class="control-label">비밀번호확인</label>
				<input type="password" class="form-control " placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
			</div>
			<div class="form-group">
				<label for="name" class="control-label">이름</label>
				<input type="text" class="form-control " placeholder="이름" name="name" id="name">
			</div>
			<div class="form-group">
				<label for="nickname" class="control-label">별명</label>
				<input type="text" class="form-control " placeholder="별명" name="nickname" id="nickname">
			</div>
			<div class="form-group">
				<label for="phone" class="control-label">휴대폰</label>
				<input type="text" class="form-control " placeholder="휴대폰 번호 또는 전화번호" name="phone" id="phone">
			</div>
			<div class="form-group">
				<label for="email" class="control-label">이메일 주소</label>
				<input type="text" class="form-control " placeholder="이메일 주소" name="email" id="email">
			</div>
			<div class="form-group">
				<label for="profilephoto" class="control-label">프로필 사진</label>
				<input type="file" class="form-control " placeholder="프로필 사진" name="profilephoto" id="profilephoto">
				<br>
				<div id="img-thumbnail">
				</div>
			</div>
			<hr>
			<div class="form-group">
				<button class="btn btn-default  ">가입하기</button>
				<a class="btn btn-default " href="login.do" >이전으로</a>
			</div>
		</form>
	</div>

</div>    
<script type="text/javascript" src="../resources/js/form-validation.js"></script>
<script type="text/javascript">
$(function(){

	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	var passwordReg = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var usernameRegExp = /^[가-힝]{2,}$/;
	var emailReg = /^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$/;
	
	
	
	$("#id").on("blur", function() {
		
		var id = $("#id").val();
		
		if(!idReg.test(id)) {
			form.error($(this));	
			return false;
		}
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var upload = $("input[name='profilephoto']")[0];
	var holder = document.getElementById('img-thumbnail');

	upload.onchange = function(e) {
		e.preventDefault();

		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			// note: no onload required since we've got the dataurl...I think! :)
			if (img.width > 300) { // holder width
				img.width = 300;
			}
			holder.innerHTML = '';
			holder.appendChild(img);
		};
		reader.readAsDataURL(file);

		return false;
	}
		
	function checkvalue() {
		var upload = $("input[name='profilephoto']")[0];
		var imgex = ['bmp', 'jpg', 'gif', 'png', 'jpeg', 'BMP', 'JPG', 'GIF', 'PNG', 'JPEG'];

		if(!upload.value) {
			alert("이미지 파일을 업로드 해야합니다.")
			return false;
		}
		
		
		var v = upload.value.split('\\');
		var filename = v[v.length-1];
		
		v = filename.split('.');
		var extension = v[v.length-1];
		
		var isImg = imgex.indexOf(extension);
		if(isImg === -1) {
			alert("이미지 파일만 업로드할 수 있습니다. ");
			return false;
		}
		
		return true;
	}
});
</script> 