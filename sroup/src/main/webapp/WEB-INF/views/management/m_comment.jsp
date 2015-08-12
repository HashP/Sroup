<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	textarea{
		resize: none
	}
	.c_hiddenBtn{
		width: 4%; display: inline-block;
	}		
	.c_content{
		width: 82%; display: inline-block; vertical-align: top;
	}
	.c_profile{
		width: 13%; display: inline-block; vertical-align: top;
	}
	.recomment{
	width: 100%; display: inline-block; vertical-align: top;
	padding: 0px 19px;
	}
	.recomment_text{
		padding: 14px 14px 0px 14px;
	}
	.re_btn:active,.re_btn:hover {color:lime;  text-decoration:none}
	.re_btn{
		
		color: white;
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
			$(".comment_content").children().show();
			$(".recomment").remove();
			var id = $(this).attr("id");
			$("#comment_content_"+id).children().hide()
			$("#comment_content_"+id).css({"margin-left": "0"})
			var html = ""			
			+"	<div class=\"recomment\">"	
			+""
			+"<form class=\"form-horizontal\" role=\"form\" action=\"\">"
			+"<div class=\"form-group\" style=\"padding: 14px 14px 0px 14px;\">"
			+"<textarea class=\"form-control rewrite_content\" name=\"content\""
			+"		style=\"height: 60px;\"></textarea>"
			+"</div>"
			+"<div>"				
			+"	<button class=\"btn btn-success pull-right\" type=\"submit\" onclick=\"\"><span class=\"re_btn c_rewrite_ok\" onclick=\"rewirte_ok("+id+");\">수정</span> | <span class=\"re_btn c_rewrite_cencle\" onclick=\"rewirte_cencle("+id+");\") >취소</span></button>"
			+"</div>"
			+"<br>"
		+"</form>"					
			+"	</div>"			
			+"<HR>"
			$("#comment_content_"+id).append(html);
			
			
			//location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		});		
	
		
		
	})
	function rewirte_ok(id){		
		var c_content = $(".rewrite_content").val();
		 $.ajax({              
             url: "comment_rewrite.do",
             data :  {"c_no":id,"c_content":c_content},                         
             success: function (data) {	            	 
            	 $("#comment_content_"+id).css({"margin-left": "-40px"})
         		 $(".recomment").remove();
            	 
            	 $("#comment_content_"+id).children().show();
           	  	
             }     
	})
	}
	function rewirte_cencle(id){	
		$("#comment_content_"+id).css({"margin-left": "-40px"})
		$(".recomment").remove();
		$("#comment_content_"+id).find(".c_content_p").val(data.c_content);
		$("#comment_content_"+id).find(".c_write_day").val(data.c_write_day);
		$("#comment_content_"+id).find(".c_writer").val(data.c_writer);
		$("#comment_content_"+id).children().show();
	}
	
</script>
<!-- content 부분 -->
	<div class="container" style="padding-left:50px;">
		<h1 id="bordname">회원 한마디</h1>
		<div class="well" style="height: 200px; width:1105px">
			<form class="form-horizontal" role="form" action="/sroup/comment_add.do">
				<h4>What's your think</h4>
				<div class="form-group" style="padding: 14px 14px 0px 14px;" >
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
		<div class="speak_contents" style="padding-top: 20px; width:1105px">
		<c:forEach var="comment" items="${commentList}">
		<div class="comment_content" id="comment_content_${comment.c_no}" style="margin-left: -40px;">
		<div class="c_hiddenBtn">
		<button href="#" class="btn btn-default glyphicon c_remove"  id="${comment.c_no}" style="padding-left: 8px; padding-right: 8px; color: gray"><span class="glyphicon glyphicon-remove"></span></button><br>
		<a href="#" class="btn btn-default glyphicon c_rewrite" id="${comment.c_no}" style="padding-left: 8px; padding-right: 8px; color: gray"><span class="glyphicon glyphicon-pencil"></span></a>
		</div>
			<div class="c_content" id="c_content_${comment.c_no}">				
				<p class="c_content_p">${comment.c_content} </p>				
			</div>
			<div class="c_profile" id="c_profile_${comment.c_no}">
			<small class="text-muted c_writer">${comment.c_writer}</small>
					<small class="text-muted c_write_day">${comment.c_write_day}</small>
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
