<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.link-item {
		padding: 0px;
	}

	.list-group-item > a {
		display: block;
		padding: 10px 15px 10px 15px;	
		background-color: white;
		color: black;
		text-decoration: none;
	}
	.list-group-item > a:hover {
		background-color: #D1E0FF;
		color: black;
		text-decoration: none;
	}
	

</style>

 <!-- Sidebar -->
 <div class="panel panel-default">
     <ul class="list-group">
        <li class="list-group-item link-item">
            <a href="profileupdate.do">회원정보 수정 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="pwdupdate.do">비밀번호 변경 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="#">나의 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="#">내가 참여한 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="#">내가 개설한 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="#">스터디 캘린더 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
        <li class="list-group-item link-item">
            <a href="#">종료된 스터디 <span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a>
        </li>
     </ul>
 </div>
 <!-- /#sidebar-wrapper -->