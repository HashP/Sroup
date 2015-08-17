<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String enter = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sroup</title>
<script type="text/javascript">
function getOrderBy() {
	var orderby = $(".sortbar li a.select").attr("href").substring(1);
	return orderby;
}
function getCategory() {
	var category = [];
	var length = $(".comSearch dd a.select input").length;
	for(var i=0; i<length; i++) {
		if($(".comSearch dd a.select input")[i].name === "category") {
			category[i] = $(".comSearch dd a.select input")[i].value;
		}
	}
	return category;
}
function getRegion() {
	var region = [];
	var length = $(".comSearch dd a.select input").length;
	var value = "";
	for(var i=0; i<length; i++) {
		if($(".comSearch dd a.select input")[i].name === "region") {
			value += $(".comSearch dd a.select input")[i].value + ",";
		}
	}
	
	value = value.substring(0, value.length-1);
	if(value != null && value != "") {
		region = value.split(",");
	}
	
	return region;
}
function getCost() {
	var cost = [];
	var length = $(".comSearch dd a.select").length;
	var value = "";
	for(var i=0; i<length; i++) {
		if($(".comSearch dd a.select")[i].name != "") {
			value += $(".comSearch dd a.select")[i].name + ",";
		}
	}
	
	value = value.substring(0, value.length-1);
	if(value != null && value != "") {
		cost = value.split(",");
	}
	
	return cost;
}

$(function() {
	$(".searchBtn").click(function() {
		var keyword =  $("#searchInput").val();
		$.ajax({
			url: "search.do",
			data: {keyword : keyword},
			dataType: "json",
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
	})
	
	$(".sortbar li a, .comSearch dd a").click(function() {
		
		var attr = $(this).attr("href").substring(1);
		
		if(attr === "s_hit" || attr === "study_no" || attr === "s_application_period") {
			$(".comSearch a").removeClass();
		} else if(attr === "c") {
			$(".comSearch .cost a.select").removeClass();
		}
		
		
		if(attr === "s_hit") {
			$(".s_hit").addClass("select");
			$(".study_no").removeClass("select");
			$(".s_application_period").removeClass("select");
		} else if(attr === "study_no") {
			$(".s_hit").removeClass("select");
			$(".study_no").addClass("select");
			$(".s_application_period").removeClass("select");
		} else if(attr === "s_application_period") {

			$(".s_hit").removeClass("select");
			$(".study_no").removeClass("select");
			$(".s_application_period").addClass("select");
		}
		
		var select = $(this).attr("class");
		if(select === undefined || select === "") {
			$(this).addClass("select");
		} else if(select === "select") {
			$(this).removeClass();
		}
		
		
		console.log("select : " + select);
		
		console.log("attr : " + attr)
		
		var orderby = getOrderBy();
		var category = getCategory();
		var region = getRegion();
		var cost = getCost();
		
		console.log("orderby : " + orderby);
		console.log("category : " + category);
		console.log("region : " + region);
		
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "list2.do",
			data : {orderby : orderby, category : category, region : region, cost : cost},
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
						<li><a class="s_hit select" href="#s_hit">인기모임순</a></li>
						<li><a class="study_no" href="#study_no">최근등록순</a></li>
						<li><a class="s_application_period" href="#s_application_period">마감임박순</a></li>
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
												참여가능</span><span class="entered">참여하기</span>
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
								<div class="cost">
									<dt>참여비용</dt>
									<dd>
										<a href="#c" name="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
											10,000원</a>
									</dd>
									<dd>
										<a href="#c" name="10000">10,000원 ~ 25,000원</a>
									</dd>
									<dd>
										<a href="#c" name="25000">25,000원 ~ 40,000원</a>
									</dd>
									<dd>
										<a href="#c" name="40000">40,000원 ~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
									</dd>
								</div>
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