<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	textarea{
		resize: none
	}
</style>
<link href="resources/jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery-ui/external/jquery/jquery.js"></script>
<script src="resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">
	function commentCheck(){		
		if($("textarea[name='content']").val().trim() == ""){
			event.preventDefault();
		}
	}
	
	$(function() {		
		$(".glyphicon").hide();
		
		$(".comment_content").hover(function(){
			$(this).find(".glyphicon").show();
		},function(){
			$(".glyphicon").hide();
		})
		
		$(".c_remove").on("click",function(){
			var id = $(this).attr("id");
			 $.ajax({              
	             url: "comment_del.do",
	             data :  {"c_no":id},                         
	             success: function (data) {	            	 
	           	  	$("#comment_content_"+id).hide("blind","slow");
	           	 	$("#comment_content_"+id).remove();
	             }                  
	     
	   	  });
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		})
		$(".c_rewrite").on("click",function(){
			
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		})
		
	})
	
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
		<div class="comment_content" id="comment_content_${comment.c_no}" style="margin-left: -40px;">
		<div style="width: 4%; display: inline-block;">
		<button href="#" class="btn btn-default glyphicon c_remove"  id="${comment.c_no}" style="padding-left: 8px; padding-right: 8px; color: gray"><span class="glyphicon glyphicon-remove"></span></button><br>
		<a href="#" class="btn btn-default glyphicon c_rewrite" id="${comment.c_no}" style="padding-left: 8px; padding-right: 8px; color: gray"><span class="glyphicon glyphicon-pencil"></span></a>
		</div>
			<div style="width: 82%; display: inline-block; vertical-align: top;"  >
				
				<h4>${comment.c_content} </h4>
				
			</div>
			<div style="width: 13%; display: inline-block; vertical-align: top;">
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
