<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	textarea{
		resize: none
	}
</style>
<script type="text/javascript">
	function commentCheck(){		
		if($("textarea[name='content']").val().trim() == ""){
			event.preventDefault();
		}
	}
	
</script>
<!-- content 부분 -->
	<div class="container">
		<h1 id="bordname">회원 한마디</h1>
		<div class="well" style="height: 200px;">
			<form class="form-horizontal" role="form" action="/sroup/comment_add.do">
				<h4>What's your think</h4>
				<div class="form-group" style="padding: 14px 14px 0px 14px;">
					<textarea class="form-control" name="content" placeholder="한 마디를 남겨주세요"
						style="height: 60px;"></textarea>
				</div>
				<div>				
					<button class="btn btn-success pull-right" type="submit" onclick="commentCheck();">남기기</button>
				</div>
				<br>
			</form>
		</div>
		<!--/well-->
		<!-- 내용 입력한거 보는 곳 -->
		<div class="speak_contents" style="padding-top: 20px;">
		<c:forEach var="comment" items="${commentList}">
		<div class="row" style="padding-left: 15px;">
			<div class="col-sm-10">
				<div class="row">
				<h4>${comment.c_content} </h4>
				</div>
			</div>
			<div class="col-sm-2">
			<small class="text-muted">${comment.c_writer}</small>
					<small class="text-muted">${comment.c_write_day}</small>
				<a href="#" class="pull-right">
				<!-- 나중에 이미지 db에서 가져와서 뿌려주는걸로 바꿀 것!! -->
				<img
					src="http://api.randomuser.me/portraits/thumb/men/86.jpg"
					class="img-circle"></a>						
				
			</div>
		</div>
	<HR>
	</c:forEach>
	
	</div>
	<!-- 페이지 선택 부분 -->
	<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
	</div>
