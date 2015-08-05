<%@page import="com.cj.sroup.vo.M_galleryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.albumlist_img{		
		max-height: 300px;		 
	}
	textarea[name='contents']{
		resize: none
	}

</style>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			if (!checkvalue()) {
				return false;
			}
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	// 사진 올리기 클릭시 전에 띄었던 모달창 초기화
	function resetModal() {
		var upload = $("input[name='albumphoto']");
		upload.replaceWith(upload = upload.clone(true));
		$("input[name='title']").val("");
		$("textarea[name='contents']").val("");

		$('#blah').attr('src', 'http://placehold.it/750x500');
	}

	function imageClick() {
		alert($("img", this));
		$('#img-detail').attr('src', $(this).find("img").attr('src'));
	}
	$(document).ready(function() {

		// 사진 상세 보기시 현제 저장된 이미지 보여주는 기능
		$(".photo_a").click(function() {
			var a = $("img", this).attr('src');
			$("#img-detail").attr('src', a);
		});

	});

	// 사진 업로드시 이미지 파일인지 검사
	function checkvalue() {
		var upload = $("input[name='albumphoto']");
		var imgex = [ 'bmp', 'jpg', 'gif', 'png', 'jpeg', 'BMP', 'JPG', 'GIF',
				'PNG', 'JPEG' ];

		/* if(!upload.val()) {
			alert("이미지 파일을 업로드 해야합니다.")
			return false;
		} */

		var v = upload.val().split('\\');
		var filename = v[v.length - 1];

		v = filename.split('.');
		var extension = v[v.length - 1];

		var isImg = imgex.indexOf(extension);
		if (isImg === -1) {
			alert("이미지 파일만 업로드할 수 있습니다. ");
			// 파일 리더 초기화
			upload.replaceWith(upload = upload.clone(true));
			return false;
		}

		return true;
	}
</script>


<!-- content 부분 -->
<div class="container">

	<!-- Page Header -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				앨범 <small>스터디 모임사진입니다</small> <a href="#" class="btn btn-default"
					style="float: right; margin-top: 10px" data-toggle="modal"
					data-target="#uploadModal" onclick="resetModal();"><span
					class="glyphicon glyphicon-camera"></span><span>사진올리기</span></a>
			</h1>
		</div>
	</div>
	<!-- /.row -->


	<!-- 앨범 사진 뿌려주는 곳 -->
	<c:choose>	
		<c:when test="${galleryList.size() > 6 }">
		<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="0"
					end="2">
					<div class="col-md-4 portfolio-item">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}" alt="">
						</a>
						<h3>
							<a href="#">${galleryList.g_title}</a>
						</h3>
						<p>${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="3"
					end="5">
					<div class="col-md-4 portfolio-item">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}" alt="">
						</a>
						<h3>
							<a href="#">${galleryList.g_title}</a>
						</h3>
						<p>${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="6">
					<div class="col-md-4 portfolio-item">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}" alt="">
						</a>
						<h3>
							<a href="#">${galleryList.g_title}</a>
						</h3>
						<p>${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>			
		</c:when>
		<c:when test="${galleryList.size() > 3 }">
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="0"
					end="2">
					<div class="col-md-4 portfolio-item">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}" alt="">
						</a>
						<h3>
							<a href="#">${galleryList.g_title}</a>
						</h3>
						<p>${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
				<div class="row">
					<c:forEach var="galleryList" items="${galleryList }" begin="3">
						<div class="col-md-4 portfolio-item">
							<a href="#" class="photo_a" data-toggle="modal"
								data-target="#myModal"> <img class="img-responsive albumlist_img"
								src="resources/upload/album_photo/${galleryList.imageName}" alt="">
							</a>
							<h3>
								<a href="#">${galleryList.g_title}</a>
							</h3>
							<p>${galleryList.g_content}</p>
						</div>
					</c:forEach>
				</div>
			
		</c:when>
		<c:otherwise>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="0">
					<div class="col-md-4 portfolio-item">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}" alt="">
						</a>
						<h3>
							<a href="#">${galleryList.g_title}</a>
						</h3>
						<p>${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
<!-- 앨범사진 뿌려주는 곳 끝 -->
	
	

	<hr>

	<!-- Pagination -->
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
	<!-- /.row -->

	<hr>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h1 class="page-header">
							사진 제목 <small>날짜</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- Portfolio Item Row -->
				<div class="row">

					<div class="col-md-8">
						<img id="img-detail" class="img-responsive"
							src="http://placehold.it/750x500" alt="">
					</div>

					<div class="col-md-4">

						<h3>사진 제목</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Nam viverra euismod odio, gravida pellentesque urna varius vitae.
							Sed dui lorem, adipiscing in adipiscing et, interdum nec metus.
							Mauris ultricies, justo eu convallis placerat, felis enim.</p>
						<br>
						<footer>
							<small class="text-muted">stive</small> <small class="text-muted">10:33</small>
							<a href="#" class="pull-right"><img
								src="http://api.randomuser.me/portraits/thumb/men/86.jpg"
								class="img-circle"></a>
						</footer>
					</div>

				</div>
				<!-- /.row -->

				<!-- Related Projects Row -->
				<div class="row">

					<div class="col-lg-12">
						<h3 class="page-header">이전사진</h3>
					</div>

					<div class="col-sm-3 col-xs-6">
						<a href="#"> <img class="img-responsive portfolio-item"
							src="http://placehold.it/500x300" alt="">
						</a>
					</div>

					<div class="col-sm-3 col-xs-6">
						<a href="#"> <img class="img-responsive portfolio-item"
							src="http://placehold.it/500x300" alt="">
						</a>
					</div>

					<div class="col-sm-3 col-xs-6">
						<a href="#"> <img class="img-responsive portfolio-item"
							src="http://placehold.it/500x300" alt="">
						</a>
					</div>

					<div class="col-sm-3 col-xs-6">
						<a href="#"> <img class="img-responsive portfolio-item"
							src="http://placehold.it/500x300" alt="">
						</a>
					</div>

				</div>
			</div>

		</div>

	</div>
</div>
<!-- 사진 올리기 Modal -->
<div class="modal fade" id="uploadModal" role="dialog">
	<div class="modal-dialog  modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h1 class="page-header">
							사진 업로드 <small>스터디 멤버들과의 추억을 공유하세요</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- Portfolio Item Row -->
				<div class="row" style="margin-bottom: 10px;">

					<div class="col-md-8" align="center">

						<img id="blah" src="http://placehold.it/750x500" alt=""
							class="img-responsive" style="max-height: 400px;" />
					</div>

					<div class="col-md-4">

						<form id="form1"  action="/sroup/m_album.do" method="post"
							enctype="multipart/form-data">

							<input type='file' onclick="readURL(this)"
								onchange="readURL(this);" accept="image/*" name="albumphoto"
								placeholder="앨범 사진" />
							<div class="form-group">

								<div class="col-sm-12" style="padding: 0px;">
									<input type="text" class="form-control" placeholder="제목"
										name="title">
								</div>
							</div>

							<textarea rows="15" class="form-control" placeholder="내용"
								name="contents"></textarea>
							<button style="float: right;">올리기</button>
						</form>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>
