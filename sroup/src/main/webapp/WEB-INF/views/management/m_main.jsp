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
	pre{
margin: 0px;
border: none;
padding: 0px; 
display: inline-block;
}

.notice{
    border: 1px;
    border-color: silver;
    border-style: solid;
    
    margin-bottom: 10px;
   
}

.notice-header{
padding-bottom: 15px;
    margin: 10px 0 20px;
    border-bottom: 1px solid dimgrey;
}
</style>

<link href="../../resources/jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="../../resources/jquery-ui/external/jquery/jquery.js"></script>
<script src="../../resources/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">

$(function(){
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
	$(".admin_btn").hide();
	if("${admin}"!="${sessionScope.LOGIN_ID}"){
		$(".admin_btn").remove();
	}
		
	$(".notice").hover(function(){
		$(this).find(".admin_btn").show();
	},function(){
		$(this).find(".admin_btn").hide();
	})
	$(".del-btn").click(function del(){	
		var id = $(this).attr("id");
		 $.ajax({              
             url: "notice_del.do",
             data :  {"n_no":this.id},                         
             success: function (data) {
           	  	$("#notice-"+id).hide( "clip", 1800).queue(function() { 
                    $(this).remove();                    
           	 	if($(".notice").length==0){
           	 		var html = "<div align='center'>"
           	 		+"<div style='height: 300px; display: table-cell; vertical-align: middle;'>"
           	 		+"<div style='vertical-align: middle;''>"
           	 		+"			<p style='font-size: 16px;''>첫 번째 공지사항을 작성주세요</p>"
           			+"             <a href='notice_write.do' class='btn btn-success del-btn' onclick=\"notice_first()\">공지사항 쓰러가기</a>"
           			+"           </div>"
           			+"           </div>"
           			+"  </div>"
           	
           			$(".notice_fild").html(html);                               
           	 		}
                });           	
           	 
           		 
           
             }                  
     
   	  });
	});
	
	
	
});

function notice_first(){
	if("${admin}"!="${sessionScope.LOGIN_ID}"){
		event.preventDefault();
		alert("공지사항은 카페관리자만 작성할수 있습니다");
	}
}
</script>

<div class="container">
	<div id="notice_content" class="col-md-12 main"
		style="padding-bottom: 100px;" >

		<h1 class="page-header">공지사항</h1>
		<div class="notice_fild">
		<c:choose>
			<c:when test="${empty noticeList }">
			<div align="center">
				<div style="height: 300px; display: table-cell;vertical-align: middle;">
				<div style="vertical-align: middle;">
							<p style="font-size: 16px;">첫 번째 공지사항을 작성주세요</p>
                             <a href="notice_write.do" class="btn btn-success del-btn" onclick="notice_first()">공지사항 쓰러가기</a>
                          </div>
                          </div>
                </div>
                           </c:when>
			<c:otherwise>
				<c:forEach var="noticeList" items="${noticeList }">
					<div id="notice-${noticeList.n_no}" class="notice" name="${noticeList.n_no}">
						<div style="margin:0px 10px;">
						<h2 class="notice-header">
							<pre><h2><div style="width: 930px; display: inline-block; margin-right: 20px; white-space: nowrap; text-overflow:ellipsis; overflow:hidden;">${noticeList.n_title }</div></h2></pre>
							<div style="display: inline-block; margin-bottom: 8px" class="admin_btn">
							<a href="#del();" id="${noticeList.n_no}"
								class="btn btn-default del-btn"
								style="float: right;"> <span
								class="glyphicon glyphicon-remove"></span></a> <a href="notice_rewrite.do?n_no=${noticeList.n_no}"
								class="btn btn-default" style="float: right; ">
								<span class="glyphicon glyphicon-ok"></span>
							</a> <a href="notice_write.do" class="btn btn-default"
								style="float: right; "> <span
								class="glyphicon glyphicon-pencil"></span></a>
								</div>
						</h2>

						<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
							alt="날짜 : ${noticeList.n_write_day} 작성자:${noticeList.n_writer}" style="float: right;"> <br>
						<Br>
						<p style="clear: right;">${noticeList.n_content }
						</p>
						<footer style="float: right"> </footer>
						<br> <br>
					</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
</div>
	</div>
</div>
<script>
var fnInfiniteScroll = function () {
	var s= $(".notice").length;
	
        $.ajax({
            url:"m_main_muhan.do",
            data:{
                start:s
            },          
            type:'post',
            success:function(result) {
               // $('.notice').fadeOut(300);
                for(var i in result){
                	var html = "<div id=\"notice-"+result[i].n_no+"\" class=\"notice\" name="+result[i].n_no+">"
                		+"<div style=\"margin:0px 10px;\">"
                		+"<h2 class=\"notice-header\">"
                		+"<pre><h2><div style=\"width: 930px; display: inline-block; margin-right: 20px; white-space: nowrap; text-overflow:ellipsis; overflow:hidden;\">"+result[i].n_title+"</div></h2></pre>"
                		+"<div style=\"display: inline-block; margin-bottom: 8px\" class=\"admin_btn\">"
                		+"<a href=\"#del();\" id="+result[i].n_no+" class=\"btn btn-default del-btn\" style=\"float: right;\">"
                		+"<span class=\"glyphicon glyphicon-remove\"></span></a> <a href=\"notice_rewrite.do?n_no="+result[i].n_no+"\" class=\"btn btn-default\" style=\"float: right; \">"
                		+"	<span class=\"glyphicon glyphicon-ok\"></span>"
                		+"</a> <a href=\"notice_write.do\" class=\"btn btn-default\" style=\"float: right; \">"
                		+"<span class=\"glyphicon glyphicon-pencil\"></span></a>"
                		+"	</div>"
                		+"</h2>"
                		+"<img data-src=\"holder.js/200x200/auto/sky\" class=\"img-responsive\" alt=\"날짜 : "+result[i].n_write_day+" 작성자:"+result[i].n_writer+"\" style=\"float: right;\"> <br>"
                		+"<Br>"
                		+"<p style=\"clear: right;\">"+result[i].n_content+"</p>"
                		+"<footer style=\"float: right\"> </footer>"
                		+"<br> <br>"
                		+"</div>"
                		+"</div>"
                	$('.notice_fild').append(html);
                }
                 
               // clearTimeout(fnInfiniteScroll);
            }, error:function() {
               
            }
        });
    };
 
$(window).scroll(function() {   
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                // ajax로 다음 페이지 불러오기 appendTo...
                $('.notice').fadeIn(500);
                 
                setTimeout(function() { fnInfiniteScroll(); }, 800);
            }
 
    });
</script>