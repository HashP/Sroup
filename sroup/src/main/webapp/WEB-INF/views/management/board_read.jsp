<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.i1 {
	width: 95%;
}

.i2 {
	width: 5%;
	padding-left: 5px;
}

textarea {
	resize: none
}
glyphicon:active,.glyphicon:hover {color:black;  text-decoration:none}
.glyphicon{
	float : right;
	padding-right: 8px; 
	color: gray;
}
.my_btn{
	display: inline;
    float: left;
    height: 23px;
    margin-left: 5px;
    overflow: hidden;
    cursor: pointer;
    list-style: none;
    margin: 0;
    padding: 0;
    font-size: 12px;
}
.re_content{
margin-left: 70px;
}
pre{
margin: 0px;
border: none;
padding: 0px; 
}
</style>

<div class="col-md-8 col-md-offset-1">

	<div class="col-md-12">
		<div class="row">
		
			<table border="0" cellspacing="0" width="100%"
				style="table-layout: fixed; border-bottom: 1px solid #e1e1e1;">
				<tr>
					<td nowrap="nowrap" width=120 height=140 align=center><a
						href="" target=_blank><img
							src=http://api.randomuser.me/portraits/thumb/men/86.jpg
							width=100px></a></td>

					<td valign=top align=left width=100%
						style="vertical-align: middle;">

						<table border=0>
							<tr>
								<td align=left>

									<table border=0 cellspacing="0">
										<tr>
											<td class=font12 style='padding-top: 2px'><b><span><c:out
															value="${b_detail.b_writer }" /></span></span></b></span></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align=left></td>
							</tr>
							<tr>
								<td align=left>조회 <b><c:out value="${b_detail.b_hit }" /></b>

									<font color="#c0c0c0"> | </font>작성일 <c:out
										value="${b_detail.b_write_day }" /></td>
							</tr>
							<tr>
								<td align="left" style="padding: 10px 0px 0px 0px"><pre><strong
									style="font-size: 17px;"><c:out
											value="${b_detail.b_title }" /></strong></pre></td>
							</tr>
						</table>

					</td>
					<td width=205 align="right" style="padding-right: 10px; vertical-align: bottom;"
						class="number">
																	
						</td>
				</tr>
			</table>
		</div>
		<div class="row">
			<div width="100%"
				style="table-layout: fixed; min-height: 350px; padding: 10px 0px; border-bottom: 1px solid #e1e1e1;">
				<pre>${b_detail.b_content }</pre></div>
		</div>
		
		<div class="row">
		
		<c:forEach var="b_reply" items="${b_reply }">
			<div class="reply_content" style="padding-top: 10px;">
				<div style="width: 70px; display: inline-block; float: left"
					align="center">
					<img src=http://api.randomuser.me/portraits/thumb/men/86.jpg
						width=50px height="50px">
				</div>
				<div>
					<p style="display: inline-block;"><b>${b_reply.re_writer}</b></p>
					<p style="display: inline-block; padding-left: 5px;"><small style="color: gray;">${b_reply.re_writer_day }</small></p>			
					<a class="glyphicon glyphicon-remove" id="${b_reply.re_no }" ></a>
					<div class="re_content"><pre>${b_reply.re_content }</pre></div>
				</div>
			</div>					
		</c:forEach>
			<div style="padding: 20px 5px; width: 100%">
				<table style="width: 100%">
					<td class="i1"><textarea wrap="hard" id="b_reply" style="overflow: hidden; line-height: 14px; height: 61px; width: 100%;"></textarea></td>
					<td class="i2"><input type="image" name="" src="resources/images/ok_btn.gif" alt="확인"></td>
				</table>
			</div>			
			<div>		
					
						<button class="btn btn-default btn-sm b_rewrite" style="float: right; margin-top: 10px" ><span>수정</span></button>			
						<button class="btn btn-default btn-sm b_remove" style="float: right; margin-top: 10px" ><spna>삭제</sapn></button>						
			</div>		
		</div>
		
	</div>
</div>
<script>
	$(function() {
		
		
		$("input[type='image']").on("click", function() {
			var b_no = ${b_detail.b_no };
			var content = $("#b_reply").val().replace(/&/g, '&amp;').replace(/\</g,"&lt;").replace(/>/g,"&gt");
			if(getByteLength(content)>2000){
				alert("덧글은 한글기준 최대 1000자 영어기준 2000자 까지 입력가능합니다");
			}else{
			var form = document.createElement('form');
			var objs;
			objs = document.createElement('input');
			objs.setAttribute('type', 'hidden');
			objs.setAttribute('name', 'b_no');
			objs.setAttribute('value', b_no);
			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
			objs2.setAttribute('name', 'content');
			objs2.setAttribute('value', content);
			form.appendChild(objs);
			form.appendChild(objs2);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "boardreply_add.do");
			document.body.appendChild(form);
			form.submit();
			}	
		});
		$(".glyphicon").hide();
		
		$(".reply_content").hover(function(){
			$(this).find(".glyphicon").show();
		},function(){
			$(".glyphicon").hide();
		})
		
		$(".glyphicon-remove").on("click",function(){
			var re_no=$(this).attr("id");
			var b_no = ${b_detail.b_no };
			location.replace('boardreply_del.do?re_no='+re_no+'&b_no='+b_no);	
		})		
		
		$(".b_rewrite").on("click",function(){			
			var b_no = ${b_detail.b_no };
			location.replace('board_rewrite.do?b_no='+b_no);	
		})		
		
		$(".b_remove").on("click",function(){			
			var b_no = ${b_detail.b_no };
			location.replace('board_del.do?b_no='+b_no);	
		})	
				
	})
	
	function getByteLength(input) {
	var byteLength = 0;
	if (input == null)
		return 0;
	for (var inx = 0; inx < input.length; inx++) {
		var oneChar = escape(input.charAt(inx));
		if (oneChar.length == 1) {
			byteLength++;
		} else if (oneChar.indexOf("%u") != -1) {
			byteLength += 2;
		} else if (oneChar.indexOf("%") != -1) {
			byteLength += oneChar.length / 3;
		}
	} // enf of for loop
	return byteLength;
}


</script>