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

</style>
 
<div id="page-wrapper">
	<div  id="signform">
		<form class="form">
			<h1 class="text-left" id="signuptitle">회원가입</h1>
			<hr>
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" class="form-control input-lg" placeholder="아이디" name="id" id="id">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" class="form-control input-lg" placeholder="비밀번호" name="pwd" id="pwd">
			</div>
			<div class="form-group">
				<label for="pwdcheck">비밀번호확인</label>
				<input type="password" class="form-control input-lg" placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control input-lg" placeholder="이름" name="name" id="name">
			</div>
			<div class="form-group">
				<label for="nickname">별명</label>
				<input type="text" class="form-control input-lg" placeholder="별명" name="nickname" id="nickname">
			</div>
			<div class="form-group">
				<label for="phone">휴대폰</label>
				<input type="text" class="form-control input-lg" placeholder="휴대폰 번호 또는 전화번호" name="phone" id="phone">
			</div>
			<div class="form-group">
				<label for="email">이메일 주소</label>
				<input type="text" class="form-control input-lg" placeholder="이메일 주소" name="email" id="email">
			</div>
			<div class="form-group">
				<label for="profilephoto">프로필 사진</label>
				<input type="file" class="form-control input-lg" placeholder="프로필 사진" name="profilephoto" id="profilephoto">
				<br>
				<div id="img-thumbnail">
				</div>
			</div>
			<hr>
			<div class="form-group">
				<button class="btn btn-primary btn-lg ">가입하기</button>
				<a class="btn btn-default btn-lg " href="login.do" >이전으로</a>
			</div>
		</form>
	</div>

</div>    

<script type="text/javascript">
$(function(){

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