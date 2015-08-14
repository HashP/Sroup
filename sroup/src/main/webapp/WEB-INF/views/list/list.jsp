<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sroup</title>
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
								href="http://onoffmix.com/event/49320" target="_blank"><img
									src="/sroup/upload/2015/08/${l.s_image }"
									alt="${l.study_name }" width="220" height="220"
									class="thumb" /></a></li>
							<li class="eventTitle"><a
								href="http://onoffmix.com/event/49320" class="eventLink"
								title="${l.study_name }" target="_blank">${l.study_name }</a></li>
							<li class="eventBottomArea">
								<ul>
									<li class="eventPin"><a href="#pin"><span
											class="heart">찜</span></a>
									<li class="eventPersonnel"><a href="/rsvp/attend/49320"
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
						<input type="hidden" name="pageRows" value="12" _default="12"
							_search="12" /> <input type="hidden" name="page" value="1" /> <input
							type="hidden" id="sort-popularity"
							value="if(recruitEndDateTime-NOW()>0# 1# 0)|DESC,FIND_IN_SET('advance'#wayOfRegistration)|DESC,popularity|DESC,idx|DESC" />
						<input type="hidden" id="sort-latest"
							value="if(recruitEndDateTime-NOW()>0# 1# 0)|DESC,FIND_IN_SET('advance'#wayOfRegistration)|DESC,idx|DESC" />
						<input type="hidden" id="sort-soon"
							value="if(recruitEndDateTime-NOW()>0# 1# 0)|DESC,FIND_IN_SET('advance'#wayOfRegistration)|DESC,abs(recruitEndDateTime-NOW())|ASC" />
						<input type="hidden" id="sort-category" value="categoryIdx|ASC" />
						<input type="hidden" name="sort"
							value="if(recruitEndDateTime-NOW()>0# 1# 0)|DESC,FIND_IN_SET('advance'#wayOfRegistration)|DESC,popularity|DESC,idx|DESC" />

						<input type="hidden" name="searchAll" value="" /> <input
							type="hidden" name="exclude" value="" /> <input type="hidden"
							name="numLT" value="" _value="7" />
						<!-- 6개까지 출력하고, 7개째가 있으면 더보기 판단 -->
						<input type="hidden" name="getPinCount" value="true" /> <input
							type="hidden" name="getAttendCount" value="true" /> <input
							type="hidden" name="deabuse" value="true" />
						<fieldset>
							<legend>모임제목 / 본문</legend>
							<dl>
								<dt>
									<span>모임제목 / 본문</span> <span class="chkEvent"><input
										type="checkbox" id="closedEvent" name="searchClosedEvents"
										value="1" /><label for="closedEvent">종료된 모임만</label></span>
								</dt>
								<dd>
									<input type="text" name="s" placeholder="키워드로 모임을 검색하세요"
										value="" title="키워드로 모임을 검색하세요" /> <input type="image"
										src="http://static.onoffmix.com/images3/main/btnEventSearch.gif"
										class="btnEventSearch" alt="검색" />
								</dd>
							</dl>
							<dl class="comSearch category">
								<dt>카테고리</dt>
								<c:forEach var="c" items="${categories }">
									<dd>
										<a href="#" title="${c.subject }"> <input type="checkbox"
											name="category[]" value="${c.sub_value }" /> ${c.subject }
										</a>
									</dd>
								</c:forEach>
									<dd>
										<a href="#" title="" > <input type="checkbox"
											name="category[]" value="" />
										</a>
									</dd>
							</dl>
							<dl class="comSearch category location">
								<dt>지역</dt>
								<c:forEach var="a" items="${area }">
									<dd>
										<a href="#" title="${a.area }"> <input type="checkbox"
											name="region[]" value="${a.area_value }" /> ${a.area }
										</a>
									</dd>
								</c:forEach>
							</dl>
							<dl class="comSearch category week">
								<dt>요일/시간</dt>
								<dd>
									<a href="#" title="주중"> <input type="checkbox"
										name="eventStartWeekday[]" value="0,1,2,3,4" /> 주중
									</a>
								</dd>
								<dd>
									<a href="#" title="주말"> <input type="checkbox"
										name="eventStartWeekday[]" value="5,6" /> 주말
									</a>
								</dd>
								<dd>
									<a href="#" title="오전"> <input type="checkbox"
										name="eventStartTimeSpan[]" value="6-11" /> 오전
									</a>
								</dd>
								<dd>
									<a href="#" title="오후"> <input type="checkbox"
										name="eventStartTimeSpan[]" value="12-17" /> 오후
									</a>
								</dd>
								<dd>
									<a href="#" title="저녁"> <input type="checkbox"
										name="eventStartTimeSpan[]" value="18-23" /> 저녁
									</a>
								</dd>
								<dd>
									<a href="#" title="새벽"> <input type="checkbox"
										name="eventStartTimeSpan[]" value="0-5" /> 새벽
									</a>
								</dd>
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
							<dl class="comSearch date">
								<dt>모임시작일</dt>
								<dd>
									<p class="positionArea">
										<span class="bulCalendar1"><img
											src="http://static.onoffmix.com/images3/main/bulCalendar.png"
											alt="calendar" /></span><input id="startEventDate"
											class="datepicker" type="text" name="eventStartDate" /> ~ <span
											class="bulCalendar2"><img
											src="http://static.onoffmix.com/images3/main/bulCalendar.png"
											alt="calendar" /></span><input id="endEventDate" class="datepicker"
											type="text" name="eventEndDate" />
									</p>
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