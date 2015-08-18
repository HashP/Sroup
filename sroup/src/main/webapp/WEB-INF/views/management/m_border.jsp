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
				<td><a class="b_title" href="board_read.do?b_no=${boardList.b_no }"><pre>${boardList.b_title }</pre></a></td>
				<td>${boardList.b_writer }</td>
				<td>${boardList.b_write_day }</td>
				<td>${boardList.b_hit }</td>
			</tr>
		</c:forEach>			
		</tbody>
	</table>
	<div>
	<a href="/sroup/m_study/board_write.do"><button type="button" class="btn btn-default" style="float: right;">글쓰기</button></a></div>
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
			<tags:paginate total="${b_tot }" page="${cPage }" max="20" cssClass="pagination"/>
		</div>
	</div>
	
	<div class="row" >
	<div class="col-lg-6 col-md-offset-3" >
		<div class="input-group">
			<div class="input-group-btn">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					제목 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">제목</a></li>
					<li><a href="#">내용</a></li>
					<li><a href="#">작성자</a></li>					
				</ul>
			</div>
			<!-- /btn-group -->
			<input type="text" class="form-control" placeholder="Search for...">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" style="padding-bottom: 9px; padding-top: 9px;"><i class="glyphicon glyphicon-search" style="height: 100%"></i></button>				
			</span>
		</div>
		<!-- /input-group -->
	</div>
	<!-- /.col-lg-6 -->
	</div>
	</div>
	</div>
