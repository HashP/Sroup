<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<style>
	.b_title:link,.b_title:visited,.b_title:active,.b_title:hover {color:black;}	
	pre{
margin: 0px;
border: none;
padding: 0px; 
}
</style>
<div class="container" style="width: 1130px;">
	<!-- ì°¨í h2 ìì´ë ê°(bordname)ì¼ë¡ ê²ìí ì´ë¦ì ë³ê²½íë¤. -->
	<h1 id="bordname">게시판</h1><hr>
	
	<div>
	<table class="table table-hover" style="width: 1100px">
		<thead>
			<tr style="background-color: #E5E5E5">
				<th style="width: 90px">번호</th>
				<th style="width: 670px">제목</th>
				<th style="width: 130px">글쓴이</th>
				<th style="width: 130px">날짜</th>
				<th style="width: 80px">조회</th>
			</tr>
		</thead>		
		<tbody>
		<c:forEach var="boardList" items="${boardList }">			
			<tr>
				<td>${boardList.b_no }</td>
				<td><a class="b_title" href="board_read.do?b_no=${boardList.b_no }&cPage=${param.cPage}"><pre>${boardList.b_title }</pre></a></td>
				<td>${boardList.b_writer }</td>
				<td>${boardList.b_write_day }</td>
				<td>${boardList.b_hit }</td>
			</tr>
		</c:forEach>			
		</tbody>
	</table>
	<div>
	<c:if test="${not empty search}">
			<a href="m_border.do"><button type="button" class="btn btn-default" style="float: left;">돌아가기</button></a></div>
	</c:if>
	<a href="board_write.do?check=${param.cPage}"><button type="button" class="btn btn-default" style="float: right;">글쓰기</button></a></div>
	<div class="row text-center">
		<!-- <div class="col-lg-12">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul> -->
			<c:choose>
				<c:when test="${not empty search}">
					<tags:paginate total="${b_tot }" page="${cPage }" max="20" queryString="searchoption=${param.searchoption }&searchkeyword=${param.searchkeyword }" cssClass="pagination"/>
				</c:when>
				<c:otherwise>
					<tags:paginate total="${b_tot }" page="${cPage }" max="20" cssClass="pagination"/>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="row" >
	<div class="col-lg-6 col-md-offset-3" >
		<form action="m_searchborder.do" method="get">
			<div class="input-group">
				<div class="input-group-btn">
					<a id="searchoptionmenu"  class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						제목 <span class="caret"></span>
					</a>
					<input type="hidden" value="title" name="searchoption">
					<ul class="dropdown-menu" id="searchoption" role="menu">
						<li><a href="title">제목</a></li>
						<li><a href="content">내용</a></li>
						<li><a href="writer">작성자</a></li>					
					</ul>
				</div>
				<!-- /btn-group -->
				<input type="text" class="form-control" name="searchkeyword" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="submit" style="padding-bottom: 9px; padding-top: 9px;"><i class="glyphicon glyphicon-search" style="height: 100%"></i></button>				
				</span>
			</div>
		</form>	
		<!-- /input-group -->
	</div>
	<!-- /.col-lg-6 -->
	</div>
</div>
<script>
	 $.ajax({              
         url: "checkuser.do",  
         data:{}, 
         success: function (data) {            	 
        	if(data == "false"){
        	 alert("가입한 스터디가 아닙니다.");
    	  	 location.replace('../../main.do');
        	}else {
        	}
         }                  	     
	 	 });

$(function() {
	
	$("#searchoption li a").click(function(event) {
		event.preventDefault();
		var text = $(this).text();
		var value = $(this).attr("href");
		
		$("#searchoptionmenu").html(text + ' <span class="caret"></span>');
		$("input[name='searchoption']").val(value);
	
	});
	
})	 
</script>
