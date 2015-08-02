<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function readURL(input) {	
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function resetURL(input){
	
	$('#blah').attr('src','http://placehold.it/750x500');
}

function imageClick(){
	alert($("img",this));
	$('#img-detail').attr('src',$(this).find("img").attr('src'));
}
$(document).ready(function(){ 
	
// 사진 상세 보기시 현제 저장된 이미지 보여주는 기능
$(".photo_a").click(function() {
	  var a = $( "img",this ).attr('src');
	  $("#img-detail").attr('src',a);
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
					data-target="#uploadModal" onclick="resetURL();"><span
					class="glyphicon glyphicon-camera"></span><span>사진올리기</span></a>
			</h1>
		</div>
	</div>
	<!-- /.row -->

	<!-- Projects Row -->
	<div class="row">
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
	</div>
	<!-- /.row -->

	<!-- Projects Row -->
	<div class="row">
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
	</div>

	<!-- Projects Row -->
	<div class="row">
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="resources/images/woo.jpg"  alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
		<div class="col-md-4 portfolio-item">
			<a href="#" class="photo_a" data-toggle="modal" data-target="#myModal" > <img
				class="img-responsive" src="http://placehold.it/700x400" alt="">
			</a>
			<h3>
				<a href="#">사진 제목</a>
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
				viverra euismod odio, gravida pellentesque urna varius vitae.</p>
		</div>
	</div>
	<!-- /.row -->

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
						<img id="img-detail" class="img-responsive" src="http://placehold.it/750x500"
							alt="">
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
                <h1 class="page-header">사진 업로드
                    <small>스터디 멤버들과의 추억을 공유하세요</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row" style="margin-bottom: 10px;">

            <div class="col-md-8" align="center" >

        <img id="blah" src="http://placehold.it/750x500" alt=""  class="img-responsive" style="max-height: 400px;"/>
            </div>

            <div class="col-md-4" >
           					
				<form id="form1" runat="server" method="post" enctype="multipart/form-data" >
				
        <input type='file' onclick="readURL(this)" onchange="readURL(this);" />
        <div class="form-group">
    
    <div class="col-sm-12" style="padding: 0px;">
      <input type="text" class="form-control" placeholder="제목">
    </div>
  </div>
        
        <textarea rows="15" class="form-control" placeholder="내용"></textarea>
        <button style="float: right;" >올리기</button>
    </form>
              
            </div>

        </div></div>
</div>
</div>
</div>
