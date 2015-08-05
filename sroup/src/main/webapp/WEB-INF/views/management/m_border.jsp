<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<!-- ì°¨í h2 ìì´ë ê°(bordname)ì¼ë¡ ê²ìí ì´ë¦ì ë³ê²½íë¤. -->
	<h1 id="bordname">게시판</h1>
	<br>
	<table class="table table-hover">
		<thead>
			<tr class="active">
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody>
		<c:forEach var="boardList" items="${boardList }">			
			<tr>
				<td>${boardList.b_no }</td>
				<td>${boardList.b_title }</td>
				<td>${boardList.b_writer }</td>
				<td>${boardList.b_write_day }</td>
				<td>${boardList.b_hit }</td>
			</tr>
		</c:forEach>			
		</tbody>
	</table>
	<a href="/sroup/board_write.do"><button type="button" class="btn btn-default" style="float: right;">글쓰기</button></a>
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
