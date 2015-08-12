<%@page import="com.cj.sroup.vo.M_galleryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="images/favicon.png">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500">
<link rel="stylesheet" href="css/screen.css">
<link rel="stylesheet" href="css/lightbox.css">
<script src="js/lightbox-plus-jquery.min.js"></script>

<style>
.albumlist_img {
	max-height: 300px;
}

textarea[name='contents'] {
	resize: none
}

.lb-nav {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	z-index: 10;
	display: block;
}

.lb-nav a.lb-prev {
	width: 34%;
	left: 0;
	float: left;
	height: 100%;
	cursor: pointer;
	margin-left: -100px
}

.lb-nav a.lb-next {
	width: 64%;
	right: 0;
	float: right;
	height: 100%;
	cursor: pointer;
	display: block;
	margin-right: -100px
}

.lb-nav a.lb-next img {
	float: right;
	position: absolute;
	right: -100px;
	top: 50%;
}

.lb-nav a.lb-prev img {
	position: absolute;
	top: 50%;
}
.modal_outer{
display: table;
    width: 100%;
    height: 100%;
}
.modal_inner{
    display: table-cell;
    vertical-align: middle;
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
		// 사진 상세 보기시 현제 저장된 값 보여주는 기능
		$(".photo_a").click(function() {
			var img = $("img", this).attr('src');	
			var g_no = $("img",this).attr('name');
			var g_title = $("#gallery_"+g_no).find(".g_title").text();
			var g_content = $("#gallery_"+g_no).find(".g_content").text();
			
			$("#detail_title").text(g_title);
			$("#detail_content").text(g_content);
			$("#img-detail").attr('src', img);
			
			// 현재 사진의 앞사진과 뒷사진 번호 가지고옴
			$.ajax({              
		        url: "getPrevNext.do",
		        data:{"g_no":g_no},             
		        success: function (data) {        	  
		        	var prev= data.PREV;
		       	  	var next = data.NEXT;
		       	  	if(!prev===false && !next===false){				       	  	
		       	  		$(".lb-prev").show();
	       	  			$(".lb-next").show();
	       	  			$(".lb-prev").attr("name",prev);
 						$(".lb-next").attr("name",next);
		       	  		
		       	  	} else if(!prev===true){
		       	  		$(".lb-prev").hide();
		       		  	$(".lb-next").show();
		       	  		$(".lb-next").attr("name",next);
		       	  	} else if(!next===true){
		       	  		$(".lb-next").hide();
		       	  		$(".lb-prev").show()
		       	  		$(".lb-prev").attr("name",prev);
		       	  	} else{
		       	  		$(".lb-prev").hide();
	 					$(".lb-next").hide();
		       	  					       	  		
		       	  	}
		        } 
			
		});

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

	$(function() {
		$(".lb-prev").children().hide();
		$(".lb-next").children().hide();

			
		$(".lb-prev").hover(function() {
			$(".lb-prev").children().show();
		}, function() {
			
			$(".lb-prev").children().hide();
		})

		$(".lb-next").hover(function() {
			$(".lb-next").children().show();
		}, function() {
			$(".lb-next").children().hide();
		})
		$(".lb_move").on("click",function(){
			event.preventDefault();
			var g_no = $(this).attr("name");
			$.ajax({              
		        url: "detail_album.do",
		        data:{"g_no":g_no},             
		        success: function (data) {        
		        	$("img",this).attr('name',data.g_no);
					$("#img-detail").attr('src', 'resources/upload/album_photo/'+data.imageName);
		        	$("#detail_title").text(data.g_title);
					$("#detail_content").text(data.g_content);
					$.ajax({              
				        url: "getPrevNext.do",
				        data:{"g_no":data.g_no},             
				        success: function (data) {        	  
				       	  	var prev= data.PREV;
				       	  	var next = data.NEXT;
				       	  	if(!prev===false && !next===false){				       	  	
				       	  		$(".lb-prev").show();
			       	  			$(".lb-next").show();
			       	  			$(".lb-prev").attr("name",prev);
		 						$(".lb-next").attr("name",next);
				       	  		
				       	  	} else if(!prev===true){
				       	  		$(".lb-prev").hide();
				       		  	$(".lb-next").show();
				       	  		$(".lb-next").attr("name",next);
				       	  	} else if(!next===true){
				       	  		$(".lb-next").hide();
				       	  		$(".lb-prev").show()
				       	  		$(".lb-prev").attr("name",prev);
				       	  	} else{
				       	  		$(".lb-prev").hide();
			 					$(".lb-next").hide();
				       	  					       	  		
				       	  	}
				 			
				        } 		         
					});
		}
		});
				 			
		
		
	});
	});
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
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							name="${galleryList.g_no}"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>							
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="3"
					end="5">
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							name="${galleryList.g_no}"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="6">
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							name="${galleryList.g_no}"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
		</c:when>
		<c:when test="${galleryList.size() > 3 }">
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="0"
					end="2">
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="3">
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							name="${galleryList.g_no}"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
					</div>
				</c:forEach>
			</div>

		</c:when>
		<c:otherwise>
			<div class="row">
				<c:forEach var="galleryList" items="${galleryList }" begin="0">
					<div class="col-md-4 portfolio-item" id="gallery_${galleryList.g_no}">
						<a href="#" class="photo_a" data-toggle="modal"
							data-target="#myModal"> <img
							class="img-responsive albumlist_img"
							name="${galleryList.g_no}"
							src="resources/upload/album_photo/${galleryList.imageName}"
							alt="">
						</a>
						<h3>
							<a href="#" class="g_title">${galleryList.g_title}</a>
						</h3>
						<p class="g_content">${galleryList.g_content}</p>
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
<div class="modal_outer">
<div class="modal_inner">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-body">
				
				<!-- /.row -->

				<!-- Portfolio Item Row -->
				<div class="row">

					<div class="col-md-8">
						<img id="img-detail" class="img-responsive"
							src="http://placehold.it/750x500" alt="">
					</div>

					<div class="col-md-4">

						<h3 id="detail_title">사진 제목</h3>
						<p id="detail_content">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Nam viverra euismod odio, gravida pellentesque urna varius vitae.
							Sed dui lorem, adipiscing in adipiscing et, interdum nec metus.
							Mauris ultricies, justo eu convallis placerat, felis enim.</p>
						<br><br>
						<footer>
							<small class="text-muted">stive</small> <small class="text-muted">10:33</small>
							<a href="#" class="pull-right"><img
								src="http://api.randomuser.me/portraits/thumb/men/86.jpg"
								class="img-circle"></a>
						</footer>
					</div>

				</div>
				<!-- /.row -->

				<div class="lb-nav" style="display: block;">
					<a class="lb-prev lb_move" href="" style="display: block;"><img
						src="http://lokeshdhakar.com/projects/lightbox2/images/prev.png.pagespeed.ce.hLdt7msnt5.png" /></a><a
						class="lb-next lb_move" href="" style="display: block;"><img
						src="http://lokeshdhakar.com/projects/lightbox2/images/next.png.pagespeed.ce.MfFYdZdaq2.png" /></a>
				</div>
			</div>

		</div>
	</div>
	</div>
	</div>
</div>
<!-- 사진 올리기 Modal -->
<div class="modal fade" id="uploadModal" role="dialog">
<div class="modal_outer">
<div class="modal_inner">
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

						<form id="form1" action="/sroup/m_album.do" method="post"
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
	</div>
	
</div>
