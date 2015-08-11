<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.link-item {
		padding: 0px;
	}
	
	.list-group {
		overflow: hidden;
	
	}

	.list-group-item > a {
		display: block;
		padding: 10px 15px 10px 15px;	
		background-color: white;
		color: #777;
		text-decoration: none;
	}
	.list-group-item > a:hover {
		background-color: #D1E0FF;
		color: #333;
		text-decoration: none;
	}
	
	.current-page > a {
		font-weight: bold;
		color: #333;
	}

</style>

 <!-- Sidebar -->
 <div class="panel panel-default">
     <ul class="list-group">
        <li class="list-group-item link-item">
            <a href="profileupdate.do" id="profileupdate">회원정보 수정 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="pwdupdate.do" id="pwdupdate">비밀번호 변경 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
		<!--         
		<li class="list-group-item link-item">
            <a href="mystudy.do">나의 스터디 </a> 
        </li>
       	-->
        <li class="list-group-item link-item">
            <a href="mystudy.do?cate=create" id="createstudy" class="mystudymenu">내가 개설한 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="mystudy.do?cate=attend" id="attendstudy" class="mystudymenu">내가 참여한 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="calendar.do" id="studycalendar">스터디 캘린더 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="finished-study.do" id="finished-study">종료된 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="messagebox.do" id="messagebox">메시지함 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
     </ul>
 </div>
 <!-- /#sidebar-wrapper -->
 
 
 <script type="text/javascript">
 $(function() {
	
	 
	 
	$("#${current_page }").parent().addClass("current-page");
	
	$(".mystudymenu").on("click", function(event) {
		
		var current_page = $(".current-page a").attr("id");
		var id = $(this).attr("id");
		
		if((current_page == "createstudy" || current_page == "attendstudy") &&
			current_page != id) {
			event.preventDefault();
			
			//console.log($(this).attr("href"));
			var href = $(this).attr("href");
			var target = href.split("=")[1];
			
			$("a[href=#"+target+"]").click();		
		}
		
	})
	 
 })
 </script>
 
 
 
 
 