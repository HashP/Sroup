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

		<h1 class="panel-title" id="updatetitle">회원정보 수정</h1>
		<hr>
		<form class="form">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" class="form-control" placeholder="아이디" name="id" id="id">
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" placeholder="이름" name="name" id="name">
			</div>
			<div class="form-group">
				<label for="nickname">별명</label>
				<input type="text" class="form-control" placeholder="별명" name="nickname" id="nickname">
			</div>
			<div class="form-group">
				<label for="phone">휴대폰</label>
				<input type="text" class="form-control" placeholder="휴대폰 번호 또는 전화번호" name="phone" id="phone">
			</div>
			<div class="form-group">
				<label for="email">이메일 주소</label>
				<input type="text" class="form-control" placeholder="이메일 주소" name="email" id="email">
			</div>
			<div class="form-group">
				<label for="profilephoto">프로필 사진</label>
				<input type="file" class="form-control" placeholder="프로필 사진" name="profilephoto" id="profilephoto">
				<br>
				<div id="img-thumbnail">
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-primary">수정하기</button>
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