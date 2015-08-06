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
.form-control, input[type=file]  {
/* 	width: 400px; */
} 

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

#img-thumbnail {
	text-align: center;
}


</style>

<div  id="updateform" class="panel panel-default">
	<div class="panel-body">

		<h1 class="panel-title" id="updatetitle">회원정보 수정</h1>
		<hr>
		<form class="form-inline" method="post" action="profileupdate.do" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id" class="control-label">아이디</label>
				<input type="text" class="form-control input" placeholder="아이디" name="id" id="id" disabled="disabled" value="${userinfo.id }">
			</div>
			<div class="form-group">
				<label for="name" class="control-label">이름</label>
				<input type="text" class="form-control input" placeholder="이름" name="name" id="name" value="${userinfo.name }">
				<p class="error-message">이름은 한글로 2글자 이상 입력해 주세요.</p>
			</div>
			<div class="form-group">
				<label for="nickname" class="control-label">별명</label>
				<input type="text" class="form-control input" placeholder="별명" name="nickname" id="nickname" value="${userinfo.nickname }">
				<p class="error-message">별명을 입력해주세요.</p>
			</div>
			<div class="form-group">
				<label for="phone" class="control-label">휴대폰</label>
				<input type="text" class="form-control input" placeholder="휴대폰 번호 또는 전화번호" name="phone" id="phone" value="${userinfo.phone }">
				<p class="error-message">올바른 휴대폰 번호 형식이 아닙니다.</p>
			</div>
			<div class="form-group">
				<label for="email" class="control-label">이메일 주소</label>
				<input type="text" class="form-control input" placeholder="이메일 주소" name="email" id="email" value="${userinfo.email }">
				<p class="error-message">이메일 형식에 맞지 않습니다.</p>
			</div>
			<div class="form-group">
				<label for="profilephoto" class="control-label">프로필 사진</label>
				<input type="file" accept="image/*" class="form-control input" placeholder="프로필 사진" name="photofile" id="profilephoto">
				<br>
				<br>
				<div id="img-thumbnail" >
					<img alt="" src="${imgpath}${userinfo.profilephoto }">
				</div>
			</div>
			<br>
			<div class="form-group">
				<button class="btn btn-primary">수정하기</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="../resources/js/form-validation.js"></script>
<script type="text/javascript">
$(function(){
	
	var usernameRegExp = /^[가-힝]{2,}$/;
	var emailReg = /^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$/;
	var phoneReg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;	
	
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
	
	$("form").on("submit", function(event) {
		//console.log('submit');
		
		var validation = true;
		// 에러가 있는지		
		if($(".has-error").length > 0) {
			event.preventDefault();
			console.log("has-error");
			$(".has-error > input").first().focus();
			return false;
		}
		
		validation = validation & namecheck() & nickcheck() & emailcheck(); 
		

		// 다 검사해야 다음페이지로 
		if(!validation) {
			console.log("false");
			event.preventDefault();
			$(".has-error > input").first().focus();
			return false;
		}
		
		return true;
	});

	$("#name").on("blur", namecheck);
	$("#nickname").on("blur", nickcheck);
	$("#email").on("blur", emailcheck);
	
	
//**	
	var holder = document.getElementById('img-thumbnail');

	var uploadchange = function(e) {
		e.preventDefault();
		
		form.clear($("input[name='profilephoto']"));
		var upload = $("input[name='profilephoto']")[0];
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
			form.success($("input[name='profilephoto']"));
		};
		reader.readAsDataURL(file);

		return false;
	}
	
	$("input[name='profilephoto']").on("change", uploadchange);
	
	function checkvalue() {
		var upload = $("input[name='profilephoto']");
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