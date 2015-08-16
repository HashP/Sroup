<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=3a22f3e4a016459e5a21808b4e5c46d3"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sroup</title>
<script type="text/javascript">
$(function() {
	var a = "${studyInfo.start_date_time }";
	var b = "${studyInfo.s_application_period_time }"
	$("span:eq(6)").text(a[0]+a[1]);
	$("span:eq(7)").text(a[3]+a[4]);
	
	$("span:eq(16)").text(b[0]+b[1]);
	$("span:eq(17)").text(b[3]+b[4]);
	
	$('.issueInfo .map>a').fancybox({
			padding : 5,
			width : 760,
			height : 570,
			hideOnContentClick : false,
			hideOnOverlayClick : false,
			centerOnScroll : true,
			cyclic : true,
			titleShow : false,
			transitionIn : 'elastic',
			transitionOut : 'elastic',
			orig : '.issueInfo .map>a>img' // a 까지만 하면 높이가 낮게 검출됨
			,
			autoScale : true,
			autoDimensions : false,
			onComplete : function(a, b, c, d, e) {
				$('#mapzone').show().triggerHandler('show.ofm');
			},
			onCleanup : function(a, b, c) {
				$('#mapzone').hide().appendTo('div.mapWrapper');
			}
		});
	
		var available = "${available.available }";
		if(available === "0") {
			$(".attendMsg").removeAttr("style", "display");
			$("div.action .attend").attr("style", "display: none");
			$("div.action .modify").attr("style", "display: none");
			$("center.attend .attend").attr("style", "display:none");
		}
	});
		function join() {
			var study_no = ${studyInfo.study_no }
			var user_id = "adadcc";
			var admit = "${studyInfo.s_admit_method }";
			$.ajax({
				url:"join.do",
				data: {study_no : study_no, user_id : user_id, admit : admit},
				dataType: "text",
				success : function(data) {
					if(data === "Y") {
						alert("참여신청이 완료 되었습니다. 개설자 승인 후 서비스 이용 바랍니다.")
					} else if (data === "N") {
						alert("이미 신청되었습니다.")
					} else if (data === "SELF") {
						alert("개설자 본인은 본인 그룹에 자동으로 속하므로 신청할 수 없습니다.")
					}
				}
			})
		}
		
		function joinCancle() {
			var study_no = ${studyInfo.study_no }
			var user_id = "adadcc";
			var admit = "${studyInfo.s_admit_method }";
			$.ajax({
				url:"joinCancel.do",
				data: {study_no : study_no, user_id : user_id},
				dataType: "text",
				
				success : function(data) {
					if(data === "Y") {
						alert("참여신청이 취소되었습니다.");
					} else if(data === "N") {
						alert("참여신청이 되어있지 않습니다.");
					}
				}
			})
		}
	
	
</script>
</head>
<body class="sroup">
	<div class="skinCustom"
		style="overflow: hidden; background-color: #dfe9f4; background-repeat: repeat; height: 430px; margin-bottom: -409px;">
		<!-- -->
	</div>
	<div class="mgTop">
		<div class="content guest loggedOnlyComment">
			<div class="issueInfo roundBox">
				<div class="title">
					<h3 class="title" title="${studyInfo.study_name }">${studyInfo.study_name }</h3>
				</div>
				<div class="info free">
					<div class="issue">
						<h3 class="title">모임정보</h3>
						<span id="bannerlUrlOriginal"
							src="http://onoffmix.com/images/event/44943"> <!-- 배너 클릭시 출력용 -->
						</span>
						<ul class="event-summary event-mode-view " _idx="44943">
							<li class="event-banner"><a class="event-link"
								href="/sroup/detail.do?no=${studyInfo.study_no } " target="_blank"> <img
									src="/sroup/upload/2015/08/${studyInfo.s_image }"
									alt="${studyInfo.study_name }" />
									<div class="event-banner-border"></div> <span
									class="event-flag-hot"></span>
							</a></li>
							<li class="event-schedule">모임일 : <span
								title=""> <span
									class="number">${studyInfo.write_day.month + 1 }</span>월 <span class="number">${studyInfo.start_date.date }</span>일 (<fmt:formatDate value="${studyInfo.start_date }" pattern="E"/>) <span
									class="number"></span>시 <span class="number"></span>분
							</span></li>
							<li class="event-schedule">참여신청 <span class="colon">:</span>
								<span title=""> <span
									class="number">${studyInfo.write_day.month + 1 }</span>월 <span class="number">${studyInfo.write_day.date }</span>일 (<fmt:formatDate value="${studyInfo.write_day }" pattern="E"/>) <span
									class="number">00</span>시 <span class="number">00</span>분 ~ <span
									class="number">${studyInfo.s_application_period.month + 1 }</span>월 <span class="number">${studyInfo.s_application_period.date }</span>일 (<fmt:formatDate value="${studyInfo.write_day }" pattern="E"/>) <span
									class="number"></span>시 <span class="number"></span>분
							</span></li>
							<li class="event-location">모임장소 <span class="colon">:</span>
								<span title="">${studyInfo.s_area }</span></li>
							<li class="event-graph"><div class="event-graph-bar">
									<div class="event-capacity-standby" style="width: 100%">
										<span>대기자현황</span>
										<div class="event-capacity-attend"
											style="width: 0%; display: none">
											<span>참여자현황</span>
										</div>
									</div>
								</div>
								<div class="event-graph-text event-mode-full">
									* 총 모집인원 <span class="colon">:</span> <span
										class="number event-capacity-total">${studyInfo.s_max_person }</span>명 <span
										class="bar">|</span> 현재참여자 <span
										class="number event-capacity-attend">${studyInfo.s_max_person - available.available }</span>명 
								</div>
								<div class="event-graph-text event-mode-mini">
									* 현재 <span class="number">${available.available }</span>명 참여 가능
								</div></li>
						</ul>
						<div class="action">
						<div class="attendMsg" style="display: none">
							* 본 스터디 인원모집이 마감되었습니다.
						</div>
							<a class="attend" title="참여하기" onclick="join()">참여신청하기</a><span
								class="modify" style="cursor: pointer;" onclick="joinCancle()"><a
								class="cancel" title="참여취소">참여취소</a></span>
						</div>
					</div>
					<div class="groups free">
						본 모임은 <strong>${studyInfo.c_subject }</strong>모임입니다.
						<ul class="group">
							<li><span class="dot2x2">▪</span><span class="group" style="margin: 10px; font-weight: bold; font-size: 14px;">회비
									: <span class="capacity count">${studyInfo.s_dues }</span>원
							</span><span class="closed">마감</span></li>
						</ul>
						<!-- .group end -->
					</div>
					<!-- .groups end -->
					<div class="abstractMoreClose more">
						<div class="abstract">${studyInfo.s_summary }</div>
					</div>
				</div>
				<div class="mapBox">
					<div class="map">
						<a href="#mapzone" id="mapzone2">
							<div class="mapBorder" style="z-index: 1"></div> </a>
					</div>
				</div>
				<script type="text/javascript">
				var Lat = "${studyInfo.map_lat }";
				var Lng = "${studyInfo.map_lng }";

					var oSeoulCityPoint = new nhn.api.map.LatLng(Lat, Lng);
					var defaultLevel = 8;
					var oMap = new nhn.api.map.Map(document
							.getElementById('mapzone2'), {
						point : oSeoulCityPoint,
						zoom : defaultLevel,
						enableWheelZoom : false,
						enableDragPan : false,
						enableDblClickZoom : false,
						mapMode : 0,
						activateTrafficMap : false,
						activateBicycleMap : false,
						minMaxLevel : [ 1, 14 ],
						size : new nhn.api.map.Size(271, 301)
					});

					var oSize = new nhn.api.map.Size(28, 37);
					var oOffset = new nhn.api.map.Size(14, 37);
					var oIcon = new nhn.api.map.Icon(
							'/sroup/resources/images/map_pin.png', oSize,
							oOffset);

					var oInfoWnd = new nhn.api.map.InfoWindow();
					oInfoWnd.setVisible(false);

					var oMarker = new nhn.api.map.Marker(oIcon, {
						title : '마커 : ' + oSeoulCityPoint.toString()
					});
					oMarker.setPoint(oSeoulCityPoint);
					oMap.addOverlay(oMarker);
					$(".nmap_logo_map").remove();
				</script>
			</div>
			<div class="issueDetail roundBox">
				<div class="host ">
					<div class="title">
						<h3>모임 개설자</h3>
						<span class="subTitle">본 모임의 개설자로 문의사항은 <strong>전화</strong>
							또는 <strong>메일</strong>로 문의해 주세요.
						</span>
					</div>
					<div class="profile  ">
						<a class="photo" href="#"> <img src="/sroup/resources/images/profile/${userInfo.profilephoto }" width="50" height="50"
							alt="개설자 프로필사진" />

							<div class="photoBorder"></div>
						</a>

						<div class="body ">
							<div class="innerBody">
								<span class="name">${userInfo.name }</span> <br /> <span class="info">${userInfo.nickname }<span
									class="separator">|</span></span><span class="tel">${userInfo.phone }<span
									class="separator">|</span></span> <span class="email">${userInfo.email }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="description">
					<div class="title">
						<h3>모임 세부설명</h3>
					</div>
					<div class="innerDescription html4style">${studyInfo.s_detail }</div>
				</div>

				<center class="attend">
					<a class="attend" title="참여하기" onclick="join()">참여하기</a>
					<div class="attendMsg" style="display: none">
								* 본 스터디 인원모집이 마감되었습니다.
					</div>
				</center>
				<div class="barBanner">
					<a href="http://www.onoffmix.com/service/partner/sarammajung/"
						target=""> <img
						src="http://cfile1.onoffmix.com/attach/DcomOTixd7l0oMphbZS8hm2hEXT7z8CC"
						alt="" width="664" /></a>
				</div>

				<div id="comment" class="comment" style="position: relative; display: none;">
					<div class="title">
						<h3>온오프믹스 댓글</h3>
						<span class="status"> (<span class="count">108</span>건)
						</span>
					</div>
					<div class="createForm">
						<form method="post" action="/_/xmlProxy/xmlProxy.ofm"
							onsubmit="return false">
							<input type="hidden" value="api.onoffmix.com/event/comment/add"
								name="url" /> <input type="hidden" value="json" name="output" />
							<input type="hidden" value="44943" name="eventIdx" /> <input
								type="hidden" value="0" name="parentIdx" /> <a class="photo"
								href="#guest"> <img
								src="http://static.onoffmix.com/images2/default/userPhoto_50.gif"
								width="50" height="50" alt=" 프로필 사진" />

								<div class="photoBorder">
									<!-- -->
								</div>
							</a>
							<textarea class="fieldOut" name="content" title="댓글을 입력해 보세요."></textarea>
							<input class="submit" type="submit" name="submit" title="내용입력"
								value="내용입력" />
						</form>
					</div>
				</div>

				<div class="tips">
					<div class="title">
						<h3>알아두기 팁</h3>
					</div>
					<dl>
						<dd>
							* 스룹은 스터디를 희망하는 분들을 위한 플랫폼을 제공할 뿐 만나서 스터디를 하는 동안 발생하는 법적인 책임은
							지지 않습니다.
						</dd>
						<dd>* 참여신청 마감시간 이후에는 참여가 불가능 합니다.</dd>
						<dd>* 참여신청 후 모임의 개설자가 승인을 하면 스터디 페이지로 접근이 가능합니다.</dd>
						<dd>
							* 참여할 수 있는 인원에는 제한이 있으며, 인원이 모두 채워진 후에는 참여신청을 할 수 없습니다.  <br />
							앞선 참여자가 중도 하차하거나, 개설자가 충원이 필요하다고 느낄 시 다시 참여가 가능합니다.
						</dd>
					</dl>
				</div>
				<span class="controller"><a class="gotoTop" href="#">맨 위로</a></span>
			</div>
			<div class="sidebarWrapper">
				<div class="innerBorder roundBox">
					<div class="other">
						<h3 class="title">개설자의 다른모임</h3>
						<dl class="issue first hovering">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50366"> <img
									src="http://onoffmix.com/images/event/50366/s"
									alt="[8월6일 무료특강] 한 장으로 정리하는 독서의 기술 (강남1기) 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="[8월6일 무료특강] 한 장으로 정리하는 독서의 기술 (강남1기)"
									href="http://onoffmix.com/event/50366"><span class="dot2x2">▪</span>[8월6일
									무료특강] 한 장으로 정리하는 독서의 기술 (강남1기)</a>
							</dd>
							<dd class="description">
								<span class="number">8</span>월 <span class="number">6</span>일
								(목) <span class="number">2</span><span class="number">0</span>시
								<span class="number">0</span><span class="number">0</span>분 ~ <span
									class="number">2</span><span class="number">2</span>시 <span
									class="number">0</span><span class="number">0</span>분
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/44810"> <img
									src="http://onoffmix.com/images/event/44810/s"
									alt="[5월 마감임박] 복잡한 생각을 스마트하게 정리하는 방법 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="[5월 마감임박] 복잡한 생각을 스마트하게 정리하는 방법"
									href="http://onoffmix.com/event/44810"><span class="dot2x2">▪</span>[5월
									마감임박] 복잡한 생각을 스마트하게 정리하는 방법</a>
							</dd>
							<dd class="description">
								<span class="number">5</span>월 <span class="number">8</span>일
								(금) <span class="number">1</span><span class="number">9</span>시
								<span class="number">0</span><span class="number">0</span>분 ~ <span
									class="number">2</span><span class="number">1</span>시 <span
									class="number">0</span><span class="number">0</span>분
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/44872"> <img
									src="http://onoffmix.com/images/event/44872/s"
									alt="자녀교육에 관심이 많은 학부모님 선생님 무료 초대합니다. 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="자녀교육에 관심이 많은 학부모님 선생님 무료 초대합니다."
									href="http://onoffmix.com/event/44872"><span class="dot2x2">▪</span>자녀교육에
									관심이 많은 학부모님 선생님 무료 초대합니다.</a>
							</dd>
							<dd class="description">
								<span class="number">5</span>월 <span class="number">9</span>일
								(토) <span class="number">1</span><span class="number">9</span>시
								<span class="number">0</span><span class="number">0</span>분 ~ <span
									class="number">2</span><span class="number">1</span>시 <span
									class="number">0</span><span class="number">0</span>분
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/44819"> <img
									src="http://onoffmix.com/images/event/44819/s"
									alt="[5월 무료세미나] 복잡한 생각을 스마트하게 정리하는 방법 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="[5월 무료세미나] 복잡한 생각을 스마트하게 정리하는 방법"
									href="http://onoffmix.com/event/44819"><span class="dot2x2">▪</span>[5월
									무료세미나] 복잡한 생각을 스마트하게 정리하는 방법</a>
							</dd>
							<dd class="description">
								<span class="number">5</span>월 <span class="number">8</span>일
								(금) <span class="number">7</span>시 <span class="number">0</span><span
									class="number">0</span>분 ~ <span class="number">9</span>시 <span
									class="number">0</span><span class="number">0</span>분
							</dd>
						</dl>
					</div>
					<!-- .other end -->
					<div class="popular">
						<h3 class="title">온오프믹스 인기모임</h3>
						<dl class="issue first">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50634"> <img
									src="http://onoffmix.com/images/event/50634/s"
									alt="[무료초대] 연극 &#039;괴담&#039; 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="[무료초대] 연극 &#039;괴담&#039;"
									href="http://onoffmix.com/event/50634"><span class="dot2x2">▪</span>[무료초대]
									연극 '괴담'</a>
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/51101"> <img
									src="http://onoffmix.com/images/event/51101/s"
									alt="스타트업의 자금조달방안(정부지원자금&amp;크라우드펀딩) 관련 강연/경험공유 등 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="스타트업의 자금조달방안(정부지원자금&amp;크라우드펀딩) 관련 강연/경험공유 등"
									href="http://onoffmix.com/event/51101"><span class="dot2x2">▪</span>스타트업의
									자금조달방안(정부지원자금&크라우드펀딩) 관련 강연/경험공유 등</a>
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50410"> <img
									src="http://onoffmix.com/images/event/50410/s"
									alt="[20X20 #청년] 2회 &quot;me치고 싶을 때&quot;, 미치고싶은 당신이라면 놓치지마세요! 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a
									title="[20X20 #청년] 2회 &quot;me치고 싶을 때&quot;, 미치고싶은 당신이라면 놓치지마세요!"
									href="http://onoffmix.com/event/50410"><span class="dot2x2">▪</span>[20X20
									#청년] 2회 "me치고 싶을 때", 미치고싶은 당신이라면 놓치지마세요!</a>
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50411"> <img
									src="http://onoffmix.com/images/event/50411/s"
									alt="[무료] 대통령배 e스포츠대회 (KeG) 경기지역 본선 이벤트 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="[무료] 대통령배 e스포츠대회 (KeG) 경기지역 본선 이벤트"
									href="http://onoffmix.com/event/50411"><span class="dot2x2">▪</span>[무료]
									대통령배 e스포츠대회 (KeG) 경기지역 본선 이벤트</a>
							</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50938"> <img
									src="http://onoffmix.com/images/event/50938/s"
									alt="Paul Bassett(폴 바셋) 홈 바리스타 커피클래스 대표이미지" />

									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="Paul Bassett(폴 바셋) 홈 바리스타 커피클래스"
									href="http://onoffmix.com/event/50938"><span class="dot2x2">▪</span>Paul
									Bassett(폴 바셋) 홈 바리스타 커피클래스</a>
							</dd>
						</dl>
					</div>
					<div class="today">
						<h3 class="title">오늘의 모임</h3>
						<dl class="issue first hovering">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50863"> <img
									src="http://cfile1.onoffmix.com/attach/vcNj6FQgQ8ujslI4maSFso6SxVM1W77G"
									alt="포스코 창업기획사 창업팀 대상 모집 대표이미지" />
									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="포스코 창업기획사 창업팀 대상 모집"
									href="http://onoffmix.com/event/50863"><span class="dot2x2">▪</span>포스코
									창업기획사 창업팀 대상 모집</a>
							</dd>
							<dd class="description">8월 20일 (목) 0시 00분 ~ 0시 00분</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50452"> <img
									src="http://cfile1.onoffmix.com/attach/OFgkpO3qFM1kMKbMobZROkQQjoq6gzb0"
									alt="2015 아이디어용광로 4,5,6기 동시 모집! 대표이미지" />
									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a title="2015 아이디어용광로 4,5,6기 동시 모집!"
									href="http://onoffmix.com/event/50452"><span class="dot2x2">▪</span>2015
									아이디어용광로 4,5,6기 동시 모집!</a>
							</dd>
							<dd class="description">8월 18일 (화) 9시 00분 ~ 10월 22일 (목) 17시
								30분</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50541"> <img
									src="http://cfile1.onoffmix.com/attach/kuZ403CxF5r6oX4orZuNDrLT5QL1rVZs"
									alt="한·중·일 패션 웨어러블 메이커톤(Fashion Wearable Make A Thon) 참가자 모집 대표이미지" />
									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a
									title="한·중·일 패션 웨어러블 메이커톤(Fashion Wearable Make A Thon) 참가자 모집"
									href="http://onoffmix.com/event/50541"><span class="dot2x2">▪</span>한·중·일
									패션 웨어러블 메이커톤(Fashion Wearable Make A Thon) 참가자 모집</a>
							</dd>
							<dd class="description">8월 4일 (화) 9시 00분 ~ 11월 29일 (일) 19시
								00분</dd>
						</dl>
						<dl class="issue ">
							<dt class="banner">
								<a href="http://onoffmix.com/event/50298"> <img
									src="http://onoffmix.com/images/event/50298/s"
									alt="총 3000만원의 사업화 지원금! 2015 WISET Startup Springboard 창업캠프 대표이미지" />
									<div class="bannerBorder"></div>
								</a>
							</dt>
							<dd class="subject">
								<a
									title="총 3000만원의 사업화 지원금! 2015 WISET Startup Springboard 창업캠프"
									href="http://onoffmix.com/event/50298"><span class="dot2x2">▪</span>총
									3000만원의 사업화 지원금! 2015 WISET Startup Springboard 창업캠프</a>
							</dd>
							<dd class="description">8월 21일 (금) 1시 00분 ~ 8월 23일 (일) 18시
								30분</dd>
						</dl>
					</div>
					<div class="adBox">
						<a class="eventLink"
							href='http://www.onoffmix.com/service/partner/gifticon/'
							target=''>
							<div class="photoBorder">
								<img
									src="http://cfile1.onoffmix.com/attach/iJ9yZC2XZDPgPUBz1SyBggfUqrvMV82E"
									width="234" border="0" alt="온오프믹스의 기프티콘 서비스 안내" />
							</div>
						</a>
					</div>
					<div class="hr singleLine"
						style="margin: 14px -14px -10px; border-color: #e8e8e8">
						<!-- -->
					</div>

					<div class="faq">
						<h3 class="title">자주하는 질문</h3>
						<a href="/faq/" target="_blank" class="more">더보기</a>

						<div class="list">
							<dl class="inquiry first">
								<dd>
									<a target="_blank" href="/cs/faq/attendee#4">참석자와 대기자는 무엇이
										다른 건가요?</a>
								</dd>
							</dl>
							<dl class="inquiry">
								<dd>
									<a target="_blank" href="/cs/faq/attendee#10">모임 신청
										확인/수정/취소 방법 알려 주세요</a>
								</dd>
							</dl>
							<dl class="inquiry">
								<dd>
									<a target="_blank" href="/cs/faq/attendee#11">대리참석 가능한가요?</a>
								</dd>
							</dl>
							<dl class="inquiry">
								<dd>
									<a target="_blank" href="/cs/faq/attendee#12">이름, 이메일은 수정
										가능한가요?</a>
								</dd>
							</dl>
							<dl class="inquiry">
								<dd>
									<a target="_blank" href="/cs/faq/attendee#13">행사 진행 관련 질문은
										어디서 하나요?</a>
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<a class="eventLink" href='http://onoffmix.com/event/50662'
					target=''>
					<div class="photoBorder">
						<img
							src="http://cfile1.onoffmix.com/attach/172VtqPw7YYAq2e9lTlt67s6tSu3qvov"
							width="265" border="0" alt="제7회 대한민국 우수상품전 2015, 9월 코엑스에서 개최!" />
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="mapWrapper" style="display: none;">
			<div id="mapzone"></div>
	</div>
	<script type="text/javascript">
								var Lat = "${studyInfo.map_lat }";
								var Lng = "${studyInfo.map_lng }";
								
								var oSeoulCityPoint = new nhn.api.map.LatLng(
										Lat, Lng);
								var defaultLevel = 11;
								var oMap = new nhn.api.map.Map(document
										.getElementById('mapzone'), {
									point : oSeoulCityPoint,
									zoom : defaultLevel,
									enableWheelZoom : true,
									enableDragPan : true,
									enableDblClickZoom : false,
									mapMode : 0,
									activateTrafficMap : false,
									activateBicycleMap : false,
									minMaxLevel : [ 1, 14 ],
									size : new nhn.api.map.Size(760, 570)
								});
								var oSlider = new nhn.api.map.ZoomControl();
								oMap.addControl(oSlider);
								oSlider.setPosition({
									top : 40,
									left : 10
								});

								var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
								oMap.addControl(oMapTypeBtn);
								oMapTypeBtn.setPosition({
									top : 10,
									left : 10
								});

								var oSize = new nhn.api.map.Size(28, 37);
								var oOffset = new nhn.api.map.Size(14, 37);
								var oIcon = new nhn.api.map.Icon(
										'/sroup/resources/images/map_pin.png',
										oSize, oOffset);

								var oInfoWnd = new nhn.api.map.InfoWindow();
								oInfoWnd.setVisible(false);
								
								var oMarker = new nhn.api.map.Marker(oIcon,
										{
											title : '마커 : '
													+ oSeoulCityPoint.toString()
										});
								oMarker.setPoint(oSeoulCityPoint);
								oMap.addOverlay(oMarker);
								
							</script>
</body>
</html>