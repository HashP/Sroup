<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript"
	src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sroup/resources/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css"
	media="screen" />
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=fdfd44094bda508193c65c95eea570d5"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sroup</title>
<script type="text/javascript">
	$(function() {
		var user = "${loginId}";
		var studyId = "${userInfo.id}";
		if (user === studyId) {
			$(".detailBtn a").attr("style", "display : inline-block;  cursor: pointer;");
		}

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
		if (available === "0") {
			$(".attendMsg").removeAttr("style", "display");
			$("div.action .attend").attr("style", "display: none");
			$("div.action .modify").attr("style", "display: none");
			$("center.attend .attend").attr("style", "display:none");
		}

		$(".today .issue").mouseover(function() {
			$(".today .issue").removeClass("hovering");
			$(this).addClass("hovering");
		});

		$(".today .issue:eq(0)").addClass("hovering");

	});
	
	function del() {
		
		var study_no = "${studyInfo.study_no}";
	    if (confirm("삭제하시면 복구가 되지 않습니다. 그래도 삭제하시겠습니까?") == true) {
	        $.ajax({
	        	url : "hidden.do",
	        	data : {study_no : study_no},
	        	dataType : "text",
	        	success : function(data) {
	        		if(data === "Y") {
	        			location.href="/sroup/list.do";
	        		} else if(data === "N") {
	        			alert("스터디에 소속된 인원이 있어 삭제할 수 없습니다.");
	        		}
	        	}
	        })
	    } else {
	        return;
	    }
	}
	
	function mod() {
		location.href="/sroup/mod.do?no="+${studyInfo.study_no};
	}

	function join() {
		var study_no = "${studyInfo.study_no}";
		var user_id = "${loginId}";
		var admit = "${studyInfo.s_admit_method }";
		var studyAdmin = "${studyInfo.user_id}";
		
		if (user_id === "a") {
			alert("참여 신청은 로그인 후 가능합니다.");
			return;
		}
		$.ajax({
			url : "join.do",
			data : {
				study_no : study_no,
				user_id : user_id,
				admit : admit,
				studyAdmin : studyAdmin
			},
			dataType : "text",
			success : function(data) {
				if (data === "Y") {
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
		var study_no = "${studyInfo.study_no}";
		var user_id = "${loginId}";
		var admit = "${studyInfo.s_admit_method }";
		$.ajax({
			url : "joinCancel.do",
			data : {
				study_no : study_no,
				user_id : user_id
			},
			dataType : "text",

			success : function(data) {
				if (data === "Y") {
					alert("참여신청이 취소되었습니다.");
				} else if (data === "N") {
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
								href="/sroup/detail.do?no=${studyInfo.study_no } "
								target="_blank"> <img
									src="/sroup/upload/2015/08/${studyInfo.s_image }"
									alt="${studyInfo.study_name }" />
									<div class="event-banner-border"></div> <span
									class="event-flag-hot"></span>
							</a></li>
							<li class="event-schedule">모임일 : <span title=""> <span
									class="number">${studyInfo.write_day.month + 1 }</span>월 <span
									class="number">${studyInfo.start_date.date }</span>일 (<fmt:formatDate
										value="${studyInfo.start_date }" pattern="E" />) <span
									class="number">${fn:split(studyInfo.start_date_time, ':')[0] }</span>시 <span class="number">${fn:split(studyInfo.start_date_time, ':')[1] }</span>분
							</span></li>
							<li class="event-schedule">참여신청 <span class="colon">:</span>
								<span title=""> <span class="number">${studyInfo.write_day.month + 1 }</span>월
									<span class="number">${studyInfo.write_day.date }</span>일 (<fmt:formatDate
										value="${studyInfo.write_day }" pattern="E" />) <span
									class="number">00</span>시 <span class="number">00</span>분 ~ <span
									class="number">${studyInfo.s_application_period.month + 1 }</span>월
									<span class="number">${studyInfo.s_application_period.date }</span>일
									(<fmt:formatDate value="${studyInfo.write_day }" pattern="E" />)
									<span class="number">${fn:split(studyInfo.s_application_period_time, ':')[0] }</span>시 <span class="number">${fn:split(studyInfo.s_application_period_time, ':')[1] }</span>분
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
										class="number event-capacity-total">${studyInfo.s_max_person }</span>명
									<span class="bar">|</span> 현재참여자 <span
										class="number event-capacity-attend">${studyInfo.s_max_person - available.available }</span>명
								</div>
								<div class="event-graph-text event-mode-mini">
									* 현재 <span class="number">${available.available }</span>명 참여 가능
								</div></li>
						</ul>
						<div class="action">
							<div class="attendMsg" style="display: none">* 본 스터디 인원모집이
								마감되었습니다.</div>
							<a class="attend" title="참여하기" onclick="join()">참여신청하기</a><span
								class="modify" style="cursor: pointer;" onclick="joinCancle()"><a
								class="cancel" title="참여취소">참여취소</a></span>
						</div>
					</div>
					<div class="groups free">
						본 모임은 <strong>${studyInfo.c_subject }</strong>모임입니다.
						<ul class="group">
							<li><span class="dot2x2">▪</span><span class="group"
								style="margin: 10px; font-weight: bold; font-size: 14px;">회비
									: <span class="capacity count">${studyInfo.s_dues }</span>원
							</span><span class="closed">마감</span></li>
						</ul>
						<!-- .group end -->
					</div>
					<!-- .groups end -->
					<div class="abstractMoreClose more">
						<div class="abstract">${studyInfo.s_summary }</div>
					</div>
					<div class="detailBtn" style="float: right">
						<a class="mod" style="display: none;" onclick="mod()">수정</a> <a
							class="del" style="display: none;" onclick="del()">삭제</a>
					</div>
				</div>
				<div class="mapBox">
					<div class="map">
						<a href="#mapzone" id="mapzone2">
							<div class="mapBorder" style="z-index: 1"></div>
						</a>
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
						<a class="photo" href="#"> <img
							src="/sroup/resources/images/profile/${userInfo.profilephoto }"
							width="50" height="50" alt="개설자 프로필사진" />

							<div class="photoBorder"></div>
						</a>

						<div class="body ">
							<div class="innerBody">
								<span class="name">${userInfo.name }</span> <br /> <span
									class="info">${userInfo.nickname }<span
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
					<div class="attendMsg" style="display: none">* 본 스터디 인원모집이
						마감되었습니다.</div>
				</center>

				<div id="comment" class="comment"
					style="position: relative; display: none;">
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
						<dd>* 스룹은 스터디를 희망하는 분들을 위한 플랫폼을 제공할 뿐 만나서 스터디를 하는 동안 발생하는 법적인
							책임은 지지 않습니다.</dd>
						<dd>* 참여신청 마감시간 이후에는 참여가 불가능 합니다.</dd>
						<dd>* 참여신청 후 모임의 개설자가 승인을 하면 스터디 페이지로 접근이 가능합니다.</dd>
						<dd>
							* 참여할 수 있는 인원에는 제한이 있으며, 인원이 모두 채워진 후에는 참여신청을 할 수 없습니다. <br />
							앞선 참여자가 중도 하차하거나, 개설자가 충원이 필요하다고 느낄 시 다시 참여가 가능합니다.
						</dd>
					</dl>
				</div>
				<span class="controller"><a class="gotoTop" href="#">맨 위로</a></span>
			</div>
			<div class="sidebarWrapper">
				<div class="innerBorder roundBox">
					<div class="popular">
						<h3 class="title">온오프믹스 인기모임</h3>
						<c:forEach var="l" items="${lists }" begin="0" end="4">
							<dl class="issue first">
								<dd class="subject">
									<a title="${l.study_name }" href="detail.do?no=${l.study_no }"><span
										class="dot2x2">▪</span>${l.study_name }</a>
								</dd>
							</dl>
						</c:forEach>
					</div>
					<div class="today">
						<h3 class="title">오늘의 모임</h3>
						<c:forEach var="l" items="${lists }" begin="5" end="8">
							<dl class="issue first">
								<dt class="banner">
									<a href="detail.do?no=${l.study_no }"> <img
										src="/sroup/upload/2015/08/${l.s_image }"
										alt="${l.study_name }" />
										<div class="bannerBorder"></div>
									</a>
								</dt>
								<dd class="subject">
									<a title="${l.study_name }" href="detail.do?no=${l.study_no }"><span
										class="dot2x2">▪</span>${l.study_name }</a>
								</dd>
								<dd class="description">* ${l.available }명 참여 가능</dd>
							</dl>
						</c:forEach>
					</div>
					<div class="hr singleLine"
						style="margin: 14px -14px -10px; border-color: #e8e8e8">
						<!-- -->
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="mapWrapper" style="display: none;">
		<div id="mapzone"></div>
	</div>
	<script type="text/javascript">
		var Lat = "${studyInfo.map_lat }";
		var Lng = "${studyInfo.map_lng }";

		var oSeoulCityPoint = new nhn.api.map.LatLng(Lat, Lng);
		var defaultLevel = 11;
		var oMap = new nhn.api.map.Map(document.getElementById('mapzone'), {
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
		var oIcon = new nhn.api.map.Icon('/sroup/resources/images/map_pin.png',
				oSize, oOffset);

		var oInfoWnd = new nhn.api.map.InfoWindow();
		oInfoWnd.setVisible(false);

		var oMarker = new nhn.api.map.Marker(oIcon, {
			title : '마커 : ' + oSeoulCityPoint.toString()
		});
		oMarker.setPoint(oSeoulCityPoint);
		oMap.addOverlay(oMarker);
	</script>
</body>
</html>