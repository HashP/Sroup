<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/sroup/resources/bootstrap/style.css">
<link rel="stylesheet" href="/sroup/resources/bootstrap/style-theme.css">
<link rel="stylesheet" href="/sroup/resources/bootstrap/boot.css">
<!-- <link rel="stylesheet" href="../resources/bootstrap/bootstrap.css">
<link rel="stylesheet" href="../resources/bootstrap/bootstrap-theme.css"> -->
<style type="text/css">
.area1 {
	height: 30px;
}

.area2>a {
	color: #666;
}

.area2>span {
	color: #666;
}

.area2 {
	margin-top: 5px;
}
.headerBannerImg, .headerBannerImg > p {
	width: 210px;
	height: 76px;
	float: right;
}

@media (max-width: 980px) {
	.header {
		width: 980px;
		padding-left: 15px;
		padding-right: 15px;
	}
	.logoSearchArea {
		width: 100%;
	}

}
</style>
<div class="header">
	<div class="logoSearchArea">
		<h1>
			<a href="list.do"> <img src="/sroup/resources/images/sroup2.jpg">
			</a>
		</h1>
		<div class="fieldset">
			<div class="searchArea">
				<div class="area1">
					<input id="searchInput" type="text" placeholder="키워드를 입력해 주세요"> <input type="submit"
						class="searchBtn" value="검색">
				</div>
				<div class="area2">
					<span class="glyphicon glyphicon-search"></span> <a href="#;"
						target="_blank">[패스트캠퍼스] 재태크 CAMP</a>
				</div>
			</div>
		</div>
		<div class="headerBannerImg">
			<p>
				<a href="#;" target="_blank"><img
					src="http://cfile1.onoffmix.com/attach/PJWKcbgBCD2y6U2NFzHWIsj6Mwqj14YK"/></a>
			</p>
		</div>
	</div>
</div>
