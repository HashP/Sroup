<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 저장됐나 보는용 -->

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
		<form class="form" method="post" action="register.do" enctype="multipart/form-data">
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
				<p class="error-message">비밀번호는 비밀번호는 영문, 숫자를 혼용하여 6~20자 이내로 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="pwdcheck" class="control-label">비밀번호확인</label>
				<input type="password" class="form-control " placeholder="비밀번호 재확인" name="pwdcheck" id="pwdcheck">
				<p class="error-message">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="name" class="control-label">이름</label>
				<input type="text" class="form-control " placeholder="이름" name="name" id="name">
				<p class="error-message">이름은 한글로 2글자 이상 입력해 주세요.</p>
			</div>
			<div class="form-group">
				<label for="nickname" class="control-label">별명</label>
				<input type="text" class="form-control " placeholder="별명" name="nickname" id="nickname">
				<p class="error-message">별명을 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="phone" class="control-label">휴대폰</label>
				<input type="text" class="form-control " placeholder="휴대폰 번호 또는 전화번호" name="phone" id="phone">
				<p class="error-message">올바른 휴대폰 번호 형식이 아닙니다.</p>
			</div>
			<div class="form-group">
				<label for="email" class="control-label">이메일 주소</label>
				<input type="text" class="form-control " placeholder="이메일 주소" name="email" id="email">
				<p class="error-message">이메일 형식에 맞지 않습니다.</p>
			</div>
			<div class="form-group">
				<label for="profilephoto" class="control-label">프로필 사진</label>
				<input type="file" accept="image/*" class="form-control " placeholder="프로필 사진" name="photofile" id="profilephoto">
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
	
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/;
	var passwordReg = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var usernameRegExp = /^[가-힝]{2,}$/;
	var emailReg = /^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$/;
	var phoneReg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;	
	
	function idcheck() {
		var id = $("#id").val();
		
		if(!idReg.test(id)) {
			form.error($("#id"));	
			return false;
		} else {
			form.success($("#id"));
			return true;
		}
		
		//http://localhost/sroup/login/idduplication.do?id= 로 ajax요청하기 
		//isIdOk : false --> 중복된 아이디 , true --> 사용가능한 아이디
		// 내일 하기
	
		
	};

	$("#pwd").on("blur", function() {
		
		var pwd = $("#pwd").val();
		
		if(!passwordReg.test(pwd)) {
			form.error($(this));
			return false;
		} else {
			form.success($(this));
			return true;
		}
	});
	
	function pwdcheck() {
		
		if($(".has-success #pwd").length == 0) {
			form.error($("#pwd"));
			$("#pwd").focus();
			return false;
		} 
		
		var pwd = $(".has-success #pwd").val();
		var pwdck = $("#pwdcheck").val();
		
		if(pwd != pwdck) {
			form.error($("#pwdcheck"));
			return false;
		}
		
		form.success($("#pwdcheck"));
		return true;		
		
	};
	
	function namecheck() {
		
		var name = $("#name").val();
		
		if(!usernameRegExp.test(name)) {
			form.error($("#name"));
			return false;
		} else {
			form.success($("#name"));
			return true;
		}
		
	};
	
	function nickcheck() {
		var nick = $("#nickname").val();
		
		if(nick.trim() == "") {
			form.error($("#nickname"));
			return false;
		} else {
			form.success($("#nickname"));
			return true;
		}
	};
	
	$("#phone").on("blur", function() {
		
		var phone = $("#phone").val();
		
		if(phone=="") {
			form.clear($(this));
			return true;
		} 
		if(!phoneReg.test(phone)) {
			form.error($(this));
			return false;
		} else {
			form.success($(this));
			return true;
		}
	});
	
	
	function emailcheck() {
		
		var email = $("#email").val();
		
		if(!emailReg.test(email)) {
			form.error($("#email"));
			return false;
		} else {
			form.success($("#email"));
			return true;
		}
		
	};
	
	
	$(".form").on("submit", function(event) {
		
		var validation = true;
		
		// 에러가 있는지		
		if($(".has-error").length > 0) {
			event.preventDefault();
			return false;
		}
		
		//아이디검사 -- 중복검사 했는지도 체크
		//비밀번호확인 --> 비밀번호 체크만 잘되도 됭
		//이름검사
		//별명
		//이메일
		
		
/* 		if(!idcheck()) {
			validation = false;
		}
		
		if(!pwdcheck()) {
			validation = false;
		}
		
		if(!namecheck()) {
			validation = false;
		}
		
		if(!nickcheck()) {
			validation = false;
		}
		
		if(!emailcheck()) {
			validation = false;
		} */
		
		validation = validation & idcheck() & pwdcheck() & namecheck() & nickcheck() & emailcheck(); 
		
		// 다 검사해야 다음페이지로 
		if(!validation) {
			console.log("false");
			event.preventDefault();
			return false;
		}
		
		return true;
		
	});
	
	$("#id").on("blur", idcheck);
	$("#pwdcheck").on("blur", pwdcheck);
	$("#name").on("blur", namecheck);
	$("#nickname").on("blur", nickcheck);
	$("#email").on("blur", emailcheck);

//** img 처리
	var holder = document.getElementById('img-thumbnail');

	var uploadchange = function(e) {
		e.preventDefault();

		var upload = $("#profilephoto")[0];
		var file = upload.files[0], reader = new FileReader();
		
		if(!checkvalue()) {
			return false;
		}
		
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
	
	$("#profilephoto").on("change", uploadchange);
	
	function checkvalue() {
		var upload = $("#profilephoto");
		var imgex = ['bmp', 'jpg', 'gif', 'png', 'jpeg', 'BMP', 'JPG', 'GIF', 'PNG', 'JPEG'];

		/* if(!upload.val()) {
			alert("이미지 파일을 업로드 해야합니다.")
			return false;
		} */
		
		var v = upload.val().split('\\');
		var filename = v[v.length-1];
		
		v = filename.split('.');
		var extension = v[v.length-1];
		
		var isImg = imgex.indexOf(extension);
		if(isImg === -1) {
			alert("이미지 파일만 업로드할 수 있습니다. ");
			upload.replaceWith( upload = upload.clone( true ) );
			$("#img-thumbnail img").remove();
			return false;
		}
		
		return true;
	}
});
</script> 