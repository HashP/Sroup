<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/sroup/resources/bootstrap/style.css">
<link rel="stylesheet" href="/sroup/resources/bootstrap/style-theme.css">
<!-- <link rel="stylesheet" href="/sroup/resources/bootstrap/boot.css"> -->
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
<script type="text/javascript">
$(function() {
	var ab = location.pathname;
	ab = ab.substring(7,9);
	$(".searchBtn").click(function() {
		if(ab != "li") {
			alert("검색은 모임페이지에서만 가능합니다.");
			return;
		}
	})
var i = 0;
var j = 1;

	$(".searchArea .area2 a").hide();
	$(".searchArea .area2 a:eq(0)").show();

	setInterval(function(){ 
		
		$(".searchArea .area2 a:eq("+i+")").hide("slow");
		$(".searchArea .area2 a:eq("+j+")").show("slow");
		i++;
		j++;
		if(i == 5) {
			i=0;
		}
		if(j == 5) {
			j=0;
		}
	}, 5000);
	
	
	})
</script>
<div class="header">
	<div class="logoSearchArea">
		<h1>
			<a href="/sroup/"> <img src="/sroup/resources/images/sroup2.jpg">
			</a>
		</h1>
		<div class="fieldset">
			<div class="searchArea">
				<div class="area1">
					<input id="searchInput" type="text" placeholder="키워드를 입력해 주세요"> <input type="submit"
						class="searchBtn" value="검색">
				</div>
				<div class="area2">
					<span class="glyphicon glyphicon-search"></span> 
					<c:forEach var="l" items="${lists }" begin="10" end="14">
						<a href="/sroup/detail.do?no=${l.study_no }" target="_blank">${l.study_name }</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="headerBannerImg">
			<p>
				<a href="detail.do?no=79" target="_blank"><img
					src="/sroup/resources/images/캘리.jpg"/></a>
			</p>
		</div>
	</div>
</div>
