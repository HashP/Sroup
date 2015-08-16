<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sroup</title>
<script type="text/javascript">
$(function() {
	
	$(".sortbar li a").click(function() {
		var attr = $(this).attr("href").substring(1);
		$(".comSearch a").removeClass();
		if(attr === "popularity") {
			$(".popularity").addClass("select");
			$(".latest").removeClass("select");
			$(".soon").removeClass("select");
			$.ajax({
				url: "list3.do",
				data : {attr : attr},
				dataType : "json",
				success : function(data) {
					var studies = data.lists;
					var content = "";
					
					for(var i=0; i<studies.length; i++) {
						content += "<ul class=\"todayEvent\" >" +
											"<li class=\"eventThumbnail\"><a href=\"detail.do?no="+studies[i].study_no+"\"> " +
											"<img src=\"/sroup/upload/2015/08/"+studies[i].s_image+"\" width=\"220\" height=\"220\" class=\"thumb\" /></a></li> " +
											"<li class=\"eventTitle\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventLink\" "+
											">"+studies[i].study_name+"</a></li><li class=\"eventBottomArea\"><ul><li class=\"eventPin\"><a href=\"#pin\"><span class=\"heart\">"+
											"찜</span></a><li class=\"eventPersonnel\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventButton\"><span><strong>"+studies[i].available+"</strong>명 " +
											"참여가능</span><span class=\"entered\">참여하기</span></a></li></ul></li></ul>";
						
					}
					
							
					
					$(".contentBox").html(content)
				}
			})
			
		} else if(attr === "latest") {
			$(".popularity").removeClass("select");
			$(".latest").addClass("select");
			$(".soon").removeClass("select");
			$.ajax({
				url: "list3.do",
				data : {attr : attr},
				dataType : "json",
				success : function(data) {
					var studies = data.lists;
					var content = "";
					
					for(var i=0; i<studies.length; i++) {
						content += "<ul class=\"todayEvent\" >" +
											"<li class=\"eventThumbnail\"><a href=\"detail.do?no="+studies[i].study_no+"\"> " +
											"<img src=\"/sroup/upload/2015/08/"+studies[i].s_image+"\" width=\"220\" height=\"220\" class=\"thumb\" /></a></li> " +
											"<li class=\"eventTitle\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventLink\" "+
											">"+studies[i].study_name+"</a></li><li class=\"eventBottomArea\"><ul><li class=\"eventPin\"><a href=\"#pin\"><span class=\"heart\">"+
											"찜</span></a><li class=\"eventPersonnel\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventButton\"><span><strong>"+studies[i].available+"</strong>명 " +
											"참여가능</span><span class=\"entered\">참여하기</span></a></li></ul></li></ul>";
						
					}
					
							
					
					$(".contentBox").html(content)
				}
			})
		} else if(attr === "soon") {
			$(".popularity").removeClass("select");
			$(".latest").removeClass("select");
			$(".soon").addClass("select");
			$.ajax({	
				url: "list3.do",
				data : {attr : attr},
				dataType : "json",
				success : function(data) {
					var studies = data.lists;
					var content = "";
					
					for(var i=0; i<studies.length; i++) {
						content += "<ul class=\"todayEvent\" >" +
											"<li class=\"eventThumbnail\"><a href=\"detail.do?no="+studies[i].study_no+"\"> " +
											"<img src=\"/sroup/upload/2015/08/"+studies[i].s_image+"\" width=\"220\" height=\"220\" class=\"thumb\" /></a></li> " +
											"<li class=\"eventTitle\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventLink\" "+
											">"+studies[i].study_name+"</a></li><li class=\"eventBottomArea\"><ul><li class=\"eventPin\"><a href=\"#pin\"><span class=\"heart\">"+
											"찜</span></a><li class=\"eventPersonnel\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventButton\"><span><strong>"+studies[i].available+"</strong>명 " +
											"참여가능</span><span class=\"entered\">참여하기</span></a></li></ul></li></ul>";
					}
					$(".contentBox").html(content);
				}
			})
		}
	})
	
	$(".comSearch dd a").click(function () {
		var attr = $(".sortbar a.select").attr("href").substring(1);
		var select = $(this).attr("class");
		console.log(select);
		if(select === undefined || select === "") {
			$(this).addClass("select");
		} else {
			$(this).removeClass();
		}
		
		var length = $(".comSearch dd a.select input").length;
		var selectCat = [];
		var selectReg = [];
		var content = "";
		if(length >= 0) {
			for(var i=0; i<length; i++) {
				if($(".comSearch dd a.select input")[i].name === "category") {
					selectCat[i] = $(".comSearch dd a.select input")[i].value;
				} else if($(".comSearch dd a.select input")[i].name === "region") {
					selectReg[i] = $(".comSearch dd a.select input")[i].value;
				}
			}
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({	
				url: "list3.do",
				data : {selectCat : selectCat, attr : attr, selectReg : selectReg},
				dataType : "json",
				success : function(data) {
					var studies = data.lists;
					var content = "";
					
					for(var i=0; i<studies.length; i++) {
						content += "<ul class=\"todayEvent\" >" +
											"<li class=\"eventThumbnail\"><a href=\"detail.do?no="+studies[i].study_no+"\"> " +
											"<img src=\"/sroup/upload/2015/08/"+studies[i].s_image+"\" width=\"220\" height=\"220\" class=\"thumb\" /></a></li> " +
											"<li class=\"eventTitle\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventLink\" "+
											">"+studies[i].study_name+"</a></li><li class=\"eventBottomArea\"><ul><li class=\"eventPin\"><a href=\"#pin\"><span class=\"heart\">"+
											"찜</span></a><li class=\"eventPersonnel\"><a href=\"detail.do?no="+studies[i].study_no+"\" class=\"eventButton\"><span><strong>"+studies[i].available+"</strong>명 " +
											"참여가능</span><span class=\"entered\">참여하기</span></a></li></ul></li></ul>";
					}
					$(".contentBox").html(content);
				}
			})
		} else {
			
		}
	})
})
</script>
</head>
<body class="sroup">
	<div class="content">
		<div class="eventMain">
			<div class="sideLeft">
				<div class="titArea">
					<h2 class="graphicFont">모임</h2>
					<ul class="sortbar">
						<li><a class="popularity select" href="#popularity">인기모임순</a></li>
						<li><a class="latest" href="#latest">최근등록순</a></li>
						<li class="last"><a class="soon" href="#soon">마감임박순</a></li>
					</ul>
				</div>
				<div class="contentBox todayEventArea">
					<c:forEach var="l" items="${lists }">
						<ul class="todayEvent  ">
							<li class="eventThumbnail"><a
								href="detail.do?no=${l.study_no }" target="_blank"><img
									src="/sroup/upload/2015/08/${l.s_image }"
									alt="${l.study_name }" width="220" height="220"
									class="thumb" /></a></li>
							<li class="eventTitle"><a
								href="detail.do?no=${l.study_no }" class="eventLink"
								title="${l.study_name }" target="_blank">${l.study_name }</a></li>
							<li class="eventBottomArea">
								<ul>
									<li class="eventPin"><a href="#pin"><span
											class="heart">찜</span></a>
									<li class="eventPersonnel"><a href="detail.do?no=${l.study_no }"
										class="eventButton" target="_blank"> <span><strong>${l.available }</strong>명
												참여가능</span> <span class="entered">참여하기</span>
									</a></li>
								</ul>
							</li>
						</ul>
					</c:forEach>
				</div>

			</div>
			<div class="sideRight">
				<div class="eventSearch">
					<form name="searchBoxEventForm" action="/event" action="GET">
						<fieldset>
							<dl style="margin-bottom: 7px;">
								<dt>
									<span>모임개설</span> 
								</dt>
							</dl>
							<a class="createStudy" href="add.do">모임 개설하기</a>
							<dl class="comSearch category">
								<dt>카테고리</dt>
								<c:forEach var="c" items="${categories }">
									<dd>
										<a href="#" title="${c.subject }" value="${c.subject }"> <input type="checkbox"
											name="category" value="${c.subject }" /> ${c.subject }
										</a>
									</dd>
								</c:forEach>
									<dd>
										<a href="#" title="" > <input type="checkbox"
											name="category" value="" />
										</a>
									</dd>
							</dl>
							<dl class="comSearch category location">
								<dt>지역</dt>
								<c:forEach var="a" items="${area }">
									<dd>
										<a href="#" title="${a.area }"> <input type="checkbox"
											name="region" value="${a.area}" /> ${a.area }
										</a>
									</dd>
								</c:forEach>
							</dl>
							<dl class="comSearch price">
								<dt>참여비용</dt>
								<dd data-range="0">
									<a href="">무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</a>
								</dd>
								<dd data-range="1">
									<a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
										10,000원</a>
								</dd>
								<dd data-range="2">
									<a href="">10,000원 ~ 25,000원</a>
								</dd>
								<dd data-range="3">
									<a href="">25,000원 ~ 40,000원</a>
								</dd>
								<dd data-range="4">
									<a href="">40,000원 ~ 99,000원</a>
								</dd>
								<dd data-range="5">
									<a href="">99,000원
										~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
								</dd>
							</dl>
						</fieldset>
					</form>
					<!-- name=searchBoxForm -->
				</div>
			</div>

		</div>
	</div>
</body>
</html>