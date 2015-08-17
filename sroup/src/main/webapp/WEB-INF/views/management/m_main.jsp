<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
.container-fluid {
	height: 100%;
}

.row {
	height: 100%;
}
</style>

<link href="resources/jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery-ui/external/jquery/jquery.js"></script>
<script src="resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">

$(function(){
	
	$(".del-btn").click(function del(){	
		var id = $(this).attr("id");
		 $.ajax({              
             url: "notice_del.do",
             data :  {"n_no":this.id},                         
             success: function (data) {
           	  	$("#notice-"+id).hide( "clip", "slow" );
           	 	$("#notice-"+$(this).attr("id")).remove();
             }                  
     
   	  });
	});
	
	
});

</script>

<div class="container">
	<div id="notice_content" class="col-md-12 main"
		style="padding-bottom: 100px;" >

		<h1 class="page-header">공지사항</h1>
		<div>
		<c:choose>
			<c:when test="${empty noticeList }">
				<div style="height: 300px; display: table-cell;vertical-align: middle;">
				<div style="vertical-align: middle;">
							<p style="font-size: 16px;">첫 번째 공지사항을 작성주세요</p>
                             <a href="notice_write.do" class="btn btn-success del-btn">공지사항 쓰러가기</a>
                          </div>
                          </div>
                
                           </c:when>
			<c:otherwise>
				<c:forEach var="noticeList" items="${noticeList }">
					<div id="notice-${noticeList.n_no}" class="notice">

						<h2 class="page-header">
							<p style="display: inline-block;">${noticeList.n_title }</p>

							<a href="#del();" id="${noticeList.n_no}"
								class="btn btn-default del-btn"
								style="float: right; margin-top: 10px"> <span
								class="glyphicon glyphicon-remove"></span></a> <a href="#"
								class="btn btn-default" style="float: right; margin-top: 10px">
								<span class="glyphicon glyphicon-ok"></span>
							</a> <a href="notice_write.do" class="btn btn-default"
								style="float: right; margin-top: 10px"> <span
								class="glyphicon glyphicon-pencil"></span></a>
						</h2>

						<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
							alt="날짜 : 2015-07-27 작성자:cj" style="float: right;"> <br>
						<Br>
						<p style="clear: right;" class="notice">${noticeList.n_content }
						</p>
						<footer style="float: right"> </footer>
						<br> <br>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
</div>
	</div>
</div>
